#!/system/bin/sh
SKIPUNZIP=1

unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2

# Default lang en_US
LANG_VOLUME_KEY_ERROR="- Volume key error!"
LANG_VOLUME_KEY_AGAIN="- Volume key not detected. Try again"
LANG_SELECT_ATYLE="- Select Style: 5G or 5GE "
LANG_SELECT_ATYLE_5G="- Vol Up = 5G "
LANG_SELECT_ATYLE_5GE="- Vol Down = 5GE "
LANG_SELECTED_5G="- Selected 5G "
LANG_SELECTED_5GE="- Selected 5GE "
LANG_WARNING="- Your device is not supported ! "

# Local lang
locale=$(getprop persist.sys.locale|awk -F "-" '{print $1"_"$NF}')
[[ ${locale} == "" ]] && locale=$(settings get system system_locales|awk -F "," '{print $1}'|awk -F "-" '{print $1"_"$NF}')
if [ ${locale} = "zh_CN" ];then
   . "$MODPATH/${locale}.ini"
fi

chmod -R 0755 $MODPATH/file/tools
P7Z=$MODPATH/file/tools/7za

chooseport() {
  # Keycheck binary by someone755 @Github, idea for code below by Zappo @xda-developers
  # Calling it first time detects previous input. Calling it second time will do what we want
  [ "$1" ] && local delay=$1 || local delay=3
  local error=false
  while true; do
    timeout 0 $MODPATH/file/tools/$ARCH32/keycheck
    timeout $delay $MODPATH/file/tools/$ARCH32/keycheck
    local SEL=$?
    if [ $SEL -eq 42 ]; then
      return 0
    elif [ $SEL -eq 41 ]; then
      return 1
    else
      $error && abort "${LANG_VOLUME_KEY_ERROR}"
      error=true
      echo "${LANG_VOLUME_KEY_AGAIN}"
    fi
  done
}

ui_print "${LANG_SELECT_ATYLE}"
ui_print "${LANG_SELECT_ATYLE_5G}"
ui_print "${LANG_SELECT_ATYLE_5GE}"
if chooseport; then
  ui_print "${LANG_SELECTED_5G}"
  addfile=$MODPATH/file/5G
else
  ui_print "${LANG_SELECTED_5GE}"
  addfile=$MODPATH/file/5GE
fi

# Find dir
find /system -name SystemUI.apk > $MODPATH/dir.txt
find_dir_text=$(cat $MODPATH/dir.txt)
if [[ ! ${find_dir_tex} ]]; then
   rm -rf $MODPATH/dir.txt
   find /system -name *SystemUI.apk > $MODPATH/dir.txt
   find_dir_text=$(cat $MODPATH/dir.txt)
   if [[ ! ${find_dir_tex} ]]; then
      rm -rf $MODPATH/dir.txt
      find /system -name SystemUI*.apk > $MODPATH/dir.txt
      find_dir_text=$(cat $MODPATH/dir.txt)
      if [[ ! ${find_dir_tex} ]]; then
         abort "${LANG_WARNING}"
      fi
   fi
fi

# Inject file
apkname=$(cat $MODPATH/dir.txt | awk -F '/' '{print $NF}')
sed -i 's/\/'$apkname'//' $MODPATH/dir.txt
dir=$(sed -n '1p' $MODPATH/dir.txt)
mkdir -p $MODPATH$dir
cp -f $dir/$apkname $TMPDIR/SystemUI.zip
$P7Z a $TMPDIR/SystemUI.zip $addfile/res
cp $TMPDIR/SystemUI.zip $MODPATH$dir/$apkname

# Delete unnecessary files
rm -rf $MODPATH/file
rm -rf $MODPATH/dir.txt
rm -rf $MODPATH/*.md

set_perm_recursive $MODPATH 0 0 0755 0644
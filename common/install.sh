#!/system/bin/sh
P7Z=$TMPDIR/common/tools/7za
chmod 755 $P7Z

ui_print " Select Style: 5G or 5GE "
ui_print " 选择样式：5G或5GE "
ui_print " Vol Up = 5G "
ui_print "  音量+键= 5G "
ui_print "  Vol Down = 5GE "
ui_print "  音量–键= 5GE "
if $VKSEL; then
  ui_print " Selected 5G "
  ui_print " 已选择 5G "
  addfile=$TMPDIR/common/5G
else
  ui_print " Selected 5GE "
  ui_print " 已选择 5GE "
  addfile=$TMPDIR/common/5GE
fi

find /system -name SystemUI.apk > $MODPATH/dir.txt
if [ ! -s $MODPATH/dir.txt ]; then
   rm -rf $MODPATH/dir.txt
   find /system -name *SystemUI.apk > $MODPATH/dir.txt
   if [ ! -s $MODPATH/dir.txt ]; then
      rm -rf $MODPATH/dir.txt
      find /system -name SystemUI*.apk > $MODPATH/dir.txt
      if [ ! -s $MODPATH/dir.txt ]; then
         ui_print "Your device is not supported ! "
         abort "不支持你的设备 !"
      fi
   fi
fi
apkname=$(cat $MODPATH/dir.txt | awk -F '/' '{print $NF}')
sed -i 's/\/'$apkname'//' $MODPATH/dir.txt
dir=$(sed -n '1p' $MODPATH/dir.txt)
mkdir -p $MODPATH$dir
cp -f $dir/$apkname $TMPDIR/SystemUI.zip
$P7Z a $TMPDIR/SystemUI.zip $addfile/res
cp $TMPDIR/SystemUI.zip $MODPATH$dir/$apkname

rm -rf $MODPATH/dir.txt
rm -rf $MODPATH/README_zh.md

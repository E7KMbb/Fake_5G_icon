#!/system/bin/sh
P7Z=$TMPDIR/common/tools/7za
addfile=$TMPDIR/common/addfile
chmod 755 $P7Z
var_miui="`grep_prop ro.miui.ui.version.*`"
var_lg="`grep_prop ro.vendor.lge.swversion_vendor`"
if [ $var_miui ]; then
ui_print "This module does not support MIUI"
abort "本模块不支持MIUI"
else
if [ $var_lg ]; then
ui_print "This module does not support LG"
abort "本模块不支持LG"
else
find /system -name SystemUI*.apk > $MODPATH/directory.txt
find /system -name *SystemUI.apk > $MODPATH/directory.txt
cp -f $MODPATH/directory.txt $MODPATH/directoryname.txt
sed -i 's/\/SystemUI*.apk//' $MODPATH/directory.txt
sed -i 's/\/*SystemUI.apk//' $MODPATH/directory.txt
directory=$(cat $MODPATH/directory.txt)
directoryname=$(cat $MODPATH/directoryname.txt)
mkdir -p $directory
cp -f $directoryname $TMPDIR/SystemUI.zip
$P7Z a $TMPDIR/SystemUI.zip $addfile/res
cp $TMPDIR/SystemUI.zip $directoryname
rm -rf $MODPATH/*.txt
fi
fi
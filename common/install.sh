#!/system/bin/sh
P7Z=$TMPDIR/common/tools/7za
addfile=$TMPDIR/common/addfile
chmod 755 $P7Z
if [ -e /system/product/priv-app/SystemUI ]; then
# Android10 following the usual directory
# Android10通常目录
sed -i "s/<device>/Android10Usually/g" $MODPATH/module.prop
mkdir -p $MODPATH/system/product/priv-app/SystemUI
#rm -rf $MODPATH/system/priv-app > /dev/null
cp -f /system/product/priv-app/SystemUI/SystemUI.apk $TMPDIR/SystemUI.zip
$P7Z a $TMPDIR/SystemUI.zip $addfile/res
cp $TMPDIR/SystemUI.zip $MODPATH/system/product/priv-app/SystemUI/SystemUI.apk
else
if [ -e /system/priv-app/SystemUI ]; then
# Android10 below
# Android10以下通常目录
sed -i "s/<device>/Android10BelowUsually/g" $MODPATH/module.prop
mkdir -p $MODPATH/system/priv-app/SystemUI
#rm -rf $MODPATH/system/product > /dev/null
cp -f /system/priv-app/SystemUI/SystemUI.apk $TMPDIR/SystemUI.zip
$P7Z a $TMPDIR/SystemUI.zip $addfile/res
cp $TMPDIR/SystemUI.zip $MODPATH/system/priv-app/SystemUI/SystemUI.apk
else
if [ -e /system/product/priv-app/SystemUIGoogle ]; then
# Google native Android10
# Google原生Android10
sed -i "s/<device>/GoogleNativeAndroid10/g" $MODPATH/module.prop
mkdir -p $MODPATH/system/product/priv-app/SystemUIGoogle
#rm -rf $MODPATH/system/priv-app > /dev/null
cp -f /system/product/priv-app/SystemUIGoogle/SystemUIGoogle.apk $TMPDIR/SystemUIGoogle.zip
$P7Z a $TMPDIR/SystemUIGoogle.zip $addfile/res
cp $TMPDIR/SystemUIGoogle.zip $MODPATH/system/product/priv-app/SystemUIGoogle/SystemUIGoogle.apk
else
if [ -e /system/priv-app/SystemUIGoogle ]; then
# Google native Android10 below
# Google原生Android10以下
sed -i "s/<device>/GoogleNativeAndroid10Below/g" $MODPATH/module.prop
mkdir -p $MODPATH/system/priv-app/SystemUIGoogle
#rm -rf $MODPATH/system/product > /dev/null
cp -f /system/priv-app/SystemUIGoogle/SystemUIGoogle.apk $TMPDIR/SystemUIGoogle.zip
$P7Z a $TMPDIR/SystemUIGoogle.zip $addfile/res
cp $TMPDIR/SystemUIGoogle.zip $MODPATH/system/priv-app/SystemUIGoogle/SystemUIGoogle.apk
else
if [ -e /system/product/priv-app/OPSystemUI ]; then
# OnePlus Android10
# 一加氢、氧OS，Android10
sed -i "s/<device>/OnePlusAndroid10/g" $MODPATH/module.prop
mkdir -p $MODPATH/system/product/priv-app/OPSystemUI
#rm -rf $MODPATH/system/priv-app > /dev/null
cp -f /system/product/priv-app/OPSystemUI/OPSystemUI.apk $TMPDIR/OPSystemUI.zip
$P7Z a $TMPDIR/OPSystemUI.zip $addfile/res
cp $TMPDIR/OPSystemUI.zip $MODPATH/system/product/priv-app/OPSystemUI/OPSystemUI.apk
else
if [ -e /system/priv-app/OPSystemUI ]; then
# OnePlus Android10 below
# 一加氢、氧OS，Android10以下
sed -i "s/<device>/OnePlusAndroid10Below/g" $MODPATH/module.prop
mkdir -p $MODPATH/system/priv-app/OPSystemUI
#rm -rf $MODPATH/system/product > /dev/null
cp -f /system/priv-app/OPSystemUI/OPSystemUI.apk $TMPDIR/OPSystemUI.zip
$P7Z a $TMPDIR/OPSystemUI.zip $addfile/res
cp $TMPDIR/OPSystemUI.zip $MODPATH/system/priv-app/OPSystemUI/OPSystemUI.apk
else
ui_print "Your device is not supported yet! "
ui_print "Please tell the developer where your SystemUI.apk is located"
abort "暂不支持你的设备！请告诉开发者你SystemUI.apk所在目录"
fi
fi
fi
fi
fi
fi


#!/system/bin/sh
P7Z=$TMPDIR/common/tools/7za
addfile=$TMPDIR/common/addfile
chmod 755 $P7Z
if [ -e /system/product/priv-app/SystemUI ]; then
#Android10通常目录
sed -i "s/<device>/Android10Usually/g" $MODPATH/module.prop
cp -f /system/product/priv-app/SystemUI/SystemUI.apk $TMPDIR/SystemUI.zip
$P7Z a $TMPDIR/SystemUI.zip $addfile/res
cp $TMPDIR/SystemUI.zip $MODPATH/system/product/priv-app/SystemUI/SystemUI.apk
else
if [ -e /system/priv-app/SystemUI ]; then
#Android10以下通常目录
sed -i "s/<device>/Android10BelowUsually/g" $MODPATH/module.prop
cp -f /system/priv-app/SystemUI/SystemUI.apk $TMPDIR/SystemUI.zip
$P7Z a $TMPDIR/SystemUI.zip $addfile/res
cp $TMPDIR/SystemUI.zip $MODPATH/system/priv-app/SystemUI/SystemUI.apk
else
if [ -e /system/product/priv-app/SystemUIGoogle ]; then
#Google原生Android10
sed -i "s/<device>/GoogleNativeAndroid10/g" $MODPATH/module.prop
cp -f /system/product/priv-app/SystemUIGoogle/SystemUIGoogle.apk $TMPDIR/SystemUIGoogle.zip
$P7Z a $TMPDIR/SystemUIGoogle.zip $addfile/res
cp $TMPDIR/SystemUIGoogle.zip $MODPATH/system/product/priv-app/SystemUIGoogle/SystemUIGoogle.apk
else
if [ -e /system/priv-app/SystemUIGoogle ]; then
#Google原生Android10以下
sed -i "s/<device>/GoogleNativeAndroid10Below/g" $MODPATH/module.prop
cp -f /system/priv-app/SystemUIGoogle/SystemUIGoogle.apk $TMPDIR/SystemUIGoogle.zip
$P7Z a $TMPDIR/SystemUIGoogle.zip $addfile/res
cp $TMPDIR/SystemUIGoogle.zip $MODPATH/system/priv-app/SystemUIGoogle/SystemUIGoogle.apk
else
if [ -e /system/product/priv-app/OPSystemUI ]; then
#一加氢、氧OS，Android10
sed -i "s/<device>/OnePlusAndroid10/g" $MODPATH/module.prop
cp -f /system/product/priv-app/OPSystemUI/OPSystemUI.apk $TMPDIR/OPSystemUI.zip
$P7Z a $TMPDIR/OPSystemUI.zip $addfile/res
cp $TMPDIR/OPSystemUI.zip $MODPATH/system/product/priv-app/OPSystemUI/OPSystemUI.apk
else
if [ -e /system/priv-app/OPSystemUI ]; then
#一加氢、氧OS，Android10以下
sed -i "s/<device>/OnePlusAndroid10Below/g" $MODPATH/module.prop
cp -f /system/priv-app/OPSystemUI/OPSystemUI.apk $TMPDIR/OPSystemUI.zip
$P7Z a $TMPDIR/OPSystemUI.zip $addfile/res
cp $TMPDIR/OPSystemUI.zip $MODPATH/system/priv-app/OPSystemUI/OPSystemUI.apk
else
if [ -e /system/product/priv-app/LGSystemUI ]; then
#LGAndroid10
sed -i "s/<device>/LGAndroid10/g" $MODPATH/module.prop
cp -f /system/product/priv-app/LGSystemUI/LGSystemUI.apk $TMPDIR/LGSystemUI.zip
$P7Z a $TMPDIR/LGSystemUI.zip $addfile/res
cp $TMPDIR/LGSystemUI.zip $MODPATH/system/product/priv-app/LGSystemUI/LGSystemUI.apk
else
if [ -e /system/priv-app/LGSystemUI ]; then
#LGAndroid10以下
sed -i "s/<device>/LGAndroid10Below/g" $MODPATH/module.prop
cp -f /system/priv-app/LGSystemUI/LGSystemUI.apk $TMPDIR/LGSystemUI.zip
$P7Z a $TMPDIR/LGSystemUI.zip $addfile/res
cp $TMPDIR/LGSystemUI.zip $MODPATH/system/priv-app/LGSystemUI/LGSystemUI.apk
else
abort "不支持你的设备！"
fi
fi
fi
fi
fi
fi
fi
fi
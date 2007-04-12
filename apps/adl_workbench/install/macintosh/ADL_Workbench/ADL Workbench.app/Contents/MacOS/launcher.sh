#!/bin/bash

if [ -r ~/.bashrc ]; then
    source ~/.bashrc
fi

echo -----------------------------------------
echo Launching the X server

ps -wx -ocommand | grep -e '[X]11' > /dev/null

if [ "$?" != "0" -a ! -f ~/.xinitrc ]; then
        echo "rm -f ~/.xinitrc" > ~/.xinitrc
        sed 's/xterm/# xterm/' /usr/X11R6/lib/X11/xinit/xinitrc >> ~/.xinitrc
fi

CWD="`dirname \"\`dirname \"$0\"\`\"`/Resources"
export "ETC=$HOME/Library/Application Support/ADL Workbench"

mkdir -p "$ETC"
rm -f "$ETC/display"

/usr/bin/open-x11 "$CWD/display.sh" || \
open -a XDarwin "$CWD/display.sh" || \
echo ":0" > "$ETC/display"

while [ "$?" == "0" -a ! -f "$ETC/display" ]; do sleep 1; done
export "DISPLAY=`cat \"$ETC/display\"`"

ps -wx -ocommand | grep -e '[X]11' > /dev/null || exit 11

echo Setting up GTK environment variables

export "PKG_CONFIG_PATH=$CWD/lib/pkgconfig"
export "DYLD_LIBRARY_PATH=$CWD/lib"
export "PATH=$CWD:$PATH:/usr/X11R6/bin"

echo Creating GTK settings files

sed 's|${HOME}|'"$HOME|g" "$CWD/etc/pango/pangorc" > "$ETC/pangorc"
sed 's|${CWD}|'"$CWD|g" "$CWD/etc/pango/pango.modules" > "$ETC/pango.modules"
cp -f "$CWD/etc/pango/pangox.aliases" "$ETC"
sed 's|${CWD}|'"$CWD|g" "$CWD/etc/gtk-2.0/gtk.immodules" > "$ETC/gtk.immodules"
sed 's|${CWD}|'"$CWD|g" "$CWD/etc/gtk-2.0/gdk-pixbuf.loaders" > "$ETC/gdk-pixbuf.loaders"

echo Launching ADL Workbench

cd "$ETC"
for f in `ls "$CWD/bin"`; do ln -fsv "$CWD/bin/$f"; done
./adl_workbench &

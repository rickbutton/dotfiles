#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xsetroot -cursor_name left_ptr
setxkbmap -layout en
# AMD 7950
xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output DVI-0 --mode 1920x1080 --pos 0x0 --rotate normal --primary --output HDMI-3 --mode 1680x1050 --pos 1920x0 --rotate normal
# Intel
#xrandr --output HDMI3 --right-of VGA1
xcompmgr -c &
feh --bg-scale ~/bg.jpg
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
unclutter &
devmon &
exec xmonad

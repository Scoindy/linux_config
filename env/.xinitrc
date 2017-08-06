#xrandr --newmode  "1024x768"  63.50  1024  1072 1176 1328  768 771 775 798 -hsync +vsync
#xrandr --addmode VGA-SW 1024x768
#xrandr --output  VGA-SW --mode 1024x768
xrandr --size 1600x900
exec cinnamon-session

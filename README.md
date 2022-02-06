## About
This bash script switchs enable / disable inputs from an internal keyboard of a laptop.
The tested OS is as bellow.

```
Distributor ID:	Pop
Description:	Pop!_OS 21.04
Release:	21.04
Codename:	hirsute
```

## Known issues
- `disable -> enable -> input by an internal keyboard` may cause a problem of freezing a mouse cursor by a touchpad. To fix this problem, check a `xorg.conf` file exists in `/etc/X11`. If there is not the file, touch it and add a setting as follows, then restart the OS.
```
Section "InputClass"
Identifier "Touchpad" # required
MatchIsTouchpad "yes" # required
Driver "synaptics" # required
Option "MinSpeed" "0.5"
Option "MaxSpeed" "1.0"
Option "AccelFactor" "0.075"
Option "TapButton1" "1"
Option "TapButton2" "2" # multitouch
Option "TapButton3" "3" # multitouch
Option "VertTwoFingerScroll" "1" # multitouch
Option "HorizTwoFingerScroll" "1" # multitouch
Option "VertEdgeScroll" "1"
Option "CoastingSpeed" "8"
Option "CornerCoasting" "1"
Option "CircularScrolling" "1"
Option "CircScrollTrigger" "7"
Option "EdgeMotionUseAlways" "1"
Option "LBCornerButton" "8" # browser "back" btn
Option "RBCornerButton" "9" # browser "forward" btn
EndSection
```
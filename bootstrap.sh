#!/bin/bash
#Linux CapsLock Delay Fixer by ErkanMDR /- HELYX

cd "${BASH_SOURCE%/*}" || exit

xkbcomp -xkb $DISPLAY xkbmap
fixpatchline=$(cat fixpatch)
perl -i~ -0777 -pe "s/key .CAPS[^}]+};/$fixpatchline/" xkbmap
xkbcomp xkbmap $DISPLAY
rm xkbmap*

echo "Delay fixed"

gsettings set org.gnome.desktop.input-sources xkb-options "['grp:caps_toggle']"
echo "Caps-lock remapped"

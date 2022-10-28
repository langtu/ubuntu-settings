#!/bin/sh

# export gnome settings
dconf load '/org/gnome/desktop/wm/keybindings/' > keybindings.dconf
dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' > custom-keybindings.dconf

# export tilix settings
dconf dump /com/gexperts/Tilix/ > tilix.dconf

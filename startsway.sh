#!/bin/sh

# Force apps to use Wayland backend by default
export MOZ_ENABLE_WAYLAND=1
#export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export CLUTTER_BACKEND=wayland
#export GDK_BACKEND=wayland # Disabled because it breaks Spotify
export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ENGINE=wayland_wgl
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CURRENT_DESKTOP=sway

# no redirecting stdout/stderr; handled by SDDM
exec sway

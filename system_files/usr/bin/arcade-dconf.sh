#!/bin/bash
dconf load / << 'EOF'
[org/gnome/desktop/lockdown]
disable-user-switching=true
disable-lock-screen=true
disable-command-line=true
disable-printing=true
disable-log-out=true
mount-removable-storage-devices-as-read-only=true
user-administration-disabled=true

[org/gnome/shell]
enabled-extensions=['']
allow-extension-installation=false
welcome-dialog-last-shown-version='9999'

[org/gnome/desktop/interface]
enable-hot-corners=false
accent-color='green'

[org/gnome/desktop/background]
picture-uri=''
picture-uri-dark=''
color-shading-type='solid'
primary-color='#000000'
secondary-color='#000000'
picture-options='none'

[org/gnome/desktop/session]
idle-delay=0

[org/gnome/desktop/screensaver]
picture-uri=''
color-shading-type='solid'
primary-color='#000000'

[org/gnome/mutter]
dynamic-workspaces=false
edge-tiling=false
workspaces-only-on-primary=true
overlay-key=''

[org/gnome/desktop/wm/preferences]
button-layout=':'
num-workspaces=1

[org/gnome/shell/keybindings]
toggle-overview=@as []
toggle-application-view=@as []
toggle-message-tray=@as []
toggle-screen-magnifier=@as []
show-screenshot-ui=@as []
shift-overview-up=@as []
shift-overview-down=@as []
toggle-quick-settings=@as []
switch-to-application-1=@as []
switch-to-application-2=@as []
switch-to-application-3=@as []
switch-to-application-4=@as []
switch-to-application-5=@as []
switch-to-application-6=@as []
switch-to-application-7=@as []
switch-to-application-8=@as []
switch-to-application-9=@as []
open-new-window-application-1=@as []
open-new-window-application-2=@as []
open-new-window-application-3=@as []
open-new-window-application-4=@as []
open-new-window-application-5=@as []
open-new-window-application-6=@as []
open-new-window-application-7=@as []
open-new-window-application-8=@as []
open-new-window-application-9=@as []
focus-active-notifcation=@as []

[org/gnome/desktop/wm/keybindings]
activate-window-menu=@as []
begin-move=@as []
begin-resize=@as []
maximize=@as []
unmaximize=@as []
minimize=@as []
close=@as []
lower=@as []
switch-to-workspace-1=@as []
switch-to-workspace-2=@as []
switch-to-workspace-3=@as []
switch-to-workspace-4=@as []
switch-to-workspace-left=@as []
switch-to-workspace-right=@as []
switch-to-workspace-up=@as []
switch-to-workspace-down=@as []
switch-to-workspace-last=@as []
move-to-workspace-1=@as []
move-to-workspace-2=@as []
move-to-workspace-3=@as []
move-to-workspace-4=@as []
move-to-workspace-left=@as []
move-to-workspace-right=@as []
move-to-workspace-up=@as []
move-to-workspace-down=@as []
move-to-workspace-last=@as []
panel-main-menu=@as []
panel-run-dialog=@as []
show-desktop=@as []
toggle-maximized=@as []
toggle-fullscreen=@as []
toggle-above=@as []
switch-group=@as []
switch-group-backward=@as []
switch-windows=@as []
switch-windows-backward=@as []
switch-applications=@as []
switch-applications-backward=@as []
switch-panels=@as []
switch-panels-backward=@as []
cycle-windows=@as []
cycle-windows-backward=@as []
cycle-panels=@as []
cycle-panels-backward=@as []
cycle-group=@as []
cycle-group-backward=@as []

[org/gnome/desktop/media-handling]
automount=false
automount-open=false
autorun-never=true

[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=@as []
screensaver=@as []
screenshot=@as []
screenshot-clip=@as []
window-screenshot=@as []
window-screenshot-clip=@as []
area-screenshot=@as []
area-screenshot-clip=@as []
screencast=@as []
logout=@as []
suspend=@as []
hibernate=@as []
shutdown=@as []
rotate-video-lock-static=@as []
rfkill=@as []
rfkill-bluetooth=@as []
power=@as []
terminal=@as []
calculator=@as []

[org/gnome/mutter/keybindings]
toggle-tiled-left=@as []
toggle-tiled-right=@as []
switch-monitor=@as []
rotate-monitor=@as []

[org/gnome/mutter/wayland/keybindings]
restore-shortcuts=@as []

[org/gnome/desktop/applications/terminal]
exec=''
exec-arg=''

[org/gnome/settings-daemon/plugins/xsettings]
overrides={'Gtk/ShellShowsAppMenu': <0>}
EOF

# Disable terminal via xdg-terminal-exec as well
mkdir -p /var/home/arcade/.config
cat > /var/home/arcade/.config/xdg-terminals.list << 'EOF'
EOF
chown arcade:arcade /var/home/arcade/.config/xdg-terminals.list
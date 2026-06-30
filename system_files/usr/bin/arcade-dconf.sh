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
last-selected-power-profile=performance
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
toggle-overview=[]
toggle-application-view=[]
toggle-message-tray=[]
toggle-screen-magnifier=[]
show-screenshot-ui=[]
shift-overview-up=[]
shift-overview-down=[]
toggle-message-tray=[]
toggle-quick-settings=[]
switch-to-application-1=[]
switch-to-application-2=[]
switch-to-application-3=[]
switch-to-application-4=[]
switch-to-application-5=[]
switch-to-application-6=[]
switch-to-application-7=[]
switch-to-application-8=[]
switch-to-application-9=[]
open-new-window-application-1=[]
open-new-window-application-2=[]
open-new-window-application-3=[]
open-new-window-application-4=[]
open-new-window-application-5=[]
open-new-window-application-6=[]
open-new-window-application-7=[]
open-new-window-application-8=[]
open-new-window-application-9=[]
shift-overview-down=[]
shift-overview-up=[]
focus-active-notifcation=[]

[org/gnome/desktop/wm/keybindings]
activate-window-menu=[]
begin-move=[]
begin-resize=[]
maximize=[]
unmaximize=[]
minimize=[]
close=[]
lower=[]
switch-to-workspace-1=[]
switch-to-workspace-2=[]
switch-to-workspace-3=[]
switch-to-workspace-4=[]
switch-to-workspace-left=[]
switch-to-workspace-right=[]
switch-to-workspace-up=[]
switch-to-workspace-down=[]
switch-to-workspace-last=[]
move-to-workspace-1=[]
move-to-workspace-2=[]
move-to-workspace-3=[]
move-to-workspace-4=[]
move-to-workspace-left=[]
move-to-workspace-right=[]
move-to-workspace-up=[]
move-to-workspace-down=[]
move-to-workspace-last=[]
panel-main-menu=[]
panel-run-dialog=[]
show-desktop=[]
toggle-maximized=[]
begin-move=[]
begin-resize=[]
toggle-fullscreen=[]
toggle-above=[]
switch-group=[]
switch-group-backward=[]
switch-windows=[]
switch-windows-backward=[]
switch-applications=[]
switch-applications-backward=[]
switch-panels=[]
switch-panels-backward=[]
cycle-windows=[]
cycle-windows-backward=[]
cycle-panels=[]
cycle-panels-backward=[]
cycle-group=[]
cycle-group-backward=[]

[org/gnome/desktop/media-handling]
automount=false
automount-open=false
autorun-never=true

[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=[]
screensaver=[]
screenshot=[]
screenshot-clip=[]
window-screenshot=[]
window-screenshot-clip=[]
area-screenshot=[]
area-screenshot-clip=[]
screencast=[]
logout=[]
suspend=[]
hibernate=[]
shutdown=[]
rotate-video-lock-static=[]
rfkill=[]
rfkill-bluetooth=[]
power=[]
terminal=[]
calculator=[]

[org/gnome/mutter/keybindings]
toggle-tiled-left=[]
toggle-tiled-right=[]
switch-monitor=[]
rotate-monitor=[]

[org/gnome/mutter/wayland/keybindings]
restore-shortcuts=[]

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
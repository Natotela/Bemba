#!/bin/bash
sudo apt-get install compizconfig-settings-manager
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
gsettings set com.canonical.Unity.Launcher launcher-position Bottom


sudo echo "
[Re-enable hibernate by default in upower]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes

[Re-enable hibernate by default in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate;org.freedesktop.login1.handle-hibernate-key;org.freedesktop.login1;org.freedesktop.login1.hibernate-multiple-sessions;org.freedesktop.login1.hibernate-ignore-inhibit
ResultActive=yes" >> 1.pkla

sudo mv 1.pkla /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size 64

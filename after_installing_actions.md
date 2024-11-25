# After installing Fedora

## Update system

```bash
sudo dnf update -y
```

## Configure DNF simultaneous mirrors

```bash
sudo vi /etc/dnf/dnf.conf
```

add max_parallel_downloads=10
:wq

## Install SW 

### Proton Fedora

Guide: https://protonvpn.com/support/official-linux-vpn-fedora/

```bash

wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.2-1.noarch.rpm"

sudo dnf install ./protonvpn-stable-release-1.0.2-1.noarch.rpm

sudo dnf check-update && sudo dnf upgrade

sudo dnf install --refresh proton-vpn-gnome-desktop 

sudo dnf check-update && sudo dnf upgrade

sudo dnf install libappindicator-gtk3 gnome-shell-extension-appindicator gnome-extensions-app
```

restart and enable AppIndicator and KStatusNotifierItem Support extension 


### fastfetch

https://github.com/fastfetch-cli/fastfetch/blob/dev/README.md

```bash
sudo dnf install fastfetch
```

### VSCode

Add repo from here: https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions

then:
```bash
dnf check-update
sudo dnf install code
```

### Timeshift

Similar to system restore in Windows.


```bash
sudo dnf install timeshift

sudo timeshift --create

sudo timeshift --restore

timeshift --list
```

### Aliases

```bash
alias ll='/usr/bin/ls -lrth --color=auto'

alias la='/usr/bin/ls -lrth --color=auto'
```
# After installing Fedora

## Update system

```bash
sudo dnf upgrade -y
sudo dnf update -y
```

## Configure DNF simultaneous mirrors

```bash
sudo vi /etc/dnf/dnf.conf

# then add and wq
add max_parallel_downloads=10
```

## dnf Plugins

DNF plugins add extra features to the dnf package manager. The dnf-plugins-core package provides some essential plugins.

```bash
sudo dnf install dnf-plugins-core -y
```
- **builddep:** This plugin allows you to automatically install the build dependencies for a package. This is useful if you want to compile software from source code.

- **changelog:** This plugin lets you view the changelog for a package, showing the changes made in each version.

- **config-manager:** This plugin helps you manage DNF configuration options and repositories.

- **copr:** This plugin enables you to install packages from COPR, a community-driven repository for Fedora packages.

- **debug:** This plugin installs debugging information for packages, which can be useful for developers.

- **debuginfo-install:** This plugin installs debuginfo packages, which contain debugging symbols for programs.

- **download:** This plugin allows you to download RPM packages without installing them.

- **needs-restarting:** This plugin checks for and reports on processes that need to be restarted after package updates.

- **versionlock:** This plugin allows you to lock specific packages to a particular version, preventing them from being updated.


## Install SW 

### Proton Fedora VPN

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

### Install IVPN

The team seems pretty cool and I am in search of a faster VPN, proton is great but I have noticed some latency and I work remote so not ideal.

This is for Fedora 41, for below versions go here: https://www.ivpn.net/en/apps-linux/#fedora

```bash
# [Fedora 41+] Add the IVPN repository
sudo dnf config-manager addrepo --from-repofile=https://repo.ivpn.net/stable/fedora/generic/ivpn.repo

# To install IVPN software (CLI and UI)
sudo dnf install ivpn-ui

# To install only IVPN CLI
sudo dnf install ivpn
```

### Install all of this

Recommended by me (づ ◕‿◕ )づ, assuming you installed rpmfusion-nonfree.

```bash
sudo dnf5 install fastfetch mpv gcc make python3-pip unrar cargo p7zip p7zip-plugins htop java-17-openjdk android-tools vlc discord
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

### YTMusic player (⌐■_■)

Go to https://ytmdesktop.app/#download and download your rpm.

```bash
# go to Downloads and rpm, substitute with your own version
sudo rpm -ivh youtube-music-desktop-app-2.0.6-1.x86_64.rpm
```

to update:

```bash
sudo dnf5 update <package_name>
# rmp may not solve al dependencies while dnf does
```

## Docker

First update system, we will be installing community edition.

```bash
# sys update
sudo dnf update -y
# add repo from docker address, check this, dont blindly copy pls
sudo dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.repo
#install
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
```

You will be asked if you wanto enable docker since boot which I don't want as this is for personal and not a corporate environment where you probably want it that way.

```bash
# this will start docker
sudo systemctl start docker
# thiw will enable boot run
sudo systemctl enable docker
```

### Aliases

Fedora points your bashrc file to /etc/bashrc to have a cleaner config. To have your own, create a bashrc.d directory and then put whatever you want. It would be more useful that you know these before aliasing

These are some linux aliases I use on my day to day.

```bash
mdkir ~/.bashrc.d
vi ~/.bashrc.d/aliases.sh

# then save and wq the below commands
alias ll='ls -lrth --color=auto'
alias la='ls -lrtha --color=auto'
alias df='df -hT'
alias d1='cd ..'
alias d2='cd ../..'
alias d3='cd ../../..'
alias d4='cd ../../../..'
```

To not use any alias and run the standard command:

```bash
\df

#or

command df
```

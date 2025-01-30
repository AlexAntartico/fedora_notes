---
title: "After installing Fedora 41: A Glorious Adventure Awaits!"
description: "An article containing a list of things to do after installing Fedora 41."
tags:
  - Fedora 41
  - Fedora
  - Linux
  - dnf
published: true
---

# After installing Fedora 41: A Glorious Adventure Awaits!

Welcome, brave linux enthusiasts, to the land of Fedora 41! You've just embarked on a journey where your terminal is your sword, and your bash commands are your spellbook. Here's how to make your new digital home not just functional but confortable as well.

## Update system

First things first, let's ensure your Fedora fortress is up to date. Run these commands to banish the outdated demons:

```bash
sudo dnf upgrade -y
# sudo dnf update -y
# upgrade is now the preffered command, it has backwards compatibility
```
Because nothing says "I installed a new Linux" like a good old system update.

## Configure DNF simultaneous mirrors

Cast a speed spell to your dnf sources by enabling max downlows parameter.

```bash
sudo vi /etc/dnf/dnf.conf

# then add and wq
add max_parallel_downloads=10
```

Now, your downloads will race through the internet like Usain Bolt on a caffeine rush... or me when someone mentions 'production outage'.

## dnf Plugins

DNF plugins are like magical accessories for your package manager. They add extra features to the dnf package manager and provide some essential plugins. Here is how to arm yourself with them:

```bash
sudo dnf install dnf-plugins-core -y
```
- **builddep:** This plugin allows you to automatically install the build dependencies for a package. This is useful if you want to compile software from source code.

- **changelog:** This plugin lets you view the changelog for a package, showing the changes made in each version. Who doesn't love a transaction log?

- **config-manager:** This plugin helps you manage DNF configuration options and repositories.

- **copr:** This plugin enables you to install packages from COPR, a community-driven repository for Fedora packages.

- **debug:** This plugin installs debugging information for packages, which can be useful for developers.

- **debuginfo-install:** This plugin installs debuginfo packages, which contain debugging symbols for programs.

- **download:** This plugin allows you to download RPM packages without installing them.

- **needs-restarting:** This plugin checks for and reports on processes that need to be restarted after package updates.

- **versionlock:** This plugin allows you to lock specific packages to a particular version, preventing them from being updated.


## Install SW

### Proton Fedora VPN

Feeling the need for privacy? Here’s how to cloak yourself with ProtonVPN or follow the guide: https://protonvpn.com/support/official-linux-vpn-fedora/

```bash

wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.2-1.noarch.rpm"

sudo dnf install ./protonvpn-stable-release-1.0.2-1.noarch.rpm

sudo dnf check-update && sudo dnf upgrade

sudo dnf install --refresh proton-vpn-gnome-desktop

sudo dnf check-update && sudo dnf upgrade

sudo dnf install libappindicator-gtk3 gnome-shell-extension-appindicator gnome-extensions-app
```

Don't forgent to restart and enable AppIndicator and KStatusNotifierItem Support extension for that sweet, sweet VPN icon.

### Install IVPN

If ProtonVPN feels too mainstream, or you're just looking for a faster alternative, IVPN might be your speed demon.

Its pretty much anonymous, pay with crypto if you're feeling cyberpunk.

```bash
# [Fedora 41+] Add the IVPN repository
sudo dnf config-manager addrepo --from-repofile=https://repo.ivpn.net/stable/fedora/generic/ivpn.repo

# To install IVPN software (CLI and UI)
sudo dnf install ivpn-ui

# To install only IVPN CLI
sudo dnf install ivpn
```

This is for Fedora 41, for below versions go here: https://www.ivpn.net/en/apps-linux/#fedora

### Install all of this cool stuff

Recommended by me (づ ◕‿◕ )づ, assuming you have embraced rpmfusion-nonfree.

```bash
sudo dnf5 install fastfetch mpv gcc make python3-pip unrar cargo p7zip p7zip-plugins htop java-17-openjdk android-tools vlc discord dejavu-sans-mono-fonts fira-code-fonts kdenlive vim nodejs
```

### VSCode

Because who doesn't love an editor that thinks it's an IDE? Add repo from here: https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions

then:

```bash
dnf check-update
sudo dnf install code
```

### Vim plugins

Make Vim as fancy as your socks. Ensure you always have the latest repo:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

This command downloads the `plug.vim` file and installs it in `~/.vim/autoload`. If the directory doesn’t exist, it will be created. To verify installation, open a new Vim session and type `:PlugVersion` to verify that Vim-Plug is installed correctly.

Here’s a list of plugins that will make you feel like a coding wizard:

```bash
" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
" Python
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdtree'
" GH Copilot
Plug 'github/copilot.vim'
" markdown
Plug 'plasticboy/vim-markdown'
Plug 'shime/vim-livedown'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
```

### Vim GitHub copilot setup:

Your perfect AI buddy

- `:Copilot setup` This command will prompt you to authenticate with GitHub. You'll get a code to enter on a GitHub login page that opens in your browser. Follow the instructions to authorize Copilot.
- To accept a suggestion, press `Tab`.
- For more information on usage, you can check the plugin's documentation with `:help copilot`.
- If you encounter issues, check the status with `:Copilot status`

```bash
" Toggle GitHub Copilot on and off
nnoremap <leader>cc :Copilot disable<CR>
nnoremap <leader>ce :Copilot enable<CR>

function! CopilotStatus()abort
    return exists('*copilot#Enabled') && copilot#Enabled() ? 'enabled' : 'disabled'
endfunction
```

- `nnoremap`: Non-recursive mapping in normal mode.
- `<leader>cp`: This is the shortcut; <leader> is typically , by default, but you can change it in your config. So, this would be ,cc if you haven't changed your leader key.
- `:Copilot diable/enable`: This is the command to enable/disable Copilot.
- `<CR>`: Simulates pressing Enter to execute the command.


### Timeshift

Similar to system restore in Windows. Consider it your Fedora's time machine.


```bash
sudo dnf install timeshift

sudo timeshift --create

sudo timeshift --restore

timeshift --list
```

### YTMusic player (⌐■_■)

For those who like their music with a side of Linux. Go to https://ytmdesktop.app/#download and download your rpm.

```bash
# go to Downloads and rpm, substitute with your own version
sudo rpm -ivh youtube-music-desktop-app-2.0.6-1.x86_64.rpm
```

to update:

```bash
sudo dnf5 update <package_name>
# rmp may not solve al dependencies while dnf does
```

### Docker -- edit: Just skip this and use Podman

**Very important**: At the moment of writing, Fedora 41 includes Podman as the default container runtime. If you want to use Docker, you need to install it manually, which is only advisable if you really need Docker. Docker will just override Podman. So **I would suggest you to actually skip this step and use Podman**. It will be cleaner if you need to use containers. I have to use it as I am completing a course that requires Docker.

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

### Terminal Transparency

Credits to [this Reddit post](https://www.reddit.com/r/Fedora/comments/1gt0ewk/terminal_transparency/).

Ptyxis is the default terminal for Gnome, it was previously known as Prompt. To change transparency just run the below:

```bash
gsettings set 'org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/'$PTYXIS_PROFILE'/' 'opacity' '0.8'
```

.8 is currently working fine for me, just try and adjust to your taste.


## Aliases

Fedora points your bashrc file to /etc/bashrc to have a cleaner config. To have your own, create a bashrc.d directory and then put whatever you want. It would be more useful that you know these before aliasing

These are some linux aliases I use on my day to day.

fastfetch command at the end is to run fastfetch at terminal startup.

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
alias upme='sudo dnf5 upgrade -y'
alias py_gitignore='curl https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore > ./.gitignore'

fastfetch
```

To not use any alias and run the standard command:

```bash
\df

#or

command df
```

- `upgrade` is the preferred term: In DNF5, upgrade is the technically correct and recommended command for updating packages.
- `update` is an alias: update still works because it's maintained as an alias for upgrade for backward compatibility and user familiarity

In older dnf and yum versions, there was a distinction between update and upgrade, where upgrade was usually reserved for version upgrades, like from Fedora 36, to 37.

## Custom DNS

Feel like you are on a secret scenario quest with this setup.

In terminal, run `resolvectl`, you will probably be running under your ISP's DNS server and this command will show it. The most common DNS servers are Google and Cloudfare.

- Cloudflare:
   - Primary DNS: 1.1.1.1
   - Secondary DNS: 1.0.0.1
- Google Public DNS:
   - Primary DNS: 8.8.8.8  
   - Secondary DNS: 8.8.4.4  

```bash
$ nmcli connection show

NAME                UUID                                  TYPE      DEVICE
Wired connection 1  f87e2a6c-b089-31d3-ba62-83e08188db2a  ethernet  enp9s0
virbr0              9ad8ea46-a589-43f7-a904-95098b18404f  bridge    virbr0

```

Explanation of the columns:

- **NAME**: The name assigned to the network connection. This is usually how you identify the connection in NetworkManager.
- **UUID**: A universally unique identifier for the connection.
- **TYPE**: The type of network connection (e.g., ethernet, Wi-Fi, bridge, VPN).
- **DEVICE**: The network interface associated with the connection (e.g., enp9s0 for a wired connection, wlan0 for Wi-Fi).

```bash
# Point DNS and Connection to your preffered service
$ nmcli con mod "Wired connection 1" ipv4.dns "1.1.1.1 1.0.0.1"

# restart network connection to apply changes
$ nmcli con down "Wired connection 1"
$ nmcli con up "Wired connection 1"
```


## Wallpapers

Dress up your desktop with some fresh wallpaper from here: https://github.com/ropapermaker/Wallpapers/blob/main/README.md

Because even Linux needs a good aesthetic.


And there you have it! Your Fedora 41 setup should now be more than just functional; this is a statement. Now, go forth and conquer your Linux adventures with style and speed.


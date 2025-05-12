# dnf

dnf stands for Dandified YUM, an improved version of the Yellowdog Updater Modified, designed to handle RPM packages more efficiently. Dandified does not mean anything, its just a playful term to say "more modern, more efficient, improved version of YUM"

DNF offers several enhancements over YUM, including better performance, lower memory usage, and faster dependency resolution.

## Basic dnf commands

To install something:
```bash
sudo dnf install gedit
```
To remove something:
```bash
sudo dnf remove gedit
```

To purge something:
```bash
sudo dnf autoremove
```

You will also have the software center, note that the preferred way of installing something is via dnf

## dnf group list --hidden \<string\>

- **`group`**: This subcommand within `dnf` is used to manage software groups. Groups are collections of related packages that can be installed together. For example, "Web Server" might be a group containing Apache, PHP, and MySQL.

- **`list`**: This option tells `dnf` to list the available groups.

- **`--hidden`**: This option tells `dnf` to include hidden groups in the list. Hidden groups are typically groups that are not meant for general use or are for specific purposes.

- **`\*devel\*`** Its a wildcard pattern, it tells dnf to list only the groups that have "devel" in their name.

```bash
dnf group list --hidden \*devel\*
Updating and loading repositories:
Repositories loaded.
ID                         Name                                  Installed
c-development              C Development Tools and Libraries            no
d-development              D Development Tools and Libraries            no
development-libs           Development Libraries                        no
development-tools          Development Tools                            no
gnome-software-development GNOME Software Development                   no
java-development           Java Development                             no
kde-software-development   KDE Software Development                     no
kf6-software-development   KDE Frameworks 6 Software Development        no
libreoffice-development    LibreOffice Development                      no
perl                       Perl Development                             no
rpm-development-tools      RPM Development Tools                        no
xfce-software-development  Xfce Software Development                    no
x-software-development     X Software Development                       no
                     : pkgconf
​￼​￼Default packages     : ctags
                     : indent
​￼​￼Optional packages    : astyle
                     : cmake
                     : geany
                     : insight
                     : nemiver
                     : uncrustify
```


*In essence, this command is used to find and display all the development-related software groups available on your system, even if they are hidden.*

### dnf group info "D Development Tools and Libraries"

- **`info`**: This option tells `dnf` to display information about a specific group.

- **`"D Development Tools and Libraries"`**: This is the name of the software group you're interested in. It's enclosed in quotes because it contains spaces.

```bash
dnf group info "D Development Tools and Libraries"
Updating and loading repositories:
Repositories loaded.
Id                   : d-development
Name                 : D Development Tools and Libraries
Description          : These include development tools and libraries such as ldc, and geany-tag.
Installed            : no
Order                :
Langonly             :
Uservisible          : yes
Repositories         : fedora, updates
Mandatory packages   : ldc
                     : make
                     : pkgconf
Default packages     : ctags
                     : indent
Optional packages    : astyle
                     : cmake
                     : geany
                     : insight
                     : nemiver
                     : uncrustify

```

When you run this command, DNF will typically display the following information about the "D Development Tools and Libraries" group:

- **Description:** A brief explanation of the group's purpose (e.g., "These include development tools and libraries such as ldc, and geany-tag.").
- **Mandatory packages:** A list of packages that are always installed when you install this group. These are essential components for D development.
- **Optional packages:** A list of packages that are not required but recommended for D development. You can choose to install these selectively.
- **Default packages:** A list of packages that are installed by default when you install this group. This usually includes a combination of mandatory and some optional packages.
- **Environment Group ID:** An identifier for the group.

## dnf5 history list

- **`history`**: This sub-command within `dnf` is used to manage the history of transactions performed by DNF. This includes installing, updating, and removing packages.

`fedora@earth:~$ dnf history list`

Will output something like this:

```bash
fedora@earth:~$ dnf history list
ID Command line                                                                 Date and time       Action(s) Altered
40 dnf5 upgrade -y                                                              2025-01-09 03:33:22                32
39 dnf5 upgrade -y                                                              2025-01-04 13:08:39                42
38 dnf5 upgrade -y                                                              2025-01-03 21:27:18               102
```

You will notice that the most recent transactions are listed first, and each entry includes the following information:

- **ID:** A unique identifier for the transaction.
- **Command line:** The command that was executed to perform the transaction.
- **Date and time:** The date and time when the transaction was performed.
- **Action(s):** The type of action that was performed (e.g., "Upgrade," "Install," "Remove").
- **Altered:** The number of packages that were affected by the transaction.

This current system I am writing in at the moment of the creation of this document, is fairly recent. In prod systems, you will see a lot more entries and I would recommend you to use `dnf5 history list --reverse` to see the most recent transactions first.

Imagine you have to troubleshoot a problem that happened today and you have a system where the latest Transaction ID is 200, you would want to see the most recent transactions first and not have to scroll down to the bottom of the list.

```bash
fedora@earth:~$ dnf history list --reverse

ID Command line                                                                 Date and time       Action(s) Altered

... Imagine a bunch of entries here ...

388 dnf5 upgrade -y                                                              2025-01-03 21:27:18               102
389 dnf5 upgrade -y                                                              2025-01-04 13:08:39                42
390 dnf5 upgrade -y                                                              2025-01-09 03:33:22                32
fedora@earth:~$
```

## dnf history info

- **`info`**: This option tells `dnf` to display detailed information about a specific transaction.

The syntax is as follows: `dnf history info <transaction_id>`. If no transaction ID is provided, DNF will display information about the most recent transaction, in this case, transaction ID 40.

```bash
fedora@earth:~$ dnf history info

Transaction ID : 40
Begin time     : 2025-01-09 03:33:22
Begin rpmdb    : abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890
End time       : 2025-01-09 03:33:32
End rpmdb      : 1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef
User           : 007 Juan Camaney <juan.c@inventedemail.com>
Status         : Ok
Releasever     : 41
Description    : dnf5 upgrade -y
Comment        :
Packages altered:
  Action   Package                                                   Reason          Repository
  Upgrade  GraphicPlus-0:2.9.0-1.fc41.x86_64                         Dependency      updates
  Upgrade  netcache-0:2.91-1.fc41.x86_64                             Group           updates
  Upgrade  swiftweb-0:135.0-1.fc41.x86_64                            Group           updates
  Upgrade  swiftweb-langpacks-0:135.0-1.fc41.x86_64                  Weak Dependency updates
  Upgrade  quantum-browser-stable-0:132.0.6780.100-1.x86_64          User            quantum-browser-testing
  Upgrade  devdata-0:0.392-1.fc41.noarch                             Dependency      updates
  Upgrade  libDisplay-0:0.9.13-1.fc41.x86_64                         Dependency      updates
  Upgrade  libdevice-0:1.28.0-1.fc41.x86_64                          Dependency      updates
  Upgrade  libsecurity-0:4.4.38-1.fc41.x86_64                        Dependency      updates
  Upgrade  libsecurity-devel-0:4.4.38-1.fc41.x86_64                  Dependency      updates
  Upgrade  secure-net-gui-0:4.9.0-1.fc41.noarch                      Dependency      securenet-fedora-stable
  Upgrade  python3-secure-net-core-0:0.40.0-1.fc41.noarch            Dependency      securenet-fedora-stable
  Upgrade  python3-secure-net-connector-0:0.11.0-1.fc41.noarch       Dependency      securenet-fedora-stable
  Upgrade  python3-sysinfo-0:1.44-1.fc41.noarch                      Dependency      updates
  Upgrade  medialib-0:1.14.0-1.fc41.x86_64                           Dependency      updates
  Upgrade  fashhash-libs-0:0.8.4-1.fc41.x86_64                       Dependency      updates
  Replaced GraphicPlus-0:2.8.3-1.fc41.x86_64                         Dependency      @System
  Replaced netcache-0:2.90-3.fc41.x86_64                             Group           @System
  Replaced swiftweb-0:134.0-1.fc41.x86_64                            Group           @System
  Replaced swiftweb-langpacks-0:134.0-1.fc41.x86_64                  Weak Dependency @System
  Replaced quantum-browser-stable-0:131.0.6778.204-1.x86_64          User            @System
  Replaced devdata-0:0.391-1.fc41.noarch                             Dependency      @System
  Replaced libDisplay-0:0.9.12-1.fc41.x86_64                         Dependency      @System
  Replaced libdevice-0:1.27.1-1.fc41.x86_64                          Dependency      @System
  Replaced libsecurity-0:4.4.37-1.fc41.x86_64                        Dependency      @System
  Replaced libsecurity-devel-0:4.4.37-1.fc41.x86_64                  Dependency      @System
  Replaced secure-net-gui-0:4.8.1-1.fc41.noarch                      Dependency      @System
  Replaced python3-sysinfo-0:1.41-2.fc41.noarch                      Dependency      @System
  Replaced python3-secure-net-core-0:0.38.2-1.fc41.noarch            Dependency      @System
  Replaced python3-secure-net-connector-0:0.10.1-1.fc41.noarch       Dependency      @System
  Replaced medialib-0:1.12-11.fc41.x86_64                            Dependency      @System
  Replaced fashhash-libs-0:0.8.2-4.fc41.x86_64                       Dependency      @System
```





## dnf

dnf stands for Dandified YUM, an improved version of the Yellowdog Updater Modified, designed to handle RPM packages more efficiently. Dandified does not mean anything, its just a playful term to say "more modern, more efficient, improved version of YUM"

DNF offers several enhancements over YUM, including better performance, lower memory usage, and faster dependency resolution.

## Commands


### dnf group list --hidden \<string\>

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


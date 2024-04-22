# Dotfiles

This repository manages my development environment configuration files, including customizations for the Hyprland window manager on Wayland. It also includes development tools, utilities, fonts and themes.

## Breakdown

This section categorizes the packages in this dotfiles repository for easier understanding:

### System Essentials

* **Package Management:**
    * `yay` (AUR helper): Manages installation and updates of software packages.
* **Development Languages:**
    * `rustup` (Rust toolchain manager): Installs and manages different versions of the Rust programming language compiler.
    * `go` (Programming language): Open-source programming language created at Google.
    * `nvm` (Node version manager): Tool for managing multiple versions of Node.js.
* **User Management:**
    * `xdg-user-dirs` (user directory manager): Handles the creation and management of user directories like Documents and Downloads.
* **Shell:**
    * `zsh` (powerful shell environment): A powerful and customizable shell environment.
    * `starship` (beautiful shell theme): Provides a beautiful and informative prompt for your shell.

### Desktop Environment (Hyprland)

* **Window Manager:**
    * `hyprland` (lightweight Wayland window manager): A lightweight and Wayland-based window manager for a modern desktop experience.
* **Customization Tools:**
    * `hyprpaper` (wallpaper manager): Sets and manages wallpapers for your Hyprland desktop.
    * `hyprlock` (lock screen manager): Provides a customizable lock screen for Hyprland.
    * `hypridle` (idle daemon): Provides an idle daemon for Hyprland.
    * `hyprcursor` (custom cursor theme): Allows you to personalize the look of your mouse cursor.
* **Utilities:**
    * `dunst` (notification daemon): Manages and displays desktop notifications.
    * `waybar` (customizable bar): Creates a customizable bar for your desktop that can display information or launch applications.
    * `rofi-lbonn-wayland` (application launcher): Provides a powerful and efficient application launcher for Hyprland.
    * `grimblast` (screenshot tool): Captures screenshots of your screen.
    * `swappy` (snapshot editing tool): A Wayland native snapshot and editor tool, inspired by Snappy on macOS.
    * `cliphist` (clipboard history manager): Allows you to manage and access a history of copied items.
    * `xdg-desktop-portal-hyprland` (desktop portal): Enables integration with applications requiring desktop portal functionality.

### Development Tools

* **Text Editors:**
    * `neovim` (powerful modern text editor): A powerful and modern text editor, a popular choice for developers.
* **Terminal:** 
    * `kitty` (feature-rich terminal emulator): A feature-rich and customizable terminal emulator.
* **Monitoring:**
    * `btop` (process viewer): Provides a visual representation of running processes on your system.
* **Other Tools:**
    * `nano` (simple text editor): A simple and user-friendly text editor.
    * `fzf` (fuzzy finder): General-purpose command-line fuzzy finder.
    * `eza` (alternative to `ls`): Modern, maintained replacement for the venerable file-listing command-line.
    * `fd` (alternative to `find`): Simple, fast and user-friendly alternative to find.
    * `bat` (alternative to `cat`): A cat clone with syntax highlighting and Git integration.
    * `git-delta` (syntax highlighting pager): A syntax-highlighting pager for git, diff, and grep output

### Utilities

* `gum` (shell script framework): A tool for glamorous shell scripts.
* `figlet` (text banner generator): Creates ASCII art banners for text.
* `neofetch` (system information displayer): Shows detailed information about your system.
* `amdgpu_top-bin` (AMD GPU monitoring): Monitors performance and utilization of your AMD graphics card.
* `partitionmanager` (KDE Partition Manager): Utility that allows to manage disks, partitions and file systems.
* `pacman-contrib`
* `imagemagik`
* `reflector`

### Fonts

* `ttf-cascadia-code-nerd` (programming font):  A font optimized for coding with ligatures and other features for programmers.
* `ttf-jetbrains-mono-nerd` (programming font):  Another popular font designed for code editing with a clean and modern look.

### Themes

* `papirus-icon-theme` (icon theme): Provides a visually appealing icon theme for your desktop.
* `bibata-cursor-theme-bin` (cursor theme): Customizes the appearance of your mouse cursor.

## KVM

### PCI passthrough via OVMF

**Before starting this step remove sddm or any login manager because it gives problems with wayland/hyprland**

Following the [Arch Linux PCI Passthrough Guide](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF), we need to enable `IOMMU` and then check if it's enabled using the following code:

```sh
sudo dmesg | grep -i -e DMAR -e IOMMU
```

After this, we need to list and check where our PCI devices are mapped to IOMMU groups.

```sh
shopt -s nullglob
for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;
```

**In my case:**

```sh
IOMMU Group 19:
    0a:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 22 [Radeon RX 6700/6700 XT/6750 XT / 6800M/6850M XT] [1002:73df] (rev c1)
IOMMU Group 20:
    0a:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
```

Now we have to isolate the GPU, but first, we need to load `vfio-pci` before the GPU drivers have a chance to bind to the card.

We have to edit the `/boot/loader/entries/<id>.conf` with the ids of pci we want to isolate:
```
options ... iommu=pt vfio-pci.ids=1002:73df,1002:ab28
```

We need to add `vfio_pci`, `vfio`, `vfio_iommu_type1` to `/etc/mkinitcpio.conf`:

```
MODULES=(... vfio_pci vfio vfio_iommu_type1 ...)
BINARIES=(...)
FILES=(...)
HOOKS=(... modconf ...)
```

After this, we have to regenerate the `initramfs` with this command and reboot:

```sh
sudo mkinitcpio -P
```

Now we can check if if `vfio-pci` is loaded properly with this command:
```sh
lspci -nnk
```
```
0a:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 22 [Radeon RX 6700/6700 XT/6750 XT / 6800M/6850M XT] [1002:73df] (rev c1)
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Device [1002:0e36]
	Kernel driver in use: vfio-pci
	Kernel modules: amdgpu
0a:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
	Kernel driver in use: vfio-pci
	Kernel modules: snd_hda_intel
0b:00.0 VGA compatible controller [0300]
```

### Qemu packages
```
sudo pacman -S qemu-desktop libvirt edk2-ovmf virt-manager vde2 nftables dnsmasq
```
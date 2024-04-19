# Dotfiles

This repository manages my development environment configuration files, including customizations for the Hyprland window manager on Wayland. It also includes development tools, utilities, fonts, themes, and Flatpak applications. 

## Breakdown

This section categorizes the packages in this dotfiles repository for easier understanding:

### System Essentials

* **Package Management:**
    * `paru` (AUR helper): Manages installation and updates of software packages.
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

### Fonts

* `ttf-cascadia-code-nerd` (programming font):  A font optimized for coding with ligatures and other features for programmers.
* `ttf-jetbrains-mono-nerd` (programming font):  Another popular font designed for code editing with a clean and modern look.

### Themes

* `papirus-icon-theme` (icon theme): Provides a visually appealing icon theme for your desktop.
* `bibata-cursor-theme` (cursor theme): Customizes the appearance of your mouse cursor.

### Flatpak Apps

* `Firefox` (web browser): The popular web browser.
* `Vesktop` (discord desktop client): Custom Discord App aiming to give you better performance and improve linux support.
* `Warehouse` (Flatpak manager): Manages flatpak installations.
* `Flatseal` (Flatpak permission manager): Manages permissions granted to Flatpak applications.
* `Telegram` (messaging app): The popular messaging platform.

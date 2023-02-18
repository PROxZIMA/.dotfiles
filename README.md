<a href='#'><img align="center" src="./assets/dots.png" alt="PROXY'S DOTS"></a>

[<img align="right" src="assets/rice.jpg" alt="Rice Preview" width="400px"/>](./assets/rice.mp4)

```mint
⠀⠀   🌸 Setup / Hyprland 🌸
 -----------------------------------

 ╭─ Distro  -> Archcraft x86_64
 ├─ Editor  -> VSCode / NeoVim
 ├─ Browser -> Firefox
 ├─ Shell   -> ZSH
 ╰─ Resource Monitor -> Btop

 ╭─ Model -> ASUS TUF Gaming A15
 ├─ CPU   -> Ryzen 7 4800H @ 4.3GHz
 ├─ GPU   -> NVIDIA GeForce RTX 3050
 ╰─ Resolution -> 1920x1080

 ╭─ WM       -> Hyprland
 ├─ Terminal -> Kitty
 ├─ Theme    -> Tokyonight-Dark-BL-LB
 ├─ Icons    -> Tokyonight-Moon
 ╰─ Font     -> CaskaydiaCove Nerd Font

                        
```

---

### Wallpapers
[<img src="./assets/photos.png" width="400px" title="Wallpapers">](https://photos.app.goo.gl/h7EE46K7qDgLpQUv9)

<img src="./assets/line_break.svg" width="100%" title="Line break">

https://user-images.githubusercontent.com/43103163/217900808-384586b7-37e4-4d64-a306-0402763f6d8c.mp4

<div align="center">

## Installation
</div>

<details>
<summary><h3>Dependencies</h3></summary>

- Using <kbd>paru</kbd>
    ```sh
    paru -S base-devel pokemon-colorscripts-git hyprland-git hyprpicker-git xdg-desktop-portal-hyprland-git waybar-hyprland cava kitty wofi starship wl-clipboard swaync swaylock-effects swaylockd tty-clock-git playerctl pavucontrol btop mpd mpd-mpris mpv mpv-mpris qt5-base qt5-wayland qt6-base qt6-wayland lsd geany bat cliphist-bin polkit-gnome g4music wlogout visual-studio-code-bin boo-grub-git boo-sddm-git proxzima-plymouth-git --needed
    ```

- See https://wiki.hyprland.org/Useful-Utilities/Hyprland-desktop-portal/#installing
    ```sh
    paru -R xdg-desktop-portal-wlr
    ```

- Extra dependencies (not necessary)
    ```sh
    paru -S system76-power obs-studio wlrobs-hg v4l2loopback-dkms v4l2loopback-utils v4l-utils waydroid binder_linux-dkms chromium-wayland-vaapi qalculate-gtk qimgv-light rlr-git uget onlyoffice --needed
    ```

- [<kbd>Chaotic-AUR</kbd>](https://aur.chaotic.cx/) :: Automated building repo for AUR packages 👨🏻‍💻

> **Note**
>
> Go through the packages once, before blindly installing them.

</details>

<details>
<summary><h3>GTK Theme, Icons, Cursors</h3></summary>

- <kbd>GTK Theme</kbd> :: [<kbd>Tokyonight-Dark-BL-LB</kbd>](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme)
    ```sh
    cd ~/Downloads
    git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
    cd Tokyo-Night-GTK-Theme/
    sudo cp -r themes/Tokyonight-Dark-BL-LB /usr/share/themes/
    ```

- <kbd>Icons</kbd>:: [<kbd>Tokyonight-Moon</kbd>](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme)
    ```sh
    cd ~/Downloads
    git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
    cd Tokyo-Night-GTK-Theme/
    sudo cp -r icons/Tokyonight-Moon /usr/share/icons/
    ```

- <kbd>Cursors</kbd> :: [<kbd>Sweet-cursors</kbd>](https://github.com/EliverLara/Sweet/tree/nova/kde/cursors)
    ```sh
    cd ~/Downloads
    git clone https://github.com/EliverLara/Sweet.git -b nova
    cd Sweet/
    sudo cp -r kde/cursors/Sweet-cursors /usr/share/icons/
    ```

- <kbd>GRUB</kbd> :: [<kbd>PROxZIMA/boo-grub</kbd>](https://github.com/PROxZIMA/boo-grub)
- <kbd>Plymouth</kbd> :: [<kbd>PROxZIMA/proxzima-plymouth</kbd>](https://github.com/PROxZIMA/proxzima-plymouth)
- <kbd>SDDM</kbd> :: [<kbd>PROxZIMA/boo-sddm</kbd>](https://github.com/PROxZIMA/boo-sddm)
</details>

<details>
<summary><h3>Dotfiles</h3></summary>

```sh
cd ~/Downloads
git clone https://github.com/PROxZIMA/.dotfiles.git
cd .dotfiles
cp -r .config .icons .local .mpd .ncmpcpp .scripts ~/
cp .face .fonts.conf .dmrc .gtkrc-2.0 ~/
chmod -R +x ~/.scripts/
chmod +x ~/.config/hypr/autostart
```

> **Warning**
>
> Again, do not, I said DO NOT blindly run this. Backup your dots beforehand.<br>These commands are well suited for freshly installed systems.

</details>

<details>
<summary><h3>Extras</h3></summary>

#### Vscode
- Theme :: [<kbd>Sweet Dracula</kbd>](https://marketplace.visualstudio.com/items?itemName=PROxZIMA.sweetdracula)
- Extension :: [<kbd>Fix VSCode Checksums</kbd>](https://marketplace.visualstudio.com/items?itemName=lehni.vscode-fix-checksums)
- [<kbd>.dotfiles/.config/Code/User/vsc.css</kbd>](.config/Code/User/vsc.css) is a special CSS file that I use to modify vscode's UI (Vscode's core file is edited so follow the steps with care).
    ```sh
    $ # Replace [code|codium|vscodium-bin] with appropriate folder name.
    $ resPrefix=/usr/share/[code|codium|vscodium-bin]/resources/app/out/vs/code/electron-[browser|sandbox]/workbench
    $ # Symlink required files in the above folder.
    $ ln -s '/full/path/to/.dotfiles/.config/Code/User/vsc.css' $resPrefix
    $ ln -s '/full/path/to/.dotfiles/.icons/default/vsc/' $resPrefix
    ```
  - Open <kbd>$resPrefix/workbench.html</kbd> and add `<link rel="stylesheet" href='vsc.css'>` inside the `<head>` tag.
    ```sh
    $ sed -i 's;</head>;<link rel="stylesheet" href="vsc.css"></head>;g' $resPrefix/workbench.html
    ```
  - Restart Vscode. Open the command palette and execute <kbd>Fix Checksums: Apply</kbd>. Restart again.
    - Perform the above 2 steps every time Vscode is updated.
- ***Voilà !!!***
- If you don't want to touch the core file (which is not a big deal) you can use [<kbd>Customize UI</kbd>](https://marketplace.visualstudio.com/items?itemName=iocave.customize-ui).
  - This method may/may not work as extensions can't be guaranteed to always work.
  - All required settings are present in <kbd>settings.json</kbd>.
Use the following command to convert your <kbd>CSS</kbd> file to <kbd>Customize UI</kbd>'s json object.
    ```sh
    $ sed -ze 's/\n/ /g' -Ee 's,/\*[^*]*\*+([^/*][^*]*\*+)*/,,g' -Ee 's/ {2,}//g' -Ee 's/\}([^\{]*) \{/", "\1": "/g' -e 's/:root \{/{":root": "/g' vsc.css
    <kbd></kbd>`

#### Firefox
- Theme :: [<kbd>PROxZIMA/Sweet-Pop</kbd>](https://github.com/PROxZIMA/Sweet-Pop/)

#### Neovim ❤️
- Setup :: [<kbd>NvChad</kbd>](https://github.com/NvChad/NvChad)
- GUI :: [<kbd>Neovide</kbd>](https://github.com/neovide/neovide)
- Configs :: [<kbd>.dotfiles/.config/nvim</kbd>](.config/nvim/)

</details>

---

<details>
<summary><h2>Credits</h2></summary>

_© [r/unixporn](https://www.reddit.com/r/unixporn)_

_© All the maintainers and the artists <3_

_© [flick0](https://github.com/flick0/dotfiles/tree/aurora) © [Syndrizzle](https://github.com/syndrizzle/hotfiles/tree/bspwm) © [NvChad](https://github.com/NvChad) © [adi1090x](https://github.com/adi1090x)_

</details>

<img src="./assets/catppuccin_cat_on_line.svg" width="100%" title="Footer">

<div align="center">

*Sooo that's it for now. See ya!!!*

***ARIGATOU ❤️***
</div>

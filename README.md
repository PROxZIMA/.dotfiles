<div align="center">

<pre>




██████╗ ██████╗  ██████╗ ██╗  ██╗██╗   ██╗▄█╗███████╗    ██████╗  ██████╗ ████████╗███████╗
██╔══██╗██╔══██╗██╔═████╗╚██╗██╔╝╚██╗ ██╔╝╚═╝██╔════╝    ██╔══██╗██╔═████╗╚══██╔══╝██╔════╝
██████╔╝██████╔╝██║██╔██║ ╚███╔╝  ╚████╔╝    ███████╗    ██║  ██║██║██╔██║   ██║   ███████╗
██╔═══╝ ██╔══██╗████╔╝██║ ██╔██╗   ╚██╔╝     ╚════██║    ██║  ██║████╔╝██║   ██║   ╚════██║
██║     ██║  ██║╚██████╔╝██╔╝ ██╗   ██║      ███████║    ██████╔╝╚██████╔╝   ██║   ███████║
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚══════╝    ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝


</pre>
</div>

<h3 align="center">Terminal</h3>
<p align="center"><img src="./assets/terminal.png"></p>

<h3 align="center">VS Codium</h3>
<p align="center"><img src="./assets/vscodium.png"></p>

<h3 align="center">Firefox</h3>
<p align="center"><img src="./assets/firefox.png"></p>

<h3 align="center">Gedit</h3>
<p align="center"><img src="./assets/gedit.png"></p>

<h3 align="center">Neovim</h3>
<p align="center"><img src="./assets/neovim.png"></p>

<h3 align="center">Arc Menu</h3>
<p align="center"><img src="./assets/arcmenu.png"></p>

## Folder structure

 .<br>
├─  .config<br>
│ ├─  ArcMenu<br>
│ │ ├─  ArcMenu<br>
│ │ ╰─  ArcTheme<br>
│ ├─  Code<br>
│ │ ╰─  User<br>
│ │   ├─  keybindings.json<br>
│ │   ├─  settings.json<br>
│ │   ├─  snippets<br>
│ │   │ ╰─  snippet.code-snippets<br>
│ │   ╰─  vsc.css<br>
│ ├─  Dash to Dock<br>
│ │ ╰─  dash-to-dock<br>
│ ├─  fish<br>
│ │ ├─  config.fish<br>
│ │ ├─  fish_variables<br>
│ │ ╰─  functions<br>
│ │   ├─  __bass.py<br>
│ │   ├─  bass.fish<br>
│ │   ╰─  nvm.fish<br>
│ ├─  nvim<br>
│ │ ╰─  init.vim<br>
│ ╰─  starship.toml<br>
├─  .icons<br>
│ ╰─  default<br>
│   ├─  index.theme<br>
│   ├─  vsc-back.svg<br>
│   ╰─  vsc.svg<br>
├─  .local<br>
│ ╰─  share<br>
│  ├─  arcmenu<br>
│  │ ╰─  stylesheet.css<br>
│  ╰─  fonts<br>
│    ├─  Algerian.ttf<br>
│    ├─  Anzelia.ttf<br>
│    ├─  CascadiaCodePL.ttf<br>
│    ├─  Caveat-VariableFont_wght.ttf<br>
│    ├─  Fira Code Regular Nerd Font Complete.ttf<br>
│    ├─  Hack Regular Nerd Font Ligature.ttf<br>
│    ├─  JetBrains Mono Regular Nerd Font.ttf<br>
│    ├─  lmroman10-regular.otf<br>
│    ├─  lmromandemi10-regular.otf<br>
│    ├─  MesloLGS NF Regular.ttf<br>
│    ├─  optima.ttf<br>
│    ╰─  Shorelines Script Bold.otf<br>
├─  .p10k.zsh<br>
├─  .zshrc<br>
├─  apps.txt<br>
├─  assets<br>
│ ├─  ArcMenu.png<br>
│ ├─  gedit.png<br>
│ ├─  neovim.png<br>
│ ├─  terminal.png<br>
│ ╰─  vscodium.png<br>
├─  package.txt<br>
├─  README.md<br>
╰─  usr<br>
  ╰─  share<br>
    ├─  gedit<br>
    │ ╰─  styles<br>
    │   ╰─  dracula.xml<br>
    ╰─  sushi<br>
      ╰─  gtksourceview-4<br>
        ╰─  styles<br>
          ╰─  builder-dark.style-scheme.xml<br>


1) ArcMenu configs can be imported from it's settings. Menu Layout is `Ubuntu Dash Style`. `Dotfiles/.local/share/arcmenu/stylesheet.css` is basically the layout CSS. Should be placed in `~/.local/share/arcmenu/stylesheet.css`.<br><br>
2) Vscode configs should be placed in `~/.config/[code|vscodium]/User`. Theme used in screenshot is [Sweet Dracula](https://marketplace.visualstudio.com/items?itemName=PROxZIMA.sweetdracula) (Made by me 😁)
    - `Dotfiles/.config/Code/User/vsc.css` is a special CSS file which I use to modify vscode UI (Vscode core file is edited so follow steps with care).
    - Copy both `Dotfiles/.icons/default/vsc-back.svg` and `Dotfiles/.icons/default/vsc.svg` to `/usr/share/vscodium-bin/resources/app/out/vs/workbench`. Resource base directory can be `/usr/lib/code` or any other. `resources/app/...` is same for all.
    - First take backup of the main css file
        - `sudo cp /usr/share/vscodium-bin/resources/app/out/vs/workbench/workbench.desktop.main.css /usr/share/vscodium-bin/resources/app/out/vs/workbench/workbench.desktop.main.css2`
    - Append vsc.css to `workbench.desktop.main.css`
        - `echo 'cat Dotfiles/.config/Code/User/vsc.css >> /usr/share/vscodium-bin/resources/app/out/vs/workbench/workbench.desktop.main.css' | sudo -s`
    - Restart Vscode. Now Vscode will show a popup `Your code installation appears to be corrupt` as you modified a core file. To fix this install [Fix VSCode Checksums](https://marketplace.visualstudio.com/items?itemName=lehni.vscode-fix-checksums) and from command palette execute `Fix Checksums: Apply` and restart again.
    - Boom!!!
    - If you don't want to touch the core file (which is not a big deal) you can use [Customize UI](https://marketplace.visualstudio.com/items?itemName=iocave.customize-ui). All required settings are present in `settings.json`. This method may/may not work as extensions can't be guaranteed to work always.<br><br>
3) Firefox theme is mine too. Every little detail can be found [here](https://github.com/PROxZIMA/Firefox-Theme/)<br><br>
4) `zsh` is literally an awesome shell. Following are the two themes I use
    - `Dotfiles/.p10k.zsh` which I made using [Powerlevel10k](https://github.com/romkatv/powerlevel10k) :) I use it in vscode. See the screenshots. Installation can be found at P10K docs.
    - Other is [Spaceship](https://github.com/spaceship-prompt/spaceship-prompt) prompt. This is my default terminal prompt. Config: `Dotfiles/.config/starship.toml`.
    - `Dotfiles/.zshrc` should be placed in `~/`. Some aliases in-there are linked to the scripts I use. Can be found [here](https://github.com/PROxZIMA/My-Scripts).<br><br>
5) I don't use `fish` as my default shell but yeah I used to. So it's config is included too.<br><br>
6) I use `Dash to Dock` extensions so I've included it's config too. Import it from the extension settings.<br><br>
7) `Neovim` is love. I use [junegunn/vim-plug](https://github.com/junegunn/vim-plug) as my Vim plugin manager. Along with extensions mentioned in `Dotfiles/.config/nvim/init.vim`.<br><br>
8) `Dotfiles/.local/share/fonts` include some famous open-source ttf/otf.<br><br>
9) `Dotfiles/usr/share/gedit/styles/dracula.xml` is dracula based theme for Gedit.<br><br>
10) `Dotfiles/usr/share/sushi/gtksourceview-4/styles/builder-dark.style-scheme.xml` is `[sushi](https://gitlab.gnome.org/GNOME/sushi)` (A GNOME file previewer) style scheme derived from `dracula.xml`.<br><br>
11) `Dotfiles/apps.txt` and `Dotfiles/package.txt` are simply applications and packages I use.<br><br>

Sooo that's it for now. I'll update this repo time to time. Feel free to raise an issue if something is wrong. See ya!!!<br><br>
___
<h2 align="center">ARIGATOU</h2>

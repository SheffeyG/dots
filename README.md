### Neovim

Install the latest nvim via appimage:

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

If the ./nvim.appimage command fails, try:

```
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# optional: exposing nvim globally.
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```

If you use Ubuntu:

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && apt upgrade
sudo apt install neovim
```

Some mason-provided packages are not compatible with aarch64 platform,
install them manaully:

```
pkg in lua-language-server stylua
npm i clangd
```

### Zsh

Change default shell to zsh:

```
chsh -s $(which zsh)
```

### Scripts

Format print commits history to a markdown file:

```
git log --reverse --pretty=format:"## %h %s" > note.md
```

### neovim

Install the latest neovim appimage package:

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

For aarch64 platform, use this [repo](https://github.com/matsuu/neovim-aarch64-appimage/releases) instead.

If the appimage runs failed, try:

```sh
./nvim.appimage --appimage-extract
mkdir /app && mv squashfs-root /app/neovim
ln -s /app/neovim/AppRun /usr/bin/nvim
```

Or from ppa unstable source:

```sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && apt upgrade
sudo apt install neovim
```

Some mason-provided packages are not compatible with aarch64 platform,
install them manaully:

```sh
pkg in lua-language-server stylua
npm i clangd
```

### conda

Download miniconda3 from [here](https://repo.anaconda.com/miniconda/).

Install miniconda3:

```sh
bash miniconda.sh -b -u -p ~/miniconda3
```

### nvm

```sh
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
```

### zsh

Change default shell to zsh:

```sh
chsh -s $(which zsh)
```

### git

Format print commits history to a markdown file:

```sh
git log --reverse --pretty=format:"## %h %s" > note.md
```

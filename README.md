### neovim

* [appimage](https://github.com/neovim/neovim/releases/latest/download/nvim.appimage)

```sh
./nvim.appimage --appimage-extract
mkdir /app && mv squashfs-root /app/neovim
ln -s /app/neovim/AppRun /usr/bin/nvim
```

* [ppa](https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable)

```sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && apt upgrade
sudo apt install neovim
```

* [arm64](https://github.com/matsuu/neovim-aarch64-appimage/releases)

Some mason-provided packages are not compatible with arm64 platform,
install them manaully:

```sh
pkg in lua-language-server stylua
npm i clangd
```

### package managers

* [miniconda](https://repo.anaconda.com/miniconda/).

```sh
bash miniconda.sh -b -u -p ~/miniconda3
```

* [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#table-of-contents)

```sh
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
```

### scripts

Format print commits history to a markdown file:

```sh
git log --reverse --pretty=format:"## %h %s" > note.md
```

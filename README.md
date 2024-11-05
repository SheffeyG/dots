### Neovim

Install the latest neovim for ubuntu:

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
sudo chsh -s $(which zsh)
```

Format print commits history to a markdown file:

```
git log --reverse --pretty=format:"## %h %s" > note.md
```

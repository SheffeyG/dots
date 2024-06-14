# NeoVim NvChad Configures

## Install

```
# install latest neovim for ubuntu
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
# set configures  
git clone https://github.com/SheffeyG/nvchad-config.git ~/.config/nvim && nvim
```

### LSP on Termux
Some pkgs in mason are not support aarch64 platform.
```
pkg in lua-language-server stylua
npm i clangd
```

## Remove
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

## Reference
[NvChad starter](https://github.com/NvChad/starter)

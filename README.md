### Tmux

Clone tpm(Tmux Plugin Manager)

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```

### Nvim

Install latest neovim for ubuntu
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && apt upgrade 
sudo apt install neovim
```

**Termux**

Some packages in mason are not support aarch64 platform, 
you can install them manaully in termux.
```
pkg in lua-language-server stylua
npm i clangd
```


### Ubuntu

Install latest neovim 
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && apt upgrade 
sudo apt install neovim
```

### AArch64

Some Mason-provided packages are not compatible with aarch64 platform, 
need install them manaully.
```
pkg in lua-language-server stylua
npm i clangd
```


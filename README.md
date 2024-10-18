### Ubuntu

Install the latest neovim for ubuntu: 
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

### Scripts

Format print all commits to a markdown file:
```
git log --reverse --pretty=format:"## %h %s" > note.md
```


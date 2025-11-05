- [win32yank](https://github.com/equalsraf/win32yank/releases)

- [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#manual-install)
    ```sh
    export NVM_DIR="$HOME/.nvm" && (
      git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
      cd "$NVM_DIR"
      git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"
    ```

- [miniconda](https://repo.anaconda.com/miniconda)
    ```sh
    bash miniconda.sh -b -u -p ~/miniconda3
    ```

- [check term 256 colors](https://blog.jpalardy.com/posts/fixing-tmux-for-256-colors)
    ```sh
    awk 'BEGIN {
      s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
      for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
      }
      printf "\n";
    }'
    ```

- tty fallback to bash
```sh
# ~/.profile
if [[ ! ( -z "$DISPLAY" && "$(tty)" =~ ^/dev/tty[0-9]+$ ) ]]; then
  exec zsh -l 2>/dev/null || exec bash
fi
```

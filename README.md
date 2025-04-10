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

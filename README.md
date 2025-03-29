### neovim

* [win32yank](https://github.com/equalsraf/win32yank/releases)

Needs add win32yank to `neovim.env.PATH`.

### package manager

* [miniconda](https://repo.anaconda.com/miniconda/)

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

Format print commits history into a markdown file:

```sh
git log --reverse --pretty=format:"## %h %s" > note.md
```

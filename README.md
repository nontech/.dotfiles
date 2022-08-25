# .dotfiles

I manage my `.dotfiles` using [Stow](https://www.gnu.org/software/stow/manual/stow.html)

### What is stow?

GNU Stow is a symlink farm manager which takes distinct sets of software and/or data located in separate directories on the filesystem, and makes them all appear to be installed in a single directory tree.

### Concepts

|  | /usr/local/stow/perl/bin/perl | ~/.dotfiles/zsh/.zshrc |
| --- | --- | --- |
| target directory | /usr/local | ~ or /home/mukesh |
| stow directory | /usr/local/stow | ~/.dotfiles |
| package directory | /usr/local/stow/perl | ~/.dotfiles/zsh |
| part of installation image | bin/perl | .zshrc |

### Creating `.dotfiles` (or stow directory) for the very first time

- performed once at the very beginning

```bash
Setup
1. Create a .dotfiles (or stow directory of your name) in Github
2. Pull it locally in your ~ (home directory)
3. Create a directory structure of the things you want to track/stow
```

Create the file structure with empty files in stow directory (here it’s `~/.dotfiles/` )

- the structure should match exact file names and directory structure
- contents will be empty

```bash
~/.dotfiles
├── i3
│   └── .config
│       └── i3
│           └── config
├── nvim
│   └── .config
│       └── nvim
│           ├── coc-settings.json
│           ├── init.vim
│           └── plugins
│               ├── airline.vim
│               ├── auto-pairs.vim
│               ├── bbye.vim
│               ├── coc-elixir.vim
│               ├── coc.vim
│               ├── comfortable-motion.vim
│               ├── commentary.vim
│               ├── dracula.vim
│               ├── easymotion.vim
│               ├── elixir.vim
│               ├── endwise.vim
│               ├── fugitive.vim
│               ├── fzf.vim
│               ├── gitgutter.vim
│               ├── incsearch-easymotion.vim
│               ├── incsearch-fuzzy.vim
│               ├── incsearch.vim
│               ├── mix-format.vim
│               ├── move.vim
│               ├── mundo.vim
│               ├── nerdtree.vim
│               ├── polyglot.vim
│               ├── prettier.vim
│               ├── startify.vim
│               ├── surround.vim
│               ├── test.vim
│               ├── vimagit.vim
│               └── winresizer.vim
├── README.md
└── zsh
    ├── .zshenv
    └── .zshrc
```

Adopting existing files on your computer using `—adopt` option

```bash
# n - don't perform any operation
# v - verbose output
# t - target directory

# Step 1: Check if files already exist on your computer
.dotfiles git:master ✩  ❯ stow -nvt ~ zsh i3 nvim                   ⏎
WARNING! stowing i3 would cause conflicts:
  * existing target is neither a link nor a directory: .config/i3/config
WARNING! stowing nvim would cause conflicts:
  * existing target is neither a link nor a directory: .config/nvim/coc-settings.json
  * existing target is neither a link nor a directory: .config/nvim/init.vim
WARNING! stowing zsh would cause conflicts:
  * existing target is neither a link nor a directory: .zshenv
  * existing target is neither a link nor a directory: .zshrc
All operations aborted.

# Step 2: see what would happen
# files get moved to your stow directory & corresponding sym links are created in the home directory
.dotfiles git:master ✩  ❯ stow --adopt -nvt ~ zsh i3 nvim           ⏎
MV: .zshrc -> .dotfiles/zsh/.zshrc
LINK: .zshrc => .dotfiles/zsh/.zshrc
MV: .zshenv -> .dotfiles/zsh/.zshenv
LINK: .zshenv => .dotfiles/zsh/.zshenv
MV: .config/i3/config -> .dotfiles/i3/.config/i3/config
LINK: .config/i3/config => ../../.dotfiles/i3/.config/i3/config
MV: .config/nvim/init.vim -> .dotfiles/nvim/.config/nvim/init.vim
LINK: .config/nvim/init.vim => ../../.dotfiles/nvim/.config/nvim/init.vim
MV: .config/nvim/coc-settings.json -> .dotfiles/nvim/.config/nvim/coc-settings.json
LINK: .config/nvim/coc-settings.json => ../../.dotfiles/nvim/.config/nvim/coc-settings.json
WARNING: in simulation mode so not modifying filesystem.

# Step 3: perform the actions
.dotfiles git:master ✩  ❯ stow --adopt -vt ~ zsh i3 nvim
MV: .zshrc -> .dotfiles/zsh/.zshrc
LINK: .zshrc => .dotfiles/zsh/.zshrc
MV: .zshenv -> .dotfiles/zsh/.zshenv
LINK: .zshenv => .dotfiles/zsh/.zshenv
MV: .config/i3/config -> .dotfiles/i3/.config/i3/config
LINK: .config/i3/config => ../../.dotfiles/i3/.config/i3/config
MV: .config/nvim/init.vim -> .dotfiles/nvim/.config/nvim/init.vim
LINK: .config/nvim/init.vim => ../../.dotfiles/nvim/.config/nvim/init.vim
MV: .config/nvim/coc-settings.json -> .dotfiles/nvim/.config/nvim/coc-settings.json
LINK: .config/nvim/coc-settings.json => ../../.dotfiles/nvim/.config/nvim/coc-settings.json
```

### Using `.dotfiles` from Github on a new computer

- Download the stow directory (`.dotfiles` in my case) from git in home directory

# Stow or restore your config files

```bash
# check what happens
~/.dotfiles -> stow -nvSt ~ git i3 nvim (whatever package directory you have)

# perform the action
~/.dotfiles -> stow -vSt ~ git i3 nvim (whatever package directory you have)

# now corresponding symlinks are created in the home directory
```

# remove symlinks or unlink

```bash
# check what happens
~/.dotfiles -> stow -nvDt ~ git i3 nvim (whatever package directory you have)

# perform the action
~/.dotfiles -> stow -vDt ~ git i3 nvim (whatever package directory you have)

# now corresponding symlinks in target directory are deleted
# note: files are still present in stow directory
```

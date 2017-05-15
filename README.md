Based on https://news.ycombinator.com/item?id=11070797

Usage:

```
git clone --separate-git-dir=~/.myconf git@github.com:joshp123/dotfiles.git ~

```

Or if `~` is not empty:

    git clone --separate-git-dir=$HOME/.myconf git@github.com:joshp123/dotfiles.git $HOME/myconf-tmp
    rm -r ~/myconf-tmp/
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
    config checkout -f
 
Then to clone necessary repos, set up `zsh` etc:

`./config_setup.sh`

Don't forget to also run `:Plugin Install` on the first run of vim.

TODO: alias vim -> nvim? pip install neovim plugin (pip2/pip3)

Based on https://news.ycombinator.com/item?id=11070797

Usage:

```
git clone --separate-git-dir=~/.myconf git@github.com:joshp123/dotfiles.git ~

```

Or if `~` is not empty:

    git clone --separate-git-dir=$HOME/.myconf /path/to/repo $HOME/myconf-tmp
    cp ~/myconf-tmp/.gitmodules ~  # If you use Git submodules
    rm -r ~/myconf-tmp/
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
 
Then to clone necessary repos, set up `zsh` etc:

./config_setup.sh

# Installing dotfiles onto a new system

```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo '.cfg' >> .gitignore
git clone --bare https://github.com/loqusion/dotfiles $HOME/.cfg
config checkout
config config --local status.showUntrackedFiles no
```

[Inspiration for this setup](https://www.atlassian.com/git/tutorials/dotfiles)

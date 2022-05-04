# Installing dotfiles onto a new system

```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo '.cfg' >> .gitignore
git clone --bare git@github.com:loqusion/dotfiles.git $HOME/.cfg
config config core.sparseCheckout true
echo -e '/*\n!README.md' > $HOME/.cfg/info/sparse-checkout
config checkout
config config --local status.showUntrackedFiles no
```

[Inspiration for this setup](https://www.atlassian.com/git/tutorials/dotfiles)

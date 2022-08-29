# Installing dotfiles onto a new system

```sh
which gh >/dev/null 2>&1 || {
    which brew >/dev/null 2>&1 ||
    {
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
        eval "$(/opt/homebrew/bin/brew shellenv)"
    } &&
    brew install gh
} &&
sh -c "$(gh api -q '.content | @base64d' repos/loqusion/dotfiles/contents/install.sh)"
```

[Inspiration for this setup](https://www.atlassian.com/git/tutorials/dotfiles)

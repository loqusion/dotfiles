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
gh auth status >/dev/null 2>&1 || {
    gh auth login --hostname github.com --git-protocol ssh --web
} &&
sh -c "$(gh api -q '.content | @base64d' repos/loqusion/dotfiles/contents/install.sh)"

# Omit this if you only want to clone the dotfiles without installing dependencies
sh -c "$(gh api -q '.content | @base64d' repos/loqusion/dotfiles/contents/install-deps.sh)"
```

# TODO: gh auth login --hostname github.com --git-protocol ssh --web

[Inspiration for this setup](https://www.atlassian.com/git/tutorials/dotfiles)

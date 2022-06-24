# Installing dotfiles onto a new system

```sh
sh -c "$(gh api -q '.content | @base64d' repos/loqusion/dotfiles/contents/install.sh)"
```

[Inspiration for this setup](https://www.atlassian.com/git/tutorials/dotfiles)

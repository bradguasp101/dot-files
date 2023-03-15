# Kobra's dot-files
Kitty + Fish + Nvim. Setup configured with speed in mind.
This is a work in progress and so configurations are
volatile.

---

This repository contains configuration for zsh, and can integrate with
any shell, in theory. [Spaceship](https://github.com/spaceship-prompt/spaceship-prompt)
is used for zsh configurations and [starship](https://starship.rs/) is used for fish configurations.

To install any of these configurations, you will need to have installed [GNU stow](https://www.gnu.org/software/stow/)
which can be installed with homebrew on a mac: `brew install stow`. Once stow has been installed,
it can symlink the configuration files
```
stow -v -R -t ~ nvim
stow -v -R -t ~ kitty
stow -v -R -t ~ fish
stow -v -R -t ~ git
stow -v -R -t ~ zellij
stow -v -R -t ~ zk
```

## Extra Setup
Aside from cloning this repository, you should also add git config `user` information in the ignored
[user](git/gituser) file.

There are also some COLEMAK keymaps in [mapping.lua](nvim/.config/nvim/lua/kobra/mapping.lua).

There are also a few extra dependencies required to enjoy all the functionality available.
These are:
1. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. [autopep8](https://pypi.org/project/autopep8/)
3. [rustfmt](https://github.com/rust-lang/rustfmt)
4. [yamllint](https://yamllint.readthedocs.io/en/stable/)
5. [proselint](https://github.com/amperser/proselint)
6. [misspell](https://github.com/client9/misspell)
7. [write-good](https://github.com/btford/write-good)
8. [golines](https://pkg.go.dev/github.com/wrype/golines)
9. [golangci_lint](https://golangci-lint.run/usage/install/)
10. [revive](https://github.com/mgechev/revive)
11. awk
12. Java
13. [wollemi](https://github.com/tcncloud/wollemi)
14. [grpcui](https://github.com/fullstorydev/grpcui)

If something doesn't work right, first try running `:checkhealth` and resolving any
warnings or errors found.

# Special Thanks
@bheadwhite for suggesting so many of the plugins and tools I have integrated into my daily
workflow.

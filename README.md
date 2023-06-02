# Kobra's dot-files
Kitty + Fish + Nvim. Setup configured with speed in mind.
This is a work in progress and so configurations are
volatile.

---

This repository contains configuration for zsh, and can integrate with
any shell, in theory. [Spaceship](https://github.com/spaceship-prompt/spaceship-prompt)
is used for zsh configurations and [starship](https://starship.rs/) is used for fish configurations.

Mac Setup:
- Install kitty: `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`
- Install the [font](fonts/Go%20Mono%20Nerd%20Font%20Complete%20Mono.ttf) bundled with this config
  - You just need to open the file for the system to install it
- Install grc: `brew install grc`
- Install zoxide: `brew install zoxide`
- Install fish: `brew install fish`
  - You should also add fish to `/etc/shells`: `echo /usr/local/bin/fish | sudo tee -a /etc/shells`
  - Then make fish the default shell: `chsh -s /usr/local/bin/fish`
- Install [java](https://www.oracle.com/java/technologies/downloads/)
- Install zellij: `brew install zellij`
- Install fd: ` brew install fd`
- Install [ms-jpq/sad/sad](https://github.com/ms-jpq/sad): `brew install ms-jpq/sad/sad`
- Install exa: `brew install exa`
- Install node using `nvm`
- Install yarn
  ```
  npm i -g yarn
  yarn global add neovim
  ```
- Install pynvim: `pip3 install pynvim`
- Install ruby
  ```
  brew install rbenv
  brew install libyaml
  rbenv install 3.2.1 && rbenv global 3.2.1
  gem install neovim
  ```
- Install [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep): `brew install ripgrep`
- Install go: `brew install go`
- Install cargo via rustup: `curl https://sh.rustup.rs -sSf | sh`
- Install bat: `brew install bat`
- Install glow: `brew install glow`
- Install wget: `brew install wget`
- Install tsc: `npm install -g typescript`
- Install [revive](https://github.com/mgechev/revive)
- Install [wollemi](https://github.com/tcncloud/wollemi)
- Install [grpcui](https://github.com/fullstorydev/grpcui)
- Install neovim: `brew install neovim`

To install any of these configurations, you will need to have installed [GNU stow](https://www.gnu.org/software/stow/)
which can be installed with homebrew on a mac: `brew install stow`. Once stow has been installed,
it can symlink the configuration files
```
stow -v -R -t ~ nvim
stow -v -R -t ~ kitty
stow -v -R -t ~ fish
stow -v -R -t ~ git
stow -v -R -t ~ zellij
// etc.
```

## Extra Setup
Aside from cloning this repository, you should also add git config `user` information in the ignored
user (git/gituser) file.
```
[user]
  name = <name>
  email = <email>
```

There is also a secrets (fish/.config/fish/conf.d/secrets.fish) file that is excluded where you can put any of your secrets. For example,
to get the ChatGPT plugin to work, you will need to put `set -gx OPENAI_API_KEY "<api-key>"` in that file.

You can also turn off COLEMAK keymaps in [mapping.lua](nvim/.config/nvim/lua/kobra/core/mapping.lua) with `COLEMAK = false`.

If something doesn't work right, first try running `:checkhealth` and resolving any
warnings or errors found.

# Special Thanks
https://github.com/bheadwhite for suggesting so many of the plugins and tools I have integrated into my daily
workflow.

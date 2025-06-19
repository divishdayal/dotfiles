# Installation

```
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install zsh
brew install zsh

# install plugins
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-autocomplete
brew install z

# install node
brew install node

# get ~/.zshrc

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
brew install tmux
ln -s ~/code/dotfiles/tmux/.tmux.conf ~/.tmux.conf


# brew install neovim
brew install neovim

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# clone https://github.com/divishdayal/dotfiles
ln -s ~/code/dotfiles/nvim/config/nvim ~/.config/nvim

# for pycharm
ln -s ~/code/dotfiles/.ideavimrc ~/.ideavimrc
```
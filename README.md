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

# get ~/.zshrc from the repo as starting for .zshrc (some edits will have to be made as installations are made)
cp ~/code/dotfiles/.zshrc ~/.zshrc

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

# install pyenv
brew install pyenv

# multi-line statement below
cat << 'EOF' >> ~/.zshrc
# pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
EOF

pyenv install 3.12 # or whichever version
pyenv global 3.12

# poetry
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc


```
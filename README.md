# Install from script
1. Run `source ubuntu.sh` 
2. Go to `nvim` in terminal, and type `:PlugInstall`

# Install without script: Steps
dotfiles for sytem shell and editor configurations

```
1. sudo apt install neovim <install neovim>
for amazon instance : https://gist.github.com/kawaz/393c7f62fe6e857cc3d9
2. rm -rf .config
3.<clone this repository>
4. ln -s dotfiles/config ~/.config
5.#install vim-plug from https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

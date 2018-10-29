# copy configs
cp .tmux.conf ~
cp .vimrc ~
cp .zshrc ~

sudo apt install vim
sudo apt-get install tmux
sudo apt-get install pylint
sudo apt-get install tsserver

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \\
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vim extensions
git clone https://github.com/w0rp/ale.git ~/.vim/bundle/ale
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# tmux plygins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install nodejs
sudo apt-get install nodejs
sudo apt-get install npm
sudo npm install --save typescript
sudo npm install express-generator --save
sudo npm install express --save

# zsh plugins
sudo apt-get install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search

# keyboard language switching
gsettings set org.gnome.desktop.input-sources show-all-sources true
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"

# python
python -m pip install --upgrade pip
python -m pip install jupyter
sudo pip install pandas
sudo pip install numpy
sudo pip install matplotlib
sudo pip install python-language-server

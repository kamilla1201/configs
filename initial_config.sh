apt-get update
apt-get upgrade -y

apt-get install vim -y
apt-get install tmux -y
apt-get install pylint -y
apt-get install gnome-tweak-tool -y
apt-get install gufw -y
apt-get install vlc -y
apt-get install gimp -y
apt-get install shutter -y
apt-get install ubuntu-restricted-extras -y
apt-get install curl -y
apt-get install x11-xserver-utils -y

ufw enable

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vim extensions
git clone https://github.com/w0rp/ale.git ~/.vim/bundle/ale
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# tmux plygins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install nodejs
apt-get install nodejs -y
apt-get install npm -y
npm install  -g eslint

# zsh
apt-get install zsh -y

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search

# keyboard language switching
gsettings set org.gnome.desktop.input-sources show-all-sources true
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"

# python
apt-get install python3.6
apt-get install python3-distutils

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py && rm get-pip.py
python3 -m pip install --upgrade pip
python3 -m pip install setuptools
python3 -m pip install jupyter
python3 -m pip install pandas
python3 -m pip install numpy
python3 -m pip install matplotlib
python3 -m pip install python-language-server
python3 -m pip install opencv-python
# copy configs
cp .tmux.conf ~
cp .vimrc ~
cp .zshrc ~
cp .pylintrc ~

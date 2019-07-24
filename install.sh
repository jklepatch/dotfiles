#!/usr/bin/env bash
# Install script for Ubuntu 16.04
# UNTESTED - CAREFUL

echo "You are about to setup your laptop\n"
read -p "Are you sure? [y/n]" choice
case "$choice" in
  y|Y ) main();;
  n|N ) echo "Operation cancelled"; exit 1;;
  * ) echo "invalid"; exit 1;
esac

function install_vim {
}

function install_build_tools {
  echo "Installing build tools..."
  apt-get install build-essential
  apt-get install cmake
  apt-get install pkg-config
}

function install_utilities {
  echo "Installing version utilities..."
  apt-get install xclip
  apt-get install curl
}

function install_version_control_tools {
  echo "Installing version control tools..."
  apt-get install git
  apt-get install gitk #Graphical git
  git config --global user.email "julien@julienklepatch.com"
  git config --global user.name "Julien Klepatch"
}

function install_text_editors {
  echo "Installing text editors..."
  apt-get install vim
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
  git clone https://github.com/bling/vim-airline             ~/.vim/bundle/vim-airline
  git clone https://github.com/kien/ctrlp.vim.git            ~/.vim/bundle/ctrlp.vim
  git clone https://github.com/scrooloose/nerdtree.git       ~/.vim/bundle/nerdtree
  git clone https://github.com/scrooloose/nerdcommenter.git  ~/.vim/bundle/nerdcommenter
  git clone https://github.com/airblade/vim-gitgutter.git    ~/.vim/bundle/vim-gitgutter
  git clone https://github.com/tpope/vim-surround.git        ~/.vim/bundle/vim-surround
  git clone https://github.com/tpope/vim-repeat.git          ~/.vim/bundle/vim-repeat
  git clone https://github.com/elixir-lang/vim-elixir.git    ~/.vim/bundle/vim-elixir
  git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
  git clone https://github.com/tomlion/vim-solidity.git ~/.vim/bundle/vim-solidity
  git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
  git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
  git submodule add https://github.com/octol/vim-cpp-enhanced-highlight.git ~/.vim/bundle/syntax
  git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim

  apt-get install vscode
}

function install_programming_languages {
  echo "Installing programming languages..."
  #NVM (Node Version Manager)
  curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
  bash install_nvm.sh

  #Rust 
  #See https://www.rust-lang.org/en-US/install.html
  curl https://sh.rustup.rs -sSf | sh
}

function install_databases {
  echo "Installing databases..."
  #Mysql
  #See https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-04
  apt-get install mysql-server
  mysql_secure_installation

  #Postgres
  #See https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-04
  apt-get install postgresql postgresql-contrib
}

install install_devops_tools() {
  echo "Installing devops tools...\n"
  apt-get install ansible
  apt-get install vagrant
  apt-get install sshpass  #necessary for vagrant
  apt-get install virtualbox #necessary for vagrant
  #Docker
  #See https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-04
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  dd-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  apt-get update
  apt-cache policy docker-ce
  apt-get install -y docker-ce
  usermod -aG docker ${USER}
  su - ${USER}
}

function install_desktop_apps {
  echo "Installing desktop apps..."
  apt-get install filezilla
  apt-get install calibre #epub reader
  add-apt-repository ppa:deluge-team/ppa && apt-get install deluge #bittorent client
  apt-get install irssi #IRC client
}

function setup_dotfiles {
  echo "Setting up dotfiles..."
  cd ~
  git clone http://github.com/jklepatch/dotfiles
  rm ~/.tmux.conf
  rm ~/.vimrc
  ln -s ~/.dotfiles/.vimrc ~/.vimrc 
  ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf 
}

function main() {
  apt-get update
  install_build_tools()
  install_utilities()
  install version_control_tools()
  install_text_editors()
  install_programming_languages()
  install_databases()
  install_desktop_apps()
  setup_dotfiles()
}

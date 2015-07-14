#! /bin/sh

# Get OS bit
# 32bit : i686
# 64bit : x86_64
get_os_bit() {
  os_bit=$(uname -m)
  echo "OS bit: ${os_bit}"
}

# Get Linux distribution name
get_os_distribution() {
  package_manager="unknown"
  if   [ -e /etc/debian_version ] ||
    [ -e /etc/debian_release ]; then
    # Check Ubuntu or Debian
    if [ -e /etc/lsb-release ]; then
      # Ubuntu
      distri_name="ubuntu"
    else
      # Debian
      distri_name="debian"
    fi
    package_manager="apt-get"
  elif [ -e /etc/fedora-release ]; then
    # Fedra
    distri_name="fedora"
  elif [ -e /etc/redhat-release ]; then
    # CentOS
    distri_name="redhat"
    package_manager="yum"
  elif [ -e /etc/turbolinux-release ]; then
    # Turbolinux
    distri_name="turbol"
  elif [ -e /etc/SuSE-release ]; then
    # SuSE Linux
    distri_name="suse"
  elif [ -e /etc/mandriva-release ]; then
    # Mandriva Linux
    distri_name="mandriva"
  elif [ -e /etc/vine-release ]; then
    # Vine Linux
    distri_name="vine"
  elif [ -e /etc/gentoo-release ]; then
    # Gentoo Linux
    distri_name="gentoo"
  else
    # Other
    echo "unkown distribution"
    distri_name="unknown"
  fi

  echo "distribution: ${distri_name}"
  echo "package manager: ${package_manager}"
}

# Get distribution and bit
get_os_info() {
  get_os_bit
  get_os_distribution
}
if package_name=="unknown"; then
  return
fi

get_os_info
${package_manager} -v
sudo ${package_manager} install vim zsh git
sudo chsh -s /bin/zsh
echo "Enter your git name..."
read git_name
echo "Enter your git email..."
read git_email
git config --global user.name ${git_name}
git config --global user.email ${git_email}
git config --global alias.tr "log --graph --pretty='format:%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'"
cd ~/.dotfiles
git submodule https://github.com/Shougo/neobundle.vim.git vim/bundle/neobundle.vim
git submodule https://github.com/sorin-ionescu/prezto.git zsh/zprezto
git submodule update --init --recursive
mkdir ~/TEMP
cd ~/TEMP
git clone https://github.com/github/hub.git
cd hub
./script/build
cp hub /usr/local/bin
cp man/hub.* /usr/local/man/
cp etc/hub.* /usr/local/etc/
cd ..
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
. ~/.nvm/nvm.sh
nvm install stable
nvm alias default stable


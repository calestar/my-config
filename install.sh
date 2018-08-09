#! /bin/bash


# Decide what to install
if [[ $(uname -r) =~ Microsoft$ ]]; then
  echo "OS detected: Microsoft WSL"
  has_UI="false"
else
  echo "OS detected: Linux"
  has_UI="true"
fi

if command -v vim &> /dev/null; then
  has_vim="true"
else
  has_vim="false"
fi

if [ $SHELL = "/bin/bash" ]; then
  has_bash="true"
else
  has_bash="false"
fi

if command -v git &> /dev/null; then
  has_git="true"
else
  has_git="false"
fi


# Default values
needs_awesome_config=$has_UI
needs_X_config=$has_UI
needs_vim_config=$has_vim
needs_bash_extra=$has_bash
needs_git_prompt=$has_git
needs_git_bash_completion=$has_git
needs_git_config=$has_git
needs_binaries="true"


# Check current state and update the things that will be installed
if [ $needs_awesome_config = "true" ]; then
  if [ -L ~/.config/awesome ]; then
    # Already installed, skip !
    needs_awesome_config="false"
  fi
fi

if [ $needs_X_config = "true" ]; then
  if [ -L ~/.Xdefaults ]; then
    # Already installed, skip !
    needs_X_config="false"
  fi
fi

if [ $needs_binaries = "true" ]; then
  if [ -d ~/bin/extra ]; then
    # Already installed, skip !
    needs_binaries="false"
  fi
fi

if [ $needs_vim_config = "true" ]; then
  if [ -f ~/.vimrc_extra ]; then
    # Already installed, skip !
    needs_vim_config="false"
  fi
fi

if [ $needs_bash_extra = "true" ]; then
  if [ -f ~/.bashrc_extra ]; then
    # Already installed, skip !
    needs_bash_extra="false"
  fi
fi

if [ $needs_git_prompt = "true" ]; then
  if [ -f ~/.git-prompt.sh ]; then
    # Already installed, skip !
    needs_git_prompt="false"
  fi
fi

if [ $needs_git_bash_completion = "true" ]; then
  if [ -f ~/.git_bash_completion.bash ]; then
    # Already installed, skip !
    needs_git_bash_completion="false"
  fi
fi

# Say what we will install
echo "Installing awesome config? $needs_awesome_config"
echo "Installing scripts and binaries? $needs_binaries"
echo "Installing bash extra config? $needs_bash_extra"
echo "Installing vim config? $needs_vim_config"
echo "Installing X config? $needs_X_config"
echo "Installing git prompt script? $needs_git_prompt"
echo "Installing git bash completion? $needs_git_bash_completion"
echo "Applying git config? $needs_git_config"


# Apply whatever needs to be applied
if [ $needs_awesome_config = "true" ]; then
  echo Installing awesome config ...
  ln --symbolic `pwd`/awesome ~/.config/awesome
fi

if [ $needs_binaries = "true" ]; then
  echo Installing bin extra ...
  mkdir --parents ~/bin/
  ln --symbolic `pwd`/bin ~/bin/extra
fi

if [ $needs_bash_extra = "true" ]; then
  echo Installing bash integration ...
  ln --symbolic `pwd`/bash/bash_extra.sh ~/.bashrc_extra
  echo Do not forget to source ~/.bashrc_extra in your ~/.bashrc to finish integration
fi

if [ $needs_vim_config = "true" ]; then
  echo Installing vim integration ...
  ln --symbolic `pwd`/vim/vimrc_extra ~/.vimrc_extra
  if [ -f ~/.vimrc ]; then
    echo Do not forget to add \"source ~/.vimrc_extra\" to your ~/.vimrc file to finish integration
  else
    echo source ~/.vimrc_extra > ~/.vimrc
  fi
fi

if [ $needs_X_config = "true" ]; then
  echo Installing .XDefaults ...
  ln --symbolic `pwd`/X/.Xdefaults ~/.Xdefaults
fi

if [ $needs_git_prompt = "true" ]; then
  echo Installing git prompt script ...
  ln --symbolic `pwd`/bash/git-prompt.sh  ~/.git-prompt.sh
fi

if [ $needs_git_bash_completion = "true" ]; then
  echo Installing git bash completion ...
  curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git_bash_completion.bash
fi

if [ $needs_git_config = "true" ]; then
  echo Applying git config ...
  git config --global core.editor vim
  git config --global color.branch auto
  git config --global color.diff auto
  git config --global color.status auto
  git config --global user.name "Jean-Sébastien Gélinas"
  git config --global user.email calestar@gmail.com
fi

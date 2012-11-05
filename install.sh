#! /bin/bash

# awesome config
if [ ! -L ~/.config/awesome ]; then
  echo Installing awesome config ...
  ln --symbolic `pwd`/awesome ~/.config/awesome
fi

# Prepare binaries
if [ ! -L ~/.bashrc_extra ]; then
  echo Installing bin extra
  mkdir --parents ~/bin/
  ln --symbolic `pwd`/bin ~/bin/extra
fi

# Prepare bash integration
if [ ! -L ~/.bashrc_extra ]; then
  echo Installing bash integration
  ln --symbolic `pwd`/bash/bash_extra.sh ~/.bashrc_extra
  echo Do not forget to source ~/.bashrc_extra in your ~/.bashrc to finish integration
fi

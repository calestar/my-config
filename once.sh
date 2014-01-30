#! /bin/bash

echo "Doing some git configuration ..."
git config --global core.editor vim
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto

echo "Getting bash compilation script"
curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git_bash_completion.bash


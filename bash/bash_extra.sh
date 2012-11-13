
# Add ~/bin and ~/bin/extra to the path
PATH=~/bin:~/bin/extra:$PATH

# Git integration
. /etc/bash_completion.d/git
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Some aliases I like
alias m='make'

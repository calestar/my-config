
#### Used in later configs
color_prompt=no;
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#### Add ~/bin and ~/bin/extra to the path
PATH=~/bin:~/bin/extra:$PATH

#### Git integration
export GIT_PS1_SHOWDIRTYSTATE="1"       # Display unstaged (*) and staged(+) changes
export GIT_PS1_SHOWSTASHSTATE="1"       # Display whether there are stashed ($) changes
export GIT_PS1_SHOWUNTRACKEDFILES="1"   # Display if there are untracked (%) files
export GIT_PS1_SHOWUPSTREAM="auto"      # Display if we're ahead (>) or behind (<) or diverged (<>) relative
                                        # to upstream
. ~/.git_bash_completion.bash
if [ "$color_prompt" = yes ]; then
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
else
    PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
fi

#### Some aliases I like
alias m='make'
alias open-file=xdg-open

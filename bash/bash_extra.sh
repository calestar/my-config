
#### Used in later configs
color_prompt=no;
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#### Add ~/bin and ~/bin/extra to the path
PATH=~/bin:~/bin/extra:$PATH

#### Check if we are using WSL, if we are, rerun source on RVM
if [[ $(uname -r) =~ Microsoft$ ]]; then
  source /usr/share/rvm/src/rvm/scripts/rvm
fi

#### Lynx config
export LYNX_CFG=~/.lynx/lynx.cfg

#### Some aliases I like
alias m='make'
alias open-file=xdg-open

# Creates the bash_prompt function
source $HOME/.git-prompt.sh
bash_prompt () {
  # Checks to see if the current directory is a git repo or not
  gitcheck_branch="$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "yes"; else echo "no"; fi)"

  if [ $gitcheck_branch == "yes" ];
  then
    # If we are in a git repo, then check to see if there are uncommitted files
    gitcheck_status="$(git status | grep "nothing to commit" > /dev/null 2>&1; if [ $? -eq 0 ]; then echo "clean"; else echo "unclean"; fi)"
 
    if [ $gitcheck_status == "clean" ];
    then
      # If there are no uncommitted files, then set the color of the git branch name to green
      git_prompt='\[\033[0;32m\]$(__git_ps1)'
    else
      # If there are uncommitted files, set it to red.
      git_prompt='\[\033[0;31m\]$(__git_ps1)'
    fi
  else
    # If we're not in a git repo, then display nothing
    git_prompt=""
  fi

  if command -v rvm &> /dev/null; then
    rvm_prompt="─\[\e[1;37m\][`rvm current`]\[\e[0m\]\[\e[0;36m\]"
  else
    rvm_prompt=""
  fi

  # This is what actually sets our PS1. The ${git prompt} is what will display our git status.
  PS1="\[\e[0;36m\]┌─\[\e[1;37m\][\u@\h]\[\e[0m\]\[\e[0;36m\]${rvm_prompt}─\[\e[0;93m\](\w)${git_prompt} \n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[0;32m\]$\"; else echo \"\[\033[0;31m\]$\"; fi)\[\033[00m\] "
}
# PROMPT_COMMAND is run just before the PS1 is printed. We've set it to run our bash_prompt function.
PROMPT_COMMAND=bash_prompt

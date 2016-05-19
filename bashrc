 
 alias ll="ls -lh --color=auto"

 source ~/.git-prompt.sh
 source ~/.sol.dark

 PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

setopt prompt_subst
autoload -Uz vcs_info
# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
 #PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
# PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started
# Print a greeting message when shell is started
# echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)
## Prompt on right side:
#  - shows status of git when in git repository (code adapted from https://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
#  - shows exit status of previous command (if previous command finished with an error)
#  - is invisible, if neither is the case

# Right prompt with exit status of previous command if not successful
 #RPROMPT="%{$fg[red]%} %(?..[%?])" 
# Right prompt with exit status of previous command marked with ✓ or ✗
 #RPROMPT="%(?.%{$fg[green]%}✓ %{$reset_color%}.%{$fg[red]%}✗ %{$reset_color%})"

#local RULER=$'%{\u2015%}%}'              # ─
#local LEFT_SEG=$'%{\E0B0%}'              # 
#local RIGHT_SEG=$'%{\E0B2%}'             # 
#local LEFT_ARROW=$'%{\E0B1%}'            # 
#local RIGHT_ARROR=$'%{\E0B3%}'           # 
#local RETURN=$'%{\21B5%}'                # ↵
#local ROOT=$'%{\26A1%}'                  # ⚡
#local CHECK=$'%{\2714%}'                 # ✔
#local CROSS=$'%{\2718%}'                 # ✘
#local CONNECT_DOWN=$'%{\256D\U2500%}'    # ╭─
#local CONNECT_UP=$'%{\2570\U2500 %}'     # ╰─
#local CONNECT_UD=$'%{\251C\U2500%}'      # ├─
## GIT
#local UNSTAGED=$'%{\25CF%}'              # ●
#local STAGED=$'%{\271A%}'                # ✚
#local STASH=$'%{\235F%}'                 # ⍟
#local IN_CHANGE=$'%{\2193%}'             # ↓
#local OUT_CHANGE=$'%{\2191%}'            # ↑
#local BOOKMARK=$'%{\263F%}'              # ☿
#local BRANCH=$'%{\E0A0 %}'               # 
#local REMOTE=$'%{\2192%}'                # →
#
#local STAR=$'%{\2B50%}'                  # ⭐
#local ARROWS=$'%{\2194%}'                # ↔
#local CLOUD=$'%{\2601%}'                 # ☁
#local DOWN_TRIANGLE=$'%{\25BC%}'         # ▼
#local TODO=$'%{\2611%}'                  # ☑
#
#local bold=$'\E[1m'
#local normal=$'\E[0m'
#
#local user=$'\E[38;2;130;0;0mL\E[38;2;140;0;22mA\E[38;2;147;0;40mM\E[38;2;151;0;60ma\E[38;2;150;0;83mg\E[38;2;142;0;108mi\E[38;2;127;0;134mc\E[38;2;98;0;159mx'
#local color_files=$'\E[1;38;2;214;168;31mfiles: '$(ls -1 | wc -l | sed "s: ::g")' - '$(ls -lah | grep -m 1 total | sed "s/total //")'B'
#local working=$'\E[1;38;2;104;152;32m%~'
#local date=$'\E[38;2;29;149;201m%D{%d:%m:%C - %T}'
#local good=$'\E[38;2;20;250;20m✔-%?'
#local bad=$'\E[38;2;240;20;20m✘-%?'
#local error='%(?.'$good'.'$bad')'

# counting folders and files : tree or ls grep ^- starts with
function get_files()
{
    td=$(tree -daL 1| tail -1 | sed "s/ director.*//")
    nd=$(tree -dL 1| tail -1 | sed "s/ director.*//")
    hd=$(($td-$nd))
    tf=$(tree -aL 1| tail -1 | sed "s/.*, //" | sed "s/ fi.*//")
    nf=$(tree -L 1| tail -1 |  sed "s/.*, //" | sed "s/ fi.*//")
    hf=$(($tf-$nf))
    #s=$(ls -lah | grep -m 1 total | sed "s/total //")
    s=$(du -sh 2>/dev/null | sed "s/\\t.//")
    echo $'\E[1;38;2;214;168;31mD:'$nd 'Hd:'$hd 'F:'$nf 'H:'$hf' S:'$s'B'
}

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    echo ''
  else
      echo '──('$branch' )'
  fi
}


#PROMPT="magic - %? - %~ - %D{"%d:%m:%y_%H:%M:%S"}\n > "
#PROMPT='$normal$bold╭─($user$normal$bold)──($working$normal$bold)──($(get_files)$normal$bold)──($date$normal$bold)'$'\n''$normal$bold╰─($error$normal$bold)$(git_branch_name)  $normal'
PROMPT='%F{#5b6aa4}%~%f%F{#9aa5c6}$(git_branch_name)%f %F{#e85a71}>%f '






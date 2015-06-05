PROMPT_CHAR="❯"

function lprompt() {
  local user_privilege="%(!.%{$fg[green]%}.%{$reset_color%})$PROMPT_CHAR"
  local bg_job="%(1j.%{$fg[green]%}.%{$reset_color%})$PROMPT_CHAR"
  local cmd_status="%(0?.%{$fg[green]%}.%{$fg[red]%})$PROMPT_CHAR"
  local suffix="%{$reset_color%} "

  echo "$user_privilege$bg_job$cmd_status$suffix"
}


#source ./host.zsh
function prompt_host(){
  local host_prefix=" %{$FG[244]%}"
  local host_name="$host_prefix%m%{$reset_color%}"

  echo "$host_prefix$host_name"
}


#source ./path.zsh
function prompt_path() {
  local working_dir="%{$FG[244]%}%2~%{$reset_color%}"

  echo "$working_dir"
}


function rprompt() {
  echo "$(prompt_path)$(prompt_host)"
}

PROMPT='$(lprompt)'
RPROMPT='$(rprompt)'

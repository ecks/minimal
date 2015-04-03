autoload -U colors && colors

setopt prompt_subst

PROMPT_CHAR=${PROMPT_CHAR:-"❯"}
ACCENT_COLOR=${ACCENT_COLOR:-"$fg[green]"}
ERROR_COLOR=${ERROR_COLOR:-"$fg[red]"}
NORMAL_COLOR=${NORMAL_COLOR:-"$reset_color"}
PATH_COLOR=${PATH_COLOR:-"[38;5;244m"}
HOST_COLOR=${HOST_COLOR:-"[38;5;244m"}

function prompt_user() {
  echo "%(!.%{$ACCENT_COLOR%}.%{$NORMAL_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

function prompt_jobs() {
  echo "%(1j.%{$ACCENT_COLOR%}.%{$NORMAL_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

function prompt_status() {
  echo "%(0?.%{$ACCENT_COLOR%}.%{$ERROR_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

function prompt_vimode(){
  local NMODE="%{$NORMAL_COLOR%}$PROMPT_CHAR%{$reset_color%}"
  local IMODE="%{$ACCENT_COLOR%}$PROMPT_CHAR%{$reset_color%}"
  echo "${${KEYMAP/vicmd/$NMODE}/(main|viins)/$IMODE}"
}

function zle-line-init zle-keymap-select {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_vimode)$(prompt_status) '

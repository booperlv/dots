function fish_prompt
echo

set_color --bold green 
printf '%s' $USER
set_color normal
set_color --bold white

switch $fish_bind_mode
  case default
    printf 'N'
  case insert
    printf 'I'
  case replace_one
    printf 'R'
  case visual
    printf 'V'
  case '*'
    printf '?'
end

set_color --bold magenta
printf '%s' $hostname' '

set_color $fish_color_cwd
set -g fish_prompt_pwd_dir_length 0
printf '%s' (prompt_pwd)
set_color normal 

# Line 2
echo
if test -n "$VIRTUAL_ENV"
printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
end

set_color --bold magenta 
printf ' '
set_color normal 
end

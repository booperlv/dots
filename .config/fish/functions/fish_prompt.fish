# Defined interactively
function fish_prompt
    echo 

	if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    set_color yellow
    printf '%s' $USER
    set_color normal
    printf ' at '

    set_color magenta
    echo -n (prompt_hostname)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    # Line 2
    echo
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end

	switch $fish_bind_mode
    case default
      printf 'N '
    case insert
      printf 'I '
    case replace_one
      printf 'R '
    case visual
      printf 'V '
    case '*'
      printf '? '
  	end
  	set_color normal

    printf '↪ '
    set_color normal
end

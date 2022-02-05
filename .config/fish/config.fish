source ~/.cache/wal/colors.fish
cat ~/.cache/wal/sequences &  

fish_add_path ~/.local/bin

alias pick-color='grim -g (slurp -p) - -t png -o | convert png:- -format "%[pixel:s]\n" info:- | awk -F "[(,)]" \'{printf("#%02x%02x%02x\\n",$2,$3,$4)}\' '
alias nvim-startup='nvim --startuptime startuplog.txt +x && cat startuplog.txt && rm -rf startuplog.txt'
alias nvim-update='bash ~/.local/share/scripts/updatenvimnightlybuild.sh'

alias ll='ls -1a'
alias la='ls -a'
alias nv='nvim'

export EDITOR=nvim

fish_vi_key_bindings
#fish_default_key_bindings

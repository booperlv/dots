source ~/.cache/wal/colors.fish
cat ~/.cache/wal/sequences &  
alias pick-color='grim -g (slurp -p) - -t png -o | convert png:- -format "%[pixel:s]\n" info:- | awk -F "[(,)]" \'{printf("#%02x%02x%02x\\n",$2,$3,$4)}\' '
alias nvim-startup='nvim --startuptime startuplog.txt +x && cat startuplog.txt && rm -rf startuplog.txt'
alias la='ls -1a'
export PAGER=vimpager
export EDITOR=nvim
fish_vi_key_bindings
#fish_default_key_bindings

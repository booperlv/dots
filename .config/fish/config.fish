source ~/.cache/wal/colors.fish
cat ~/.cache/wal/sequences &  
set -gx PATH /usr/local/sbin /usr/local/bin /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /home/booperlv/.local/bin /home/booperlv/.local/share/gem/ruby/3.0.0/bin
alias pickcolor='grim -g (slurp -p) - -t png -o | convert png:- -format "%[pixel:s]\n" info:- | awk -F "[(,)]" \'{printf("#%02x%02x%02x\\n",$2,$3,$4)}\' '
export PAGER=vimpager
export EDITOR=nvim
fish_vi_key_bindings
#fish_default_key_bindings

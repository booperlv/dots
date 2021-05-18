import os
import subprocess
import json
import textwrap

datafile = os.path.join( os.path.expanduser('~/.cache/wal/'), 'colors.json' )
data = open(datafile).read().replace('#', '')
dataparsed = json.loads(data)
col = dataparsed['colors']
sep = dataparsed['special']

actualconfig=textwrap.dedent('''\
# -*- conf -*-

# shell=$SHELL (if set, otherwise user's default shell from /etc/passwd)
# term=foot (or xterm-256color if built with -Dterminfo=disabled)
# login-shell=no

font=Iosevka Nerd Font:size=8.5
#font-bold=Iosevka Nerd Font:style=
#font-italic=<italic variant of regular font>
#font-bold-italic=<bold+italic variant of regular font>
# line-height=<font metrics>
# letter-spacing=0
# horizontal-letter-offset=0
# vertical-letter-offset=0
box-drawings-uses-font-glyphs=yes
dpi-aware=yes

# initial-window-size-pixels=700x500  # Or,
# initial-window-size-chars=<COLSxROWS>
# initial-window-mode=windowed
pad=10x10 center                      # optionally append 'center'
# resize-delay-ms=100


#bold-text-in-bright=yes
# bell=none
# jump-label-letters=sadfjklewcmpgh
# selection-target=primary
# workers=<number of logical CPUs>
# osc8-underline=url-mode

[scrollback]
lines=600
# multiplier=3.0
# indicator-position=relative
# indicator-format=

[cursor]
blink=yes

[mouse]
# hide-when-typing=no
# alternate-scroll-mode=yes

[colors]
alpha=1.0
foreground={0}
background={1}
regular0={2}
regular1={3}
regular2={4}
regular3={5}
regular4={6}
regular5={7}
regular6={8}
regular7={9}
bright0={10}
bright1={11}
bright2={12}
bright3={13}
bright4={14}
bright5={15}
bright6={16}
bright7={17}
# selection-foreground=<inverse foreground/background>
# selection-background=<inverse foreground/background>
# jump-labels=<regular0> <regular3>
# urls=<regular3>

[csd]
# preferred=server
# size=26
# color=<foreground color>
# button-width=26
# button-minimize-color=<regular4>
# button-maximize-color=<regular2>
# button-close-color=<regular1>

[key-bindings]
# scrollback-up-page=Shift+Page_Up
# scrollback-up-half-page=none
# scrollback-up-line=none
# scrollback-down-page=Shift+Page_Down
# scrollback-down-half-page=none
# scrollback-down-line=none
# clipboard-copy=Control+Shift+c
# clipboard-paste=Control+Shift+v
# primary-paste=Shift+Insert
# search-start=Control+Shift+r
# font-increase=Control+plus Control+equal Control+KP_Add
# font-decrease=Control+minus Control+KP_Subtract
# font-reset=Control+0 Control+KP_0
# spawn-terminal=Control+Shift+n
# minimize=none
# maximize=none
# fullscreen=none
# pipe-visible=[sh -c "xurls | fuzzel | xargs -r firefox"] none
# pipe-scrollback=[sh -c "xurls | fuzzel | xargs -r firefox"] none
# pipe-selected=[xargs -r firefox] none
# show-urls-launch=Control+Shift+u
# show-urls-copy=none

[search-bindings]
# cancel=Control+g Escape
# commit=Return
# find-prev=Control+r
# find-next=Control+s
# cursor-left=Left Control+b
# cursor-left-word=Control+Left Mod1+b
# cursor-right=Right Control+f
# cursor-right-word=Control+Right Mod1+f
# cursor-home=Home Control+a
# cursor-end=End Control+e
# delete-prev=BackSpace
# delete-prev-word=Mod1+BackSpace Control+BackSpace
# delete-next=Delete
# delete-next-word=Mod1+d Control+Delete
# extend-to-word-boundary=Control+w
# extend-to-next-whitespace=Control+Shift+w
# clipboard-paste=Control+v Control+y
# primary-paste=Shift+Insert

[url-bindings]
# cancel=Control+g Control+d Escape
# toggle-url-visible=t

[mouse-bindings]
# primary-paste=BTN_MIDDLE
# select-begin=BTN_LEFT
# select-begin-block=Control+BTN_LEFT
# select-extend=BTN_RIGHT
# select-extend-character-wise=Control+BTN_RIGHT
# select-word=BTN_LEFT-2
# select-word-whitespace=Control+BTN_LEFT-2
# select-row=BTN_LEFT-3

''').format(
    sep['foreground'],
    sep['background'],
#Placeholder Comment To Separate
    col['color0'],
    col['color1'],
    col['color2'],
    col['color3'],
    col['color4'],
    col['color5'],
    col['color6'],
    col['color7'],
    col['color8'],
    col['color9'],
    col['color10'],
    col['color11'],
    col['color12'],
    col['color13'],
    col['color14'],
    col['color15'],
)

userfile = os.path.join( os.path.expanduser('~/.config/foot/'), 'foot.ini' )

tempfile=open(userfile, "w")
tempfile.write(actualconfig)
tempfile.close()

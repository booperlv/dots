from typing import List  # noqa: F401
from libqtile import qtile
import os
import subprocess
from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from colors import *

mod = "mod4"
terminal = guess_terminal()
# terminal = kitty


@hook.subscribe.startup_once
def autostart():
    autostartfile = "/.config/qtile/autostart.sh"
    home = os.path.expanduser('~')
    subprocess.call(["bash", home + autostartfile])


keys = [
    # Switch between windows
    Key([mod], "m", 
        lazy.layout.left(),
        desc="Move focus to left"
    ),
    Key([mod], "slash",
        lazy.layout.right(),
        desc="Move focus to right"
    ),
    Key([mod], "comma", 
        lazy.layout.down(), 
        desc="Move focus down"
    ),
    Key([mod], "period", 
        lazy.layout.up(), 
        desc="Move focus up"
    ),
    Key([mod], "space", 
        lazy.layout.next(),
        desc="Move window focus to other window"
    ),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "m",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
    ),
    Key([mod, "shift"], "slash", 
        lazy.layout.shuffle_right(),
        desc="Move window to the right"
    ),
    Key([mod, "shift"], "comma",
        lazy.layout.shuffle_down(),
        desc="Move window down"
    ),
    Key([mod, "shift"], "period", 
        lazy.layout.shuffle_up(), 
        desc="Move window up"
    ),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "m", 
        lazy.layout.grow_left(),
        desc="Grow window to the left"
    ),
    Key([mod, "control"], "slash", 
        lazy.layout.grow_right(),
        desc="Grow window to the right"
    ),
    Key([mod, "control"], "comma", 
        lazy.layout.grow_down(),
        desc="Grow window down"
    ),
    Key([mod, "control"], "period", 
        lazy.layout.grow_up(), 
        desc="Grow window up"
    ),
    Key([mod], "n", 
        lazy.layout.normalize(),
        desc="Reset all window sizes"
    ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "e", 
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"
    ),
    Key([mod, "shift"], "space", 
        lazy.window.toggle_floating(),
        desc="Toggle floating :D"
    ),

    Key([mod], "f", 
        lazy.window.toggle_fullscreen(),
        desc="Toggle Fullscreen?"
    ),
    Key([mod], "x", 
        lazy.spawn("emptywindow &"),
        desc="open emptywindow"
    ),
    Key([mod], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"
    ),

    # Toggle between different layouts as defined below
    Key([mod], "Tab",
        lazy.next_layout(), 
        desc="Toggle between layouts"
    ),
    Key([mod], "q", 
        lazy.window.kill(), 
        desc="Kill focused window"
    ),

    Key([mod, "control"], "r", 
        lazy.restart(), 
        desc="Restart Qtile"
    ),
    Key([mod, "control"], "q", 
        lazy.shutdown(), 
        desc="Shutdown Qtile"
    ),
    Key([mod],"b",
        lazy.spawn("rofi -show drun -theme /home/booperlv/.config/rofi/colors-rofi-dark.rasi"),
        desc="Spawn Rofi Drun"
    ),
    Key([mod],"d",
        lazy.spawn("rofi -show drun -theme /home/booperlv/.config/rofi/inputbar-rofi-dark.rasi"),
        desc="Input Bar Rofi Drun Spawn"
    ),
    Key([mod], "backslash",
        lazy.spawn('bash /home/booperlv/.config/qtile/scripts/changewal.sh'),
        desc="Change WALpaper :D"
    ),
    Key([mod], "t",
        lazy.spawn('rofi -show term -theme /home/booperlv/.config/rofi/scripts/terminal.rasi'),
        desc="Launch Rofi Terminal"
    ),
    Key([mod], "p",
        lazy.spawn('rofi -show power -theme /home/booperlv/.config/rofi/scripts/powermenu.rasi'),
        desc="Launch Rofi PowerMenu"
    ),
    Key([mod], "s",
        lazy.spawn('bash /home/booperlv/.config/rofi/scripts/selectmode.sh'),
        desc="Select which Rofi to Launch"
    ),
    Key([mod, "control"], "b",
        lazy.hide_show_bar("top"),
        desc="hide bars"
    ),
]



# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "true"
 


layouts = [
    layout.Columns(
        margin=6,
        border_width=0,
        #border_width=3,
        #border_focus=palette['colors']['color3']
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]



groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])
   



widget_defaults = dict(
    font='Iosevka',
    fontsize=12,
    padding= 8,
)
extension_defaults = widget_defaults.copy()

# def rampbattery(batterypercent):
#    rampcapacity1 = ''
#    rampcapacity2 = ''
#    rampcapacity3 = ''
#    rampcapacity4 = ''
#    rampcapacity5 = ''
#    rampcapacity6 = ''
#    rampcapacity7 = ''
#    rampcapacity8 = ''
#    rampcapacity9 = ''

def rofiselect():
    qtile.cmd_spawn('bash /home/booperlv/.config/rofi/scripts/selectmode.sh')

screens = [
    Screen(
        top=bar.Bar([
            widget.TextBox(text="", padding=16,),
            widget.CurrentLayout(
                foreground=palette['special']['background'],
                background=palette['colors']['color3'],
            ),
            widget.TextBox(text="", padding=16,),
            widget.Memory(),
            widget.TextBox(text="", padding=16,),
            widget.WindowName(), 


            widget.TextBox(text="", padding=16,),
            widget.Wlan(),
            widget.TextBox(text="", padding=16,),
            widget.Battery(
                format='{char} {percent:2.0%}',
                empty_char='',
            ),
            widget.TextBox(text="", padding=16,),
            widget.Clock(
                format='%Y-%m-%d %a %I:%M %p'
            ),
            widget.TextBox(text="", padding=16,),
            widget.TextBox(
                text="launcher",
                mouse_callbacks={'Button1': rofiselect},
                background=palette['colors']['color3'],
                foreground=palette['special']['background'],
            ),
            widget.TextBox(text="", padding=16,),
        ], 23,
            background=palette['special']['background'],
            margin=[6,6,0,6],
        ),
    ),
]

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

#       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
#      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
#     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
#     \__,_/____/_/ /_/           /____/
#                              _____             __         __  _ __           __                    _____
#            _________  ____  / __(_)___ _     _/_/  ____ _/ /_(_) /__       _/_/  _________  ____  / __(_)___ _         ____  __  __
#           / ___/ __ \/ __ \/ /_/ / __ `/   _/_/   / __ `/ __/ / / _ \    _/_/   / ___/ __ \/ __ \/ /_/ / __ `/        / __ \/ / / /
#      _   / /__/ /_/ / / / / __/ / /_/ /  _/_/    / /_/ / /_/ / /  __/  _/_/    / /__/ /_/ / / / / __/ / /_/ /   _    / /_/ / /_/ /
#     (_)  \___/\____/_/ /_/_/ /_/\__, /  /_/      \__, /\__/_/_/\___/  /_/      \___/\____/_/ /_/_/ /_/\__, /   (_)  / .___/\__, /
#                                /____/              /_/                                               /____/        /_/    /____/
#
# Description:  TODO
# Dependencies: TODO
# License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
# Contributors: Stevan Antoine

import os
import subprocess

from libqtile import hook
from libqtile import layout
from libqtile.config import Match
from libqtile.utils import guess_terminal

from groups import init_groups
from groups import link_groups_to_keys
from keys import init_keymap
from layouts import init_layouts
from mouse import init_mouse
from screens import init_screens
from style import LAYOUTS as lt
from widgets import init_widget_defaults

mod = "mod4"
terminal = guess_terminal(preference=["kitty", "alacritty"])

keys = init_keymap(mod, terminal)

groups = init_groups()
link_groups_to_keys(groups, keys, mod)

layouts = init_layouts()

widget_defaults = init_widget_defaults()
extension_defaults = widget_defaults.copy()

fake_screens = init_screens(terminal)

# Drag floating layouts.
mouse = init_mouse(mod)

follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),    # gitk
        Match(wm_class='makebranch'),      # gitk
        Match(wm_class='maketag'),         # gitk
        Match(wm_class='ssh-askpass'),     # ssh-askpass
        Match(title='branchdialog'),       # gitk
        Match(title='pinentry'),           # GPG key password entry
        Match(wm_class='pinentry-gtk-2'),  # gitk
        Match(wm_class='mpv'),             # mpv
        Match(title="mocp"),               # mocp
        Match(wm_class="Conky"),           # Conky
    ],
    border_focus=lt.floating.focus,    # Border colour(s) for the focused window.
    border_normal=lt.floating.normal,  # Border colour(s) for un-focused windows.
    border_width=lt.border_width,      # Border width.
    )
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/scripts/qtile-autostart.sh')
    subprocess.run([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

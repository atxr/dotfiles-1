#           ___                       personal page: https://amtoine.github.io/
#      __ _|_  )_ _    ___   ___      github   page: https://github.com/amtoine
#     / _` |/ /| ' \  |___| (_-<      my   dotfiles: https://github.com/amtoine/dotfiles
#     \__,_/___|_||_|       /__/
#               __           __                                   _
#        __    / /  __ _    / /  _ __  ___ _ __ _  _ _ __ ___  __| |_
#      _/ _|  / /  / _` |  / /  | '_ \/ _ \ '_ \ || | '_ (_-<_(_-< ' \
#     (_)__| /_/   \__, | /_/   | .__/\___/ .__/\_,_| .__/__(_)__/_||_|
#                     |_|       |_|       |_|       |_|
#
# Description:  a collection of popups wrappers from qtile-extras-git
# Dependencies: qtile-extras-git
# License:      https://github.com/amtoine/dotfiles/blob/main/LICENSE
# Contributors: Stevan Antoine

import os
import subprocess
from time import sleep
from qtile_extras.popup.toolkit import PopupGridLayout
from qtile_extras.popup.toolkit import PopupText

from theme import theme
from style import FONT


def text_popup(qtile, text, size=100, x=None, y=None, centered=True, kill_time=.5):
    """
        Opens a popup with a single string of text.
    """
    lines = text.split("\n")
    controls = [
        PopupText(
            font=FONT,
            fontsize=size,
            text=line,
            v_align="center",
            h_align="center",
            row=i,
            col=0,
        ) for i, line in enumerate(lines)
    ]

    layout = PopupGridLayout(
        qtile,
        width=int(0.62 * max(map(len, lines)) * size),
        height=int(1.33 * size) * len(lines),
        controls=controls,
        background=theme.color8 + "d0",
        margin=8,
        opacity=1.,
        initial_focus=0,
        rows=len(lines),
        cols=1,
    )

    layout.show(x=x, y=y, centered=centered)
    qtile.call_later(kill_time, layout.kill)  # kill popup after some time


def feh_popup(qtile, sleep_time=0):
    """Show the wallpaper of each monitor inside a text popup."""
    sleep(sleep_time)

    # get the list of monitors
    output = subprocess.check_output(["polybar", "-m"]).decode("utf-8")
    monitors = [monitor.split(":")[0] for monitor in output.strip().split("\n")]

    # get the list of wallpapers
    output = subprocess.check_output(["cat", os.path.expanduser("~/.fehbg")]).decode("utf-8").split("\n")[1]
    wallpapers = [wallpaper.replace('/usr/share/backgrounds', '/u/s/b') for wallpaper in output.split(" ")[3:][:len(monitors)]]

    # show the results in a text popup
    msg = "\n".join([f"{monitor}: {wallpaper}" for (monitor, wallpaper) in zip(monitors, wallpapers)])
    text_popup(qtile, msg, size=30, centered=True, kill_time=5)

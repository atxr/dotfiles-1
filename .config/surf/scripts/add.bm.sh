#!/usr/bin/env sh
#             ___
#       ____ |__ \ ____              _____      personal page: https://amtoine.github.io/ 
#      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/amtoine 
#     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/amtoine/dotfiles 
#     \__,_/____/_/ /_/           /____/
#                               _____             __                   ____      __                  _       __             __             __    __         __                            __
#             _________  ____  / __(_)___ _     _/_/  _______  _______/ __/    _/_/  _______________(_)___  / /______     _/_/  ____ _____/ /___/ /        / /_  ____ ___           _____/ /_
#            / ___/ __ \/ __ \/ /_/ / __ `/   _/_/   / ___/ / / / ___/ /_    _/_/   / ___/ ___/ ___/ / __ \/ __/ ___/   _/_/   / __ `/ __  / __  /        / __ \/ __ `__ \         / ___/ __ \
#      _    / /__/ /_/ / / / / __/ / /_/ /  _/_/    (__  ) /_/ / /  / __/  _/_/    (__  ) /__/ /  / / /_/ / /_(__  )  _/_/    / /_/ / /_/ / /_/ /   _    / /_/ / / / / / /   _    (__  ) / / /
#     (_)   \___/\____/_/ /_/_/ /_/\__, /  /_/     /____/\__,_/_/  /_/    /_/     /____/\___/_/  /_/ .___/\__/____/  /_/      \__,_/\__,_/\__,_/   (_)  /_.___/_/ /_/ /_/   (_)  /____/_/ /_/
#                                 /____/                                                          /_/
#
# Description:  saves a url by adding it to the list of all bookmarks for surf.
# Dependencies: xprop, a bookmark file at ~/.config/surf/bookmarks
# License:      https://github.com/amtoine/dotfiles/blob/main/LICENSE 
# Contributors: Stevan Antoine

bookmarks="$HOME/.config/surf/bookmarks"
uri=$(echo $(xprop -id $1 $2) | cut -d \" -f2 | sed 's/.*https*:\/\/\(www\.\)\?//')
sed -i "1s@^@-- | -- | -- | $uri\n@" $bookmarks

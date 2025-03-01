#!/bin/sh
#             ___
#       ____ |__ \ ____              _____      personal page: https://amtoine.github.io/ 
#      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/amtoine 
#     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/amtoine/dotfiles 
#     \__,_/____/_/ /_/           /____/
#                               _____             __   ______      __                  _       __             __                        _                                      __
#             _________  ____  / __(_)___ _     _/_/  / / __/    _/_/  _______________(_)___  / /______     _/_/  ____  ________ _   __(_)__ _      _____  _____         _____/ /_
#            / ___/ __ \/ __ \/ /_/ / __ `/   _/_/   / / /_    _/_/   / ___/ ___/ ___/ / __ \/ __/ ___/   _/_/   / __ \/ ___/ _ \ | / / / _ \ | /| / / _ \/ ___/        / ___/ __ \
#      _    / /__/ /_/ / / / / __/ / /_/ /  _/_/    / / __/  _/_/    (__  ) /__/ /  / / /_/ / /_(__  )  _/_/    / /_/ / /  /  __/ |/ / /  __/ |/ |/ /  __/ /      _    (__  ) / / /
#     (_)   \___/\____/_/ /_/_/ /_/\__, /  /_/     /_/_/    /_/     /____/\___/_/  /_/ .___/\__/____/  /_/     / .___/_/   \___/|___/_/\___/|__/|__/\___/_/      (_)  /____/_/ /_/
#                                 /____/                                            /_/                       /_/
#
# Description:  takes care of the previewimg of a lot of file types.
# Dependencies: chafa. bat
# License:      https://github.com/amtoine/dotfiles/blob/main/LICENSE 
# Contributors: Stevan Antoine
#               cirala -> https://github.com/cirala/lfimg/blob/master/preview 

image() {
  if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
    printf '{"action": "add", "identifier": "PREVIEW", "x": "%s", "y": "%s", "width": "%s", "height": "%s", "scaler": "contain", "path": "%s"}\n' "$4" "$5" "$(($2-1))" "$(($3-1))" "$1" > "$FIFO_UEBERZUG"
    exit 1
  else
    chafa "$1" -s "$4x"
  fi
}

batorcat() {
  file="$1"
  shift
  if command -v bat > /dev/null 2>&1
  then
    bat --color=always --style=plain --pager=never "$file" "$@"
  else
    cat "$file"
  fi
}

CACHE="$HOME/.cache/lf/thumbnail.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}'))"

case "$(printf "%s\n" "$(readlink -f "$1")" | awk '{print tolower($0)}')" in
  *.tgz|*.tar.gz) tar tzf "$1" ;;
  *.tar.bz2|*.tbz2) tar tjf "$1" ;;
  *.tar.txz|*.txz) xz --list "$1" ;;
  *.tar) tar tf "$1" ;;
  *.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1" ;;
  *.rar) unrar l "$1" ;;
  *.7z) 7z l "$1" ;;
  *.[1-8]) man "$1" | col -b ;;
  *.o) nm "$1";;
  *.torrent) transmission-show "$1" ;;
  *.iso) iso-info --no-header -l "$1" ;;
  *.odt|*.ods|*.odp|*.sxw) odt2txt "$1" ;;
  *.doc) catdoc "$1" ;;
  *.docx) docx2txt "$1" - ;;
  *.xls|*.xlsx)
    ssconvert --export-type=Gnumeric_stf:stf_csv "$1" "fd://1" | batorcat --language=csv
    ;;
  *.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.mka)
    exiftool "$1"
    ;;
  *.pdf)
    [ ! -f "${CACHE}.jpg" ] && \
      pdftoppm -jpeg -f 1 -singlefile "$1" "$CACHE"
    image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
#     *.pdf) pdftotext "$1" -;;
    ;;
  *.epub)
    [ ! -f "$CACHE" ] && \
      epub-thumbnailer "$1" "$CACHE" 1024
    image "$CACHE" "$2" "$3" "$4" "$5"
    ;;
  *.html)
    [ ! -f "$CACHE" ] && \ 
      wkhtmltopdf "$1" - | pdftoppm -jpeg -f 1 -singlefile - "$CACHE"
    image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
    ;;
  *.avi|*.mp4|*.wmv|*.dat|*.3gp|*.ogv|*.mkv|*.mpg|*.mpeg|*.vob|*.fl[icv]|*.m2v|*.mov|*.webm|*.ts|*.mts|*.m4v|*.r[am]|*.qt|*.divx)
    [ ! -f "${CACHE}.jpg" ] && \
      ffmpegthumbnailer -i "$1" -o "${CACHE}.jpg" -s 0 -q 5
    image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
    ;;
  *.bmp|*.jpg|*.jpeg|*.png|*.xpm|*.webp|*.gif|*.jfif)
    image "$1" "$2" "$3" "$4" "$5"
    ;;
  *.ino)
    batorcat --language=cpp "$1"
    ;;
  *)
    batorcat "$1"
    ;;
esac
exit 0

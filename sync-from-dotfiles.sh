#!/usr/bin/env bash
# Refresh this repo from the private dotfiles repo, where the themes are edited.
# Copies only theme/color files -- no shell, ssh, or machine configuration.
#
#   ./sync-from-dotfiles.sh                 # dotfiles at ~/dotfiles
#   ./sync-from-dotfiles.sh /path/to/dotfiles
#
# Then review `git diff`, commit, and push.
set -euo pipefail

DT="$(cd "$(dirname "$0")" && pwd)"
DF="${1:-$HOME/dotfiles}"
[ -d "$DF/config" ] || { echo "not a dotfiles checkout: $DF" >&2; exit 1; }

sync() {  # sync <path in dotfiles> <path in this repo>
    local src="$DF/$1" dst="$DT/$2"
    if [ ! -f "$src" ]; then echo "  missing in dotfiles, kept as is: $1"; return; fi
    mkdir -p "$(dirname "$dst")"
    if [ -f "$dst" ] && cmp -s "$src" "$dst"; then return; fi
    cp "$src" "$dst"
    echo "  updated: $2"
}

sync vim/colors/dreamTheme.vim                          vim/dreamTheme.vim
sync vim/colors/dreamThemeArc.vim                       vim/dreamThemeArc.vim
sync vim/autoload/airline/themes/dreamtheme.vim         vim/airline/dreamtheme.vim
sync config/nvim/lua/plugins/user-colorscheme.lua       nvim/user-colorscheme.lua
sync oh-my-zsh-custom/themes/dreamingmachine.zsh-theme  zsh/dreamingmachine.zsh-theme
sync config/btop/themes/dreamtheme.theme                btop/dreamtheme.theme
sync config/glow/dreamtheme.json                        glow/dreamtheme.json
sync config/television/themes/dreamtheme.toml           television/dreamtheme.toml
sync config/zellij/themes/dreamtheme.kdl                zellij/dreamtheme.kdl
sync config/ranger/colorschemes/dreamtheme.py           ranger/dreamtheme.py
sync config/yazi/theme.toml                             yazi/dreamtheme.toml
sync config/yazi/dreamtheme-icons.py                    yazi/dreamtheme-icons.py
sync config/ghostty/config                              ghostty/config
sync config/herdr-app/themes/dreamtheme.json            herdr-app/dreamtheme.json
sync config/moshi/dreamtheme.json                       moshi/dreamtheme.json
sync config/moshi/dreamtheme.clipboard.txt              moshi/dreamtheme.clipboard.txt
sync config/moshi/dreamtheme-qr.png                     moshi/dreamtheme-qr.png
sync config/omarchy/themes/dream-theme/shell.toml       omarchy/dream-theme/shell.toml

filtered() {  # filtered <path in dotfiles> <path in this repo> <perl program>
    local src="$DF/$1" dst="$DT/$2"
    if [ ! -f "$src" ]; then echo "  missing in dotfiles, kept as is: $1"; return; fi
    mkdir -p "$(dirname "$dst")"
    perl -0pe "$3" "$src" > "$dst.new"
    if [ -f "$dst" ] && cmp -s "$dst.new" "$dst"; then rm "$dst.new"; return; fi
    mv "$dst.new" "$dst"
    echo "  updated: $2"
}

# Ghostty theme: dotfiles points its background image at its own wallpaper copy;
# here the same image already ships as warp/jellyfish_bg.jpg.
filtered config/ghostty/themes/Andromeda ghostty/Andromeda \
    's|\{\{DOTFILES\}\}/config/ghostty/wallpapers/|{{DREAMTHEME}}/warp/|g'

# Herdr config: this repo is public, so drop the personal notes from the header
# comment (the parenthetical after the name, and the palette-source pointer).
filtered config/herdr/config.toml herdr/config.toml \
    's/^(# herdr configuration[^\n(]*?) \([^)\n]*\)$/$1/m; s/^#\n# Personal palette source:[^\n]*\n//m; s/^# Personal palette source:[^\n]*\n//m'

echo "Done. Review with: git -C \"$DT\" status --short"

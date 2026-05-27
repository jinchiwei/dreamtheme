#!/usr/bin/env bash
# dreamtheme installer — symlinks the drop-in theme files into place and
# prints activation + manual-merge instructions for the rest.
#
#   ./install.sh            # install all drop-in themes
#   ./install.sh --copy     # copy instead of symlink (no link back to this repo)
#
# Symlinks (default) auto-update when you `git pull` this repo. Existing files
# are backed up to <file>.bak before linking.
set -euo pipefail

DT="$(cd "$(dirname "$0")" && pwd)"
MODE="link"
[ "${1:-}" = "--copy" ] && MODE="copy"

place() {  # place <src> <dst>
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -L "$dst" ]; then rm "$dst"
    elif [ -e "$dst" ]; then echo "  backup: $dst -> ${dst}.bak"; mv "$dst" "${dst}.bak"; fi
    if [ "$MODE" = "copy" ]; then cp "$src" "$dst"; else ln -s "$src" "$dst"; fi
    echo "  $MODE: $dst"
}

echo "=== Installing drop-in dreamtheme files ($MODE mode) ==="
place "$DT/zellij/dreamtheme.kdl"        "$HOME/.config/zellij/themes/dreamtheme.kdl"
place "$DT/vim/dreamTheme.vim"           "$HOME/.vim/colors/dreamTheme.vim"
place "$DT/vim/dreamThemeArc.vim"        "$HOME/.vim/colors/dreamThemeArc.vim"
place "$DT/ranger/dreamtheme.py"         "$HOME/.config/ranger/colorschemes/dreamtheme.py"
place "$DT/glow/dreamtheme.json"         "$HOME/.config/glow/dreamtheme.json"
place "$DT/television/dreamtheme.toml"   "$HOME/.config/television/themes/dreamtheme.toml"
place "$DT/yazi/dreamtheme.toml"         "$HOME/.config/yazi/theme.toml"
place "$DT/btop/dreamtheme.theme"        "$HOME/.config/btop/themes/dreamtheme.theme"

# Warp: copy the yaml + bg image, and fix the bg image path to THIS machine's home.
mkdir -p "$HOME/.warp/themes"
place "$DT/warp/jellyfish_bg.jpg"        "$HOME/.warp/themes/jellyfish_bg.jpg"
sed -E "s|^([[:space:]]*path: ).*jellyfish_bg.jpg|\1$HOME/.warp/themes/jellyfish_bg.jpg|" \
    "$DT/warp/Jellyfish DM.yaml" > "$HOME/.warp/themes/Jellyfish DM.yaml"
echo "  copy: $HOME/.warp/themes/Jellyfish DM.yaml (bg path patched)"

# Oh My Zsh theme (only if oh-my-zsh is installed)
if [ -d "$HOME/.oh-my-zsh" ]; then
    place "$DT/zsh/dreamingmachine.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/dreamingmachine.zsh-theme"
fi

# VisiData: only place if there's no existing ~/.visidatarc (don't clobber config)
if [ ! -e "$HOME/.visidatarc" ]; then
    place "$DT/visidata/dreamtheme.visidatarc" "$HOME/.visidatarc"
else
    echo "  skip: ~/.visidatarc exists — append visidata/dreamtheme.visidatarc yourself"
fi

cat <<EOF

=== Activate (set these in each tool's own config) ===
  zellij      theme "dreamtheme"            in ~/.config/zellij/config.kdl
  btop        color_theme = "dreamtheme"    in ~/.config/btop/btop.conf
  vim         :colorscheme dreamTheme       (or in ~/.vimrc)
  ranger      set colorscheme dreamtheme    in ~/.config/ranger/rc.conf
  television  theme = "dreamtheme"          in ~/.config/television/config.toml
  zsh         ZSH_THEME="dreamingmachine"   in ~/.zshrc
  glow        glow -s ~/.config/glow/dreamtheme.json   (or set in config)
  warp        pick "Jellyfish DM" in Settings → Appearance → Themes
  bash        add to ~/.bashrc:  source "$DT/bash/dreamtheme.bash"

=== Manual merge (snippets, not drop-in files) ===
  cmux        merge cmux/workspaceColors.jsonc        into ~/.config/cmux/cmux.json
  vscode      merge vscode/colorCustomizations.jsonc  into User settings.json
  anki        paste anki/recolor-config.json          into the ReColor add-on config
  obsidian    cp obsidian/dreamtheme.css  <vault>/.obsidian/snippets/  (then enable it)
EOF
echo ""
echo "Done."

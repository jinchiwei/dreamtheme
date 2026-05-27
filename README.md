<div align="center">

# 🌙 dreamtheme

**One brand palette, every tool.** Jinchi's personal theme — collected across
the terminal, the editor, the multiplexer, and everything in between.

<img src="assets/palette.png" alt="dreamtheme palette" width="640">

</div>

## Palette

| | Color | Hex | Role |
|:--:|:--|:--|:--|
| <img src="assets/swatch_turquoise.png" width="22"> | **turquoise** | `#40E0D0` | primary · focus · selection |
| <img src="assets/swatch_deeppink.png" width="22"> | **deeppink** | `#FF1493` | accent · highlights · errors |
| <img src="assets/swatch_amber.png" width="22"> | **amber** | `#F0C840` | accent · warnings |
| <img src="assets/swatch_blueviolet.png" width="22"> | **blueviolet** | `#8A2BE2` | accent · gradient midpoint |
| <img src="assets/swatch_ink.png" width="22"> | **ink** | `#14141C` | canvas (dark) |
| <img src="assets/swatch_offwhite.png" width="22"> | **off-white** | `#E5E5EA` | text |
| <img src="assets/swatch_surface.png" width="22"> | **surface** | `#2B2B32` | panels · separators |

<details>
<summary>Supplementary (midnight) hues</summary>

| | Color | Hex |
|:--:|:--|:--|
| <img src="assets/swatch_teal2.png" width="22"> | teal | `#5EEAD4` |
| <img src="assets/swatch_pink2.png" width="22"> | pink | `#FBCFE8` |
| <img src="assets/swatch_lavender.png" width="22"> | lavender | `#A78BFA` |

</details>

**Fonts:** [Geist](https://vercel.com/font) (sans) / Geist Mono (mono). Fonts are set
by each app/terminal — the theme files only control color.

## Install

On any machine:

```bash
git clone https://github.com/jinchiwei/dreamtheme.git ~/dreamtheme   # or: cd ~/dreamtheme && git pull
cd ~/dreamtheme && ./install.sh          # symlink drop-in themes (--copy to copy instead)
```

`install.sh` symlinks the drop-in themes into place (backing up any existing file to
`.bak`), patches the Warp background-image path to your home, then prints the per-tool
**activate** lines and the **manual-merge** steps for the snippet-based tools. Symlinks
auto-update on `git pull`.

## Supported apps

| App | File(s) | Install / activate |
|:--|:--|:--|
| **zellij** | `zellij/dreamtheme.kdl` | → `~/.config/zellij/themes/`, set `theme "dreamtheme"` |
| **vim** | `vim/dreamTheme.vim`, `vim/dreamThemeArc.vim` | → `~/.vim/colors/`, `:colorscheme dreamTheme` |
| **ranger** | `ranger/dreamtheme.py` | → `~/.config/ranger/colorschemes/`, `set colorscheme dreamtheme` |
| **glow** | `glow/dreamtheme.json` | → `~/.config/glow/`, `glow -s dreamtheme.json` |
| **television** | `television/dreamtheme.toml` | → `~/.config/television/themes/` |
| **yazi** | `yazi/dreamtheme.toml` | → `~/.config/yazi/theme.toml` |
| **btop** | `btop/dreamtheme.theme` | → `~/.config/btop/themes/`, `color_theme = "dreamtheme"` |
| **visidata** | `visidata/dreamtheme.visidatarc` | → `~/.visidatarc` |
| **zsh** | `zsh/dreamingmachine.zsh-theme` | → `~/.oh-my-zsh/custom/themes/`, `ZSH_THEME="dreamingmachine"` |
| **bash** | `bash/dreamtheme.bash` | `source` it from `~/.bashrc` |
| **obsidian** | `obsidian/dreamtheme.css` | → `<vault>/.obsidian/snippets/`, enable in Appearance |
| **warp** | `warp/Jellyfish DM.yaml` + `jellyfish_bg.jpg` | → `~/.warp/themes/`, pick in Settings → Appearance |
| **cmux** | `cmux/workspaceColors.jsonc` | merge into `~/.config/cmux/cmux.json` |
| **vscode** | `vscode/colorCustomizations.jsonc` | merge into User `settings.json` (overrides on Andromeda Italic) |
| **anki** | `anki/recolor-config.json` | paste into the **ReColor** add-on config (id `688199788`) |

## Notes

- **Drop-in** (zellij, vim, ranger, glow, television, yazi, btop, visidata, zsh, warp)
  install automatically. **Merge-only** (cmux, vscode, anki, obsidian) are snippets you
  paste into existing configs — no installer can safely splice those.
- **btop** gradients run turquoise → blueviolet → deeppink (cool → hot), deliberately
  avoiding green/yellow blends. Amber appears only as a solid outline.
- **zsh** keeps the filename `dreamingmachine.zsh-theme` (oh-my-zsh references it by name).
- Six of these are also symlinked by [`jinchiwei/dotfiles`](https://github.com/jinchiwei/dotfiles)
  `./install.sh`; this repo is the canonical, tool-agnostic collection.

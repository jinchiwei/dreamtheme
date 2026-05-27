# dreamtheme

Jinchi's personal brand theme, collected across every tool that supports theming.
One name, one palette, everywhere.

## Palette

| Role | Color | Hex |
|---|---|---|
| Primary / focused | turquoise | `#40E0D0` |
| Accent | deeppink | `#FF1493` |
| Accent | amber | `#F0C840` |
| Accent | blueviolet | `#8A2BE2` |
| Canvas (dark) | ink | `#14141C` |
| Text | off-white | `#E5E5EA` |
| Surface | grey | `#2B2B32` |

Supplementary (midnight) hues used in a few places: `#5EEAD4`, `#FBCFE8`, `#A78BFA`.

Fonts: **Geist** (sans) / **Geist Mono** (mono). Note: fonts are set by each app/
terminal, not by the theme files — the theme files only control color.

## What's here

| Tool | File(s) | Install |
|---|---|---|
| **zellij** | `zellij/dreamtheme.kdl` | → `~/.config/zellij/themes/`, set `theme "dreamtheme"` in `config.kdl` |
| **vim** | `vim/dreamTheme.vim`, `vim/dreamThemeArc.vim` | → `~/.vim/colors/`, `:colorscheme dreamTheme` |
| **ranger** | `ranger/dreamtheme.py` | → `~/.config/ranger/colorschemes/`, `set colorscheme dreamtheme` in `rc.conf` |
| **glow** | `glow/dreamtheme.json` | → `~/.config/glow/`, `glow -s dreamtheme.json` (or set in config) |
| **television** | `television/dreamtheme.toml` | → `~/.config/television/themes/` |
| **yazi** | `yazi/dreamtheme.toml` | → `~/.config/yazi/theme.toml` |
| **obsidian** | `obsidian/dreamtheme.css` | → `<vault>/.obsidian/snippets/dreamtheme.css`, enable in Appearance → CSS snippets |
| **warp** | `warp/Jellyfish DM.yaml` + `warp/jellyfish_bg.jpg` | → `~/.warp/themes/` (the yaml references the jpg by absolute path — fix the path to your home) |
| **cmux** | `cmux/workspaceColors.jsonc` | merge the block into `~/.config/cmux/cmux.json` (see file for app-icon / sidebar caveats) |
| **vscode** | `vscode/colorCustomizations.jsonc` | merge into User `settings.json`; overrides on the "Andromeda Italic" base theme |
| **anki** | `anki/recolor-config.json` | config for the **ReColor** add-on (id `688199788`); paste into the add-on's config |

## Notes

- **zellij, vim, ranger, glow, television, yazi, obsidian** are clean drop-in theme
  files. **warp, cmux, vscode, anki** are app-specific (a base-theme override, a
  config snippet, or an add-on config) rather than standalone files.
- Several of these are also wired into [`jinchiwei/dotfiles`](https://github.com/jinchiwei/dotfiles)
  via `./install.sh` (zellij, glow, television, yazi, ranger, vim). This repo is the
  canonical, tool-agnostic collection; dotfiles handles symlinking the subset it manages.
- btop currently uses a third-party theme (`kyli0x`), not a dreamtheme — not included.

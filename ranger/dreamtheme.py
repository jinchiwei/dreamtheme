# dreamTheme: focus first, secondary UI pink, file categories amber/violet.
from __future__ import absolute_import, division, print_function

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import default, black, normal, bold, reverse, default_colors


class DreamTheme(ColorScheme):
    """Quiet file lists with a distinct turquoise focus and semantic accents."""

    turquoise = 43
    deeppink = 198
    amber = 220
    violet = 171
    coral = 209
    gray = 245
    progress_bar_color = turquoise

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors
        if context.reset:
            return default_colors

        if context.in_browser:
            attr = normal
            # Directories also have executable permission: never treat them as
            # executable files. Keep large directory listings visually quiet.
            if context.directory:
                attr |= bold
            elif context.executable and not any((
                    context.media, context.container, context.fifo, context.socket)):
                fg = self.amber
                attr |= bold

            if context.document:
                fg = self.amber
            if context.media:
                fg = self.violet
            if context.container:
                fg = self.amber
                attr |= bold
            if context.socket:
                fg = self.violet
            if context.fifo or context.device:
                fg = self.amber
            if context.link:
                fg = self.violet if context.good else self.coral
            if context.infostring or context.border:
                fg = self.gray
            if context.empty:
                fg = self.gray
            if context.error or context.badinfo:
                fg = self.coral
                attr |= bold
            if context.marked:
                fg = self.amber
                attr |= bold
            if context.tag_marker:
                fg = self.deeppink
                attr |= bold
            if context.cut or context.copied:
                fg = self.violet
            if context.inactive_pane:
                fg = self.gray

            # Apply selection last so file type never hides the active cursor.
            if context.selected:
                if context.main_column and not context.inactive_pane:
                    fg, bg, attr = black, self.turquoise, bold
                else:
                    fg = self.deeppink
                    attr |= bold

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = self.coral if context.bad else self.turquoise
            elif context.directory or context.file:
                fg = self.deeppink
            elif context.tab:
                fg = self.deeppink if context.good else self.gray
                if context.good:
                    attr |= reverse
            elif context.link:
                fg = self.violet
            elif context.keybuffer:
                fg = self.amber

        elif context.in_statusbar:
            fg = self.gray
            if context.permissions:
                fg = self.coral if context.bad else self.deeppink
            if context.owner or context.group:
                fg = self.deeppink
            if context.marked:
                fg = self.amber
                attr |= bold
            if context.frozen:
                fg = self.violet
            if context.message:
                fg = self.coral if context.bad else self.deeppink
            if context.loaded:
                fg, bg = black, self.progress_bar_color
            if context.vcsinfo:
                fg = self.deeppink
            if context.vcscommit:
                fg = self.amber
            if context.vcsdate:
                fg = self.gray

        if context.in_taskview:
            if context.title:
                fg = self.deeppink
                attr |= bold
            if context.selected:
                fg, bg, attr = black, self.turquoise, bold
            if context.loaded:
                fg, bg = black, self.progress_bar_color

        # VCS contexts color the small status glyphs, not entire filenames.
        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = self.coral
                attr |= bold
            elif context.vcschanged:
                fg = self.amber
            elif context.vcsunknown or context.vcsuntracked:
                fg = self.violet
            elif context.vcsstaged:
                fg = self.deeppink
            elif context.vcssync or context.vcsignored:
                fg = self.gray
        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = self.gray
            elif context.vcsbehind:
                fg = self.amber
            elif context.vcsahead:
                fg = self.deeppink
            elif context.vcsdiverged:
                fg = self.coral
            elif context.vcsunknown:
                fg = self.violet

        if context.text and context.highlight:
            attr |= reverse
        return fg, bg, attr

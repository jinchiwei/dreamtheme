# custom ranger colorscheme inspired by dreamTheme.vim
# palette priorities: turquoise, deeppink, orange, blueviolet

from __future__ import absolute_import, division, print_function

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    default,
    black,
    normal,
    bold,
    reverse,
    default_colors,
)


class DreamTheme(ColorScheme):
    """dreamTheme-inspired colorscheme."""

    turquoise = 43
    deeppink = 198
    orange = 214
    blueviolet = 92
    green = 47

    progress_bar_color = turquoise

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        if context.in_browser:
            attr = normal

            if context.selected:
                attr |= reverse | bold
                fg = self.turquoise

            if context.empty or context.error:
                fg = black
                bg = self.deeppink
                attr |= bold

            if context.border:
                fg = default

            if context.directory:
                fg = self.turquoise
                attr |= bold

            if context.link:
                fg = self.blueviolet if context.good else self.deeppink

            if context.document:
                fg = self.orange

            if context.media:
                fg = self.blueviolet

            if context.container:
                fg = self.deeppink
                attr |= bold

            if context.socket:
                fg = self.blueviolet
                attr |= bold

            if context.fifo or context.device:
                fg = self.orange
                if context.device:
                    attr |= bold

            if context.executable and not any((context.media, context.container, context.fifo, context.socket)):
                fg = self.deeppink
                attr |= bold

            if context.marked:
                fg = self.deeppink
                attr |= bold

            if context.tag_marker and not context.selected:
                fg = self.orange
                attr |= bold

            if not context.selected and (context.cut or context.copied):
                fg = black
                bg = self.blueviolet
                attr |= bold

            if context.inactive_pane:
                fg = default

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = self.deeppink if context.bad else self.turquoise
            elif context.directory:
                fg = self.turquoise
            elif context.tab and context.good:
                fg = self.deeppink
            elif context.link:
                fg = self.blueviolet

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = self.turquoise
                elif context.bad:
                    fg = black
                    bg = self.deeppink
                    attr |= bold

            if context.marked:
                fg = self.deeppink
                attr |= bold

            if context.frozen:
                fg = self.blueviolet
                attr |= bold

            if context.message and context.bad:
                fg = self.deeppink
                attr |= bold

            if context.loaded:
                bg = self.progress_bar_color

            if context.vcsinfo:
                fg = self.blueviolet
                attr &= ~bold
            if context.vcscommit:
                fg = self.orange
                attr &= ~bold
            if context.vcsdate:
                fg = self.turquoise
                attr &= ~bold

        if context.in_taskview:
            if context.title:
                fg = self.blueviolet
                attr |= bold
            if context.selected:
                attr |= reverse
            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = self.deeppink
                attr |= bold
            elif context.vcschanged:
                fg = self.deeppink
            elif context.vcsunknown:
                fg = self.blueviolet
            elif context.vcsstaged:
                fg = self.turquoise
            elif context.vcssync:
                fg = self.turquoise
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = self.turquoise
            elif context.vcsbehind:
                fg = self.deeppink
            elif context.vcsahead:
                fg = self.orange
            elif context.vcsdiverged:
                fg = self.deeppink
            elif context.vcsunknown:
                fg = self.blueviolet

        if context.text and context.highlight:
            attr |= reverse

        return fg, bg, attr

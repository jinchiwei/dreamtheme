# dreamtheme — bash prompt
# Source this from ~/.bashrc, or paste the PS1 you prefer.
# Brand: turquoise #40E0D0 (user@host), deeppink #FF1493 (path).

# --- Truecolor (24-bit) — exact brand hex; use on a truecolor terminal ---
PS1="\[\033[38;2;64;224;208m\]\u@\h \[\033[38;2;255;20;147m\]\w\[\033[0m\] $ "

# --- 16-color fallback (the original ~/.bashrc prompt) — cyan + magenta ---
# Use this instead if your terminal lacks truecolor support:
# PS1="\[\033[1;36m\]\u@\h \[\033[1;35m\]\w\[\033[0m\] $ "

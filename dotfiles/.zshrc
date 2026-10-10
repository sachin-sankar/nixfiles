fpath=(~/.zsh/completions $fpath)

ZSH_DISABLE_COMPFIX="true"

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

COMPLETION_WAITING_DOTS="true"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

for integration in ~/.zsh/integrations/*.zsh(N); do
  source "$integration"
done

# 7. Fast Automated Starship Initialization
if [ ! -f ~/.starship_static.zsh ]; then
  command -v starship &>/dev/null && starship init zsh --print-full-init > ~/.starship_static.zsh
fi
[[ -f ~/.starship_static.zsh ]] && source ~/.starship_static.zsh || eval "$(starship init zsh)"

# 8. Aliases
alias ls='lsd -a'
alias l='ls'
alias yd='yt-dlp --sponsorblock-remove sponsor -f "bestvideo[height<=1440]+bestaudio/best[height<=1440]" --embed-chapters'
alias ydc='yt-dlp -f "bv*+ba/b" --cookies-from-browser firefox:~/.config/zen/'
alias markalldown='find . -maxdepth 1 -type f -exec bash -c '\''markitdown "$1" -o "${1%.*}.md"'\'' _ {} \;'
alias n='nvim'
alias y='yazi'
alias dnd='kitten dnd'
alias dnds='dnd $(fzf)'
alias ssh='kitty +kitten ssh'
alias backup='restic -r /run/media/sachin/Transcend/sachin-restic-archlinux backup --files-from .resticinclude --exclude-file .resticignore'

# 9. Environment Paths & Variables
export PATH="$HOME/go/bin:$HOME/scripts:$HOME/.local/share/pnpm/bin:$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)

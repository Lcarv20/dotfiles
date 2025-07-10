$HOME/.dotfiles/zsh/poke-colorscript
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "romkatv/powerlevel10k"
plug "paulirish/git-open"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"
plug "Lcarv20/web-search"

plugins=(...web-search)

export XDG_CONFIG_HOME="$HOME/.config"

# Ruby stuff I guess
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

#BOB (nvim v-manager)-------------------------------------------------------
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH
#HomeBrew-------------------------------------------------------------
export PATH=/opt/homebrew/sbin:$PATH
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Default Editor -------------------------------------------------------------
export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"

## VIVID
export LS_COLORS="$(vivid generate one-dark)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# ------------------------------
# --- ALIASES
# ------------------------------
# Better ls
alias ls="lsd"
alias l="lsd -l"
alias lt="lsd --tree"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"

# Better CD
alias cd="z"

# Neovim
alias v="nvim"
alias m="NVIM_APPNAME=mvim nvim"
alias mvim="NVIM_APPNAME=mvim nvim"

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"1337\""
  alias catt="bat --theme \"1337\""
fi

# Editor for commit messages
# VS Code
alias vscommit='GIT_EDITOR="code --wait" git commit'
# Zed
alias zcommit='GIT_EDITOR="zed --wait" git commit'
# Xcode
alias xcommit='GIT_EDITOR="xed -w" git commit'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# completions dir
fpath+=~/.zfunc
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# TUNR OFF NEXT TELEMETRY
export NEXT_TELEMETRY_DISABLED=1

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate bash)"

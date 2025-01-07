# FNM node version manager - this eval changes node version and prints
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
$HOME/.dotfiles/zsh/poke-colorscript
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "romkatv/powerlevel10k"
plug "paulirish/git-open"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"
plug "Lcarv20/web-search"

plugins=(...web-search)

#BOB (nvim v-manager)-------------------------------------------------------
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH
#HomeBrew-------------------------------------------------------------
export PATH=/opt/homebrew/sbin:$PATH
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Dart-------------------------------------------------------------
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"
# Flutter-------------------------------------------------------------
export PATH="$PATH:$HOME/flutter/bin"
# goimports-------------------------------------------------------------
export PATH="$PATH:$HOME/go/bin"
# Added by Toolbox App-------------------------------------------------------------
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
# PNPM-------------------------------------------------------------
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# GOLANG CI LINTER-------------------------------------------------------------
export PATH=$PATH:$GOLANGCI_LINT_INSTALL_DIR

# # Lazygit, Neovim and etc------------------------------------------------
# export XDG_CONFIG_HOME="$HOME/.config"

# FNM node version manager-------------------------------------------------------------
export PATH=/home/$USER/.fnm:$PATH

# Default Editor -------------------------------------------------------------
export EDITOR='nvim'

# Rust toolchain----------------------------------------------------------
export CARGO_HOME=$HOME/.cargo
export RUSTUP_HOME=$HOME/.rustup
export PATH=$PATH:$HOME/.cargo/bin

export XDG_CONFIG_HOME="$HOME/.config"

# Not sure but I think I want to use the terminal colors,
# because vivid doesn't support everforest theme
## VIVID
export LS_COLORS="$(vivid generate catppuccin-mocha)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# Buildpacks autocompletion
# . $(pack completion --shell zsh)


# ------------------------------
# --- ALIASES
# ------------------------------
# Golang apps and libraries
alias air="$HOME/go/bin/air"
alias gin="$HOME/go/bin/gin"
alias wails="$HOME/go/bin/wails"
alias pnx="pnpm nx"
# Better ls
alias ls="lsd"
alias l="lsd -l"
alias lt="lsd --tree"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"

alias v="nvim"

alias "git open"="git-open"
alias gui="gitui"

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

# export FZF_DEFAULT_OPTS=" \
# --border=rounded --margin=1% --no-info --prompt=' ' --no-mouse \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

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

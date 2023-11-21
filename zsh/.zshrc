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

#BOB (nvim v-manager)-------------------------------------------------------
export PATH=/Users/lcarv/.local/share/bob/nvim-bin:$PATH
#HomeBrew-------------------------------------------------------------
export PATH=/opt/homebrew/sbin:$PATH
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#LunarVim-------------------------------------------------------------
export PATH=/Users/lcarv/.local/bin:$PATH
# Dart-------------------------------------------------------------
export PATH="$PATH:/Users/lcarv/flutter/bin/cache/dart-sdk/bin"
# Flutter-------------------------------------------------------------
export PATH="$PATH:/Users/lcarv/flutter/bin"
# goimports-------------------------------------------------------------
export PATH="$PATH:$HOME/go/bin"
# Added by Toolbox App-------------------------------------------------------------
export PATH="$PATH:/Users/lcarv/Library/Application Support/JetBrains/Toolbox/scripts"
# PNPM-------------------------------------------------------------
export PNPM_HOME="/Users/lcarv/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# Java openJDK-------------------------------------------------------------
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# For compilers to find openjdk you may need to set:
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
#
# GOLANG CI LINTER-------------------------------------------------------------
export PATH=$PATH:$GOLANGCI_LINT_INSTALL_DIR

# Lazygit, Neovim and etc------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"

# FNM node version manager-------------------------------------------------------------
export PATH=/home/$USER/.fnm:$PATH

# Default Editor -------------------------------------------------------------
export EDITOR='nvim'

# SDK man for managing java version mannager
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# Rust toolchain----------------------------------------------------------
export CARGO_HOME=$HOME/.cargo
export RUSTUP_HOME=$HOME/.rustup
export PATH=$PATH:$HOME/.cargo/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lcarv/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lcarv/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lcarv/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lcarv/google-cloud-sdk/completion.zsh.inc'; fi

# Buildpacks autocompletion
# . $(pack completion --shell zsh)

# Dotnet------------------------------------------------------------- 
export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"




# ------------------------------
# --- ALIASES
# ------------------------------
# Golang apps and libraries
alias air="/Users/lcarv/go/bin/air"
alias gin="/Users/lcarv/go/bin/gin"
alias wails="/Users/lcarv/go/bin/wails"
alias pnx="pnpm nx"
# Better ls
alias l="ls -l"
alias ls="lsd"
alias lt="ls --tree"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
# Lunarvim & Neovide PDE
alias lv="/Users/lcarv/.config/lvim/neolvim"
alias nvl="XDG_CONFIG_HOME=/Users/lcarv/.config/nvl XDG_DATA_HOME=/Users/lcarv/.config/nvl nvim"
alias launch="NVIM_APPNAME=launch nvim"
alias "git open"="git-open"

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"base16-256\"" 
  alias catt="bat --theme \"base16-256\"" 
fi


# Zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# not sure if this works
# HYPHEN_INSENSITIVE="true"

# fzf catppuccin_mocha
# export FZF_DEFAULT_OPTS=" \
# --border=rounded --margin=1% --no-info --prompt=' ' --no-mouse \
# --color=bg+:#272836,bg:#1a1b26,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export FZF_DEFAULT_OPTS=" \
--border=rounded --margin=1% --no-info --prompt=' ' --no-mouse \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

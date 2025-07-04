export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# HYPHEN_INSENSITIVE="true"
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(archlinux)
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='eza -lhgmUX --git --git-repos --classify=always --icons=always --color-scale-mode=gradient --color-scale=all --group-directories-first  --total-size --stdin'
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='grep -F --color=auto'
    alias egrep='grep -E --color=auto'
fi

# ls alias
alias lt='eza -lhgTamUX --git --git-repos --classify=always --icons=always --color-scale-mode=gradient --color-scale=all --group-directories-first  --total-size --stdin'                                                             # tree listing
alias l.="eza -lhgAdmUX --git --git-repos --classify=always --icons=always --color-scale-mode=gradient --color-scale=all --group-directories-first  --total-size --stdin .*"                                            #only show dotfiles
alias al='eza -lhgamUX --git --git-repos --classify=always --icons=always --color-scale-mode=gradient --color-scale=all --group-directories-first  --total-size --stdin'   #recursive all
alias la='eza -lhgamUX --git --git-repos --classify=always --icons=always --color-scale-mode=gradient --color-scale=all --group-directories-first  --total-size --stdin'   #recursive all
alias l='eza -h -F=always --group-directories-first --color=always --color-scale-mode=gradient --icons=always'                   #replace ls
alias dir='eza -lDhgAmUX --git --git-repos --classify=always --icons=always --color-scale-mode=gradient --color-scale=all --group-directories-first  --total-size --stdin' #only show directories
alias lf='eza -lfhgamUX --git --git-repos --classify=always --icons=always --color-scale-mode=gradient --color-scale=all --group-directories-first  --total-size --stdin'                                         #only show files

# Aliases
#alias cd..='cd ..'
#alias cd...='cd ../../'
#alias cd....='cd ../../../'
#alias cd.....='cd ../../../../'
alias rm='rm -v'
alias rmv='rm -rfv'
alias v='nvim'
alias cp='cp -rv'
alias mv='mv -v'
alias df='df -h'
alias bat='bat --style=full'
alias ip='ip -color'
alias ipinfo='curl ipinfo.io'
alias jctlboot='journalctl -p 3 -xb'
alias jctl='sudo journalctl'
alias c='clear'
alias pip='~/.venv/bin/pip'
alias python='~/.venv/bin/python'
alias speedtest='speedtest --secure --simple'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# NVM END

# pnpm
export PNPM_HOME="/home/owl/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#History
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt share_history
#Git Integration
autoload -Uz compinit && compinit

#Git prompt from example
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

#Bold, green, username, no colour, :, blue, directory, no colour, new line, >, no bold
PROMPT="%B%F{green}%n%f:%F{blue}%~%f "'${vcs_info_msg_0_}'$'\n'"%#%b "

#Set the git prompt to be branch name in cyan
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%f'
zstyle ':vcs_info:*' enable git

alias ls='ls --color=auto'
alias grep='grep --color=auto'

MAKEFLAGS="--jobs=$(nproc)"


# Use neovim instead of vim and vi
alias vim="nvim"
alias vi="nvim"
alias :q="exit"

#Use zoxide
eval "$(zoxide init --cmd cd zsh)"

# Add node to the path
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

#Set up QT
export QT_QPA_PLATFORM="Wayland"
export QT_QPA_PLATFORMTHEME="qt6ct"

source <(fzf --zsh)

# enable syntax highlighting
# Different location if under linux or mac
case "$(uname -sr)" in
    Darwin*)
        source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;;
    Linux*)
        source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;;
esac

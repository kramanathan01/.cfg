# Source zsh plugins
# source $HOME/.config/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

[ -d "/opt/homebrew/share/zsh-autosuggestions/" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
                                                  || source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -d "/opt/homebrew/share/zsh-syntax-highlighting/highlighters" ] && export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters \
                                                                  || export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

[ -d "/opt/homebrew/share/zsh-autosuggestions/" ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
                                                  || source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



eval "$(starship init zsh)"

# alias n="nnn"
# function nnn () {
#     command nnn "$@"

#     if [ -f "$NNN_TMPFILE" ]; then
#             . "$NNN_TMPFILE"
#     fi
# }

source $HOME/.config/aliases.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Only load conda into path but dont actually use the bloat that comes with it
# export PATH="$HOME/miniforge3/bin:/usr/local/anaconda3/bin:$PATH"
# export NNN_TMPFILE="$HOME/.config/nnn/.lastd"
export EDITOR='code'
export VEDITOR='code'
# export VISUAL="$HOME/.config/nnn/plugins/selnew.sh"

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# bun completions
[ -s "/Users/pepperonico/.bun/_bun" ] && source "/Users/pepperonico/.bun/_bun"

eval $(/opt/homebrew/bin/brew shellenv)

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pepperonico/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pepperonico/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/pepperonico/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pepperonico/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[[ -s "/Users/pepperonico/.gvm/scripts/gvm" ]] && source "/Users/pepperonico/.gvm/scripts/gvm"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

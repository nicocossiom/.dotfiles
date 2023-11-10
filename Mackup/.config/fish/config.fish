alias ls=lsd
alias cat=bat
alias top=btm
alias htop=btm
alias find=fd
alias p=pnpm
alias px=pnpx
alias b=bun
alias bx=bunx
alias fd=dust

fish_ssh_agent

# rbenv setup
status --is-interactive; and rbenv init - fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# z jump
zoxide init fish | source

# fzf keybingings
fzf_configure_bindings --directory=\cf --git_status=\cS --git_log=\a --processes=\cO

# ipfs completions
source ~/.config/fish/completions/ipfs-completion.fish

# dotnet completions
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"

# pnpm
set -gx PNPM_HOME /Users/pepperonico/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# ohmpyposh theme
oh-my-posh init fish --config ~/.dotfiles/gruvbox.json | source
oh-my-posh completion fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/mambaforge/base/bin/conda
    eval /opt/homebrew/Caskroom/mambaforge/base/bin/conda "shell.fish" hook $argv | source
end

if test -f "/opt/homebrew/Caskroom/mambaforge/base/etc/fish/conf.d/mamba.fish"
    source "/opt/homebrew/Caskroom/mambaforge/base/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<
set -gx ITERM2_SQUELCH_MARK 1
function set_poshcontext
	iterm2_prompt_mark
end
# iterm2 integration
source ~/.config/fish/functions/iterm2_shell_integration.fish

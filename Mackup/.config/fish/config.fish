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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/pepperonico/mambaforge/bin/conda
    eval /Users/pepperonico/mambaforge/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<

# ohmpyposh theme
oh-my-posh init fish --config .config/fish/themes/gruvbox.json | source
oh-my-posh completion fish | source

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

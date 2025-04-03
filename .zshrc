# Forward through reverse search
[[ $- == *i* ]] && stty -ixon

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# A very fast Zsh Theme.
source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"

# Fish shell like syntax highlighting for zsh.
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Auto autosuggestions.
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Case insensitive file matching completion.
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
#shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
#shopt -s histappend

# Autocorrect typos in path names when using `cd`
# shopt -s cdspell;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SSH Agent
ssh-add -A &> /dev/null

# Zoxide.
eval "$(zoxide init zsh)"

# CHRuby.
source "$(brew --prefix)/opt/chruby/share/chruby/chruby.sh"
# CHRuby switch based on .ruby-version files.
source "$(brew --prefix)/opt/chruby/share/chruby/auto.sh"

# Disable zsh globbing (using wildcards in commands)
unsetopt nomatch

# Directory in iterm tab
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

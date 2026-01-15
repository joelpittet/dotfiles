# Forward through reverse search
[[ $- == *i* ]] && stty -ixon

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if command -v brew >/dev/null 2>&1; then
  HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-$(brew --prefix)}"
elif [ -d /opt/homebrew ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
elif [ -d /usr/local/Homebrew ] || [ -d /usr/local ]; then
  HOMEBREW_PREFIX="/usr/local"
fi

if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
  # A very fast Zsh Theme.
  [[ -r "${HOMEBREW_PREFIX}/share/powerlevel10k/powerlevel10k.zsh-theme" ]] \
    && source "${HOMEBREW_PREFIX}/share/powerlevel10k/powerlevel10k.zsh-theme"

  # Fish shell like syntax highlighting for zsh.
  [[ -r "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] \
    && source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  # Auto autosuggestions.
  [[ -r "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] \
    && source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

  if [[ -d "${HOMEBREW_PREFIX}/share/zsh-completions" ]]; then
    FPATH="${HOMEBREW_PREFIX}/share/zsh-completions:${FPATH}"
  fi
fi
autoload -Uz compinit
compinit

# Case insensitive file matching completion.
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#
# History
#
# Save the history after each command
setopt inc_append_history

# Share history across sessions
setopt share_history

# Don't store duplicate commands
setopt hist_ignore_dups

# Don't store commands that start with a space
setopt hist_ignore_space

# Append rather than overwrite history file
setopt append_history

#
# Path correcting.
#

# Case-insensitive globbing (used in pathname expansion)
setopt nocaseglob

# Autocorrect minor typos in path names when using `cd`.
setopt correct

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SSH Agent
if [[ -n "${SSH_AUTH_SOCK:-}" ]]; then
  ssh-add -A &> /dev/null || true
fi

# Zoxide.
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# CHRuby.
if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
  [[ -r "${HOMEBREW_PREFIX}/opt/chruby/share/chruby/chruby.sh" ]] \
    && source "${HOMEBREW_PREFIX}/opt/chruby/share/chruby/chruby.sh"
  # CHRuby switch based on .ruby-version files.
  [[ -r "${HOMEBREW_PREFIX}/opt/chruby/share/chruby/auto.sh" ]] \
    && source "${HOMEBREW_PREFIX}/opt/chruby/share/chruby/auto.sh"
fi

# Disable zsh globbing (using wildcards in commands)
unsetopt nomatch

# Directory in iterm tab
if [ -n "${ITERM_SESSION_ID:-}" ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

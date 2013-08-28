#
# Configures Ruby local gem installation, loads version managers, and defines
# aliases.
#
# Authors: Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load RVM into the shell session.
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  # Unset AUTO_NAME_DIRS since auto adding variable-stored paths to ~ list
  # conflicts with RVM.
  unsetopt AUTO_NAME_DIRS

  # Source RVM.
  source "$HOME/.rvm/scripts/rvm"

# Load manually installed rbenv into the shell session.
elif [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
  path=("$HOME/.rbenv/bin" $path)
  eval "$(rbenv init - --no-rehash zsh)"

# Load package manager installed rbenv into the shell session.
elif (( $+commands[rbenv] )); then
  eval "$(rbenv init - --no-rehash zsh)"

# Prepend local gems bin directories to PATH.
else
  path=($HOME/.gem/ruby/*/bin(N) $path)
fi

# Return if requirements are not found.
if (( ! $+commands[ruby] && ! ( $+commands[rvm] || $+commands[rbenv] ) )); then
  return 1
fi

#
# Aliases
#

# Bundler
if (( $+commands[bundle] )); then
  alias be='bundle exec'
  alias bi='bundle install --path vendor/bundle'
  alias bl='bundle list'
  alias bo='bundle open'
  alias bp='bundle package'
  alias bu='bundle update'
  alias bI='bundle install \
    && bundle package \
    && print .bundle       >>! .gitignore \
    && print vendor/bundle >>! .gitignore \
    && print vendor/cache  >>! .gitignore'
fi

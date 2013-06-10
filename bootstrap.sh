#!/bin/zsh

setopt EXTENDED_GLOB

function setup
{
  ln -s ${PWD} "$HOME/.z${PWD:t}"
  for rcfile in "${PWD}"/runcoms/^README.md(.N); do
    dotfile="${ZDOTDIR:-$HOME}/.${rcfile:t}"

    if [ -e $dotfile ]; then
      echo "$dotfile already exists"
    else
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
      echo "$dotfile linked"
    fi
  done
}

function purge
{
  for dotfile in "$HOME"/.z*; do
    dotfile="$HOME/${dotfile:t}"
    rm -rf $dotfile
    echo "$dotfile deleted"
  done
}

case $1 in
  purge)
    echo "> Purging Prezto..."
    purge
    ;;
  *)
    echo "> Setting up Prezto..."
    setup
    ;;
esac

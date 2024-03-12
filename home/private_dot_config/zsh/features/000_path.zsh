# path, the 0 in the filename causes this to load first

# Base PATH
export GOPATH="$(go env GOPATH)" # Go
# Conditional PATH additions
for path_candidate in /opt/local/sbin \
  ~/.toolbox/bin \
  /Applications/Xcode.app/Contents/Developer/usr/bin \
  ~/Library/Android/sdk/cmdline-tools/latest/bin \
  /opt/local/bin \
  /usr/local/share/npm/bin \
  ~/Library/Python/3.8/lib/python/site-packages \
  /opt/homebrew/Caskroom/miniconda/base/lib/python3.9/site-packages \
  ~/.cabal/bin \
  ~/.emacs.d/bin \
  ~/.dotfiles/bin \
  ~/.cargo/bin \
  $GOPATH/bin \
  $HOME/.yarn/bin \
  $HOME/.config/yarn/global/node_modules/.bin \
  $HOME/.gem/bin \
  ~/.rbenv/bin \
  ~/.node/bin \
  ~/.local/bin \
  ~/.bin/flutter/bin \
  ~/.bin/android-cmdline-tools/bin \
  ~/.kiex/bin \
  ~/.asdf/bin \
  ~/bin \
  ~/.composer/vendor/bin \
  $HOME/anaconda3/bin \
  $HOME/.mambaforge3/bin \
  $HOME/.bin \
  $HOME/go/bin \
  $HOME/.gvm/go/bin \
  /usr/local/bin/ \
  $HOME/.dotfiles/bin \
  $HOME/bin \
  $HOME/.bin \
  $HOME/.local/bin \
  $HOME/src/gocode/bin \
  /Applications/Postgres.app/Contents/Versions/9.4/bin \
  /usr/local/bin \
  /usr/local/sbin \
  /sbin \
  /usr/sbin \
  /bin \
  /usr/bin
do
  if [ -d ${path_candidate} ]; then
    export PATH=${PATH}:${path_candidate}
  fi
done
export PATH=$PATH:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin:./node_modules/bin:./node_modules/.bin:./bin
export PATH=/Users/auser/.local/share/ponyup/bin:$PATH

# In case a plugin adds a redundant path entry, remove duplicate entries
# from PATH
#
# This snippet is from Mislav Marohnić <mislav.marohnic@gmail.com>'s
# dotfiles repo at https://github.com/mislav/dotfiles

dedupe_path() {
  typeset -a paths result
  paths=($path)

  while [[ ${#paths} -gt 0 ]]; do
    p="${paths[1]}"
    shift paths
    [[ -z ${paths[(r)$p]} ]] && result+="$p"
  done

  export PATH=${(j+:+)result}
}

has_direnv() { if [[ -n $DIRENV_DIFF ]]; then echo in direnv; else echo not; fi }

typeset -U PATH # Remove duplicates in $PATH

autoload bashcompinit

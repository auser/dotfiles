# path, the 0 in the filename causes this to load first

# Base PATH
export PATH=/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin:./node_modules/bin:./node_modules/.bin:./bin:$PATH

# Conditional PATH additions
for path_candidate in /opt/local/sbin \
  ~/.toolbox/bin \
  /Applications/Xcode.app/Contents/Developer/usr/bin \
  /opt/local/bin \
  /usr/local/share/npm/bin \
  ~/.cabal/bin \
  ~/.cargo/bin \
  ~/.rbenv/bin \
  ~/.node/bin \
  ~/.local/bin \
  ~/.kiex/bin \
  ~/.asdf/bin \
  ~/bin \
  ~/.composer/vendor/bin \
  $HOME/anaconda3/bin \
  $HOME/.bin \
  $HOME/go/bin \
  /usr/local/bin/ \
  $HOME/.dotfiles/bin \
  $HOME/bin \
  $HOME/.bin \
  /usr/local/bin \
  $HOME/src/gocode/bin \
  /Applications/Postgres.app/Contents/Versions/9.4/bin
do
  if [ -d ${path_candidate} ]; then
    export PATH=${PATH}:${path_candidate}
  fi
done

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

autoload bashcompinit

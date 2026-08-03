# Language and SDK integrations. Each integration is optional and must stay quiet
# when its tool is not installed.

# Node.js via nvm. mise can also manage Node; this block only runs when nvm exists.
if [[ -n "${XDG_CONFIG_HOME:-}" ]]; then
  export NVM_DIR="$XDG_CONFIG_HOME/nvm"
else
  export NVM_DIR="$HOME/.nvm"
fi
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

# Java on macOS.
if [[ "$OSTYPE" == darwin* && -x /usr/libexec/java_home ]]; then
  _java_home="$(/usr/libexec/java_home 2>/dev/null)" || _java_home=""
  [[ -n "$_java_home" ]] && export JAVA_HOME="$_java_home"
  unset _java_home
fi

# Android SDK. Respect an existing override before choosing a platform default.
if [[ -z "${ANDROID_HOME:-}" ]]; then
  if [[ "$OSTYPE" == darwin* ]]; then
    ANDROID_HOME="$HOME/Library/Android/sdk"
  elif [[ -d "$HOME/Android/Sdk" ]]; then
    ANDROID_HOME="$HOME/Android/Sdk"
  fi
fi

if [[ -n "${ANDROID_HOME:-}" && -d "$ANDROID_HOME" ]]; then
  export ANDROID_HOME
  export ANDROID_SDK_ROOT="${ANDROID_SDK_ROOT:-$ANDROID_HOME}"

  typeset -a _android_path
  for _dir in \
    "$ANDROID_HOME/emulator" \
    "$ANDROID_HOME/platform-tools" \
    "$ANDROID_HOME/cmdline-tools/latest/bin" \
    "$ANDROID_HOME/tools/bin"
  do
    [[ -d "$_dir" ]] && _android_path+=("$_dir")
  done
  path=("${_android_path[@]}" "${path[@]}")
  unset _dir _android_path
fi

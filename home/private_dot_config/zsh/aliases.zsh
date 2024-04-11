# Temp

# TODO: clean it & use only what I need

# Nix
alias n='nix'
alias nr='nix repl'

# Nix shell
#alias ns="nix-shell --run zsh"
#alias nss="nix-shell --run zsh -p"

# General
alias te='tree'
#alias env='env | fzf'
alias dnd='do-not-disturb toggle'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete" # Recursively delete `.DS_Store` files
alias g='git' # Wrapper over git
alias peek='tee >(cat 1>&2)' # Mirror stdout to stderr, useful for seeing data going through a pipe
alias aet='subl CONTRIBUTING.md'
alias crypto='curl rate.sx' # Get crypto prices
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> public key copied to pasteboard'"
alias lc='tokei'
alias _='sudo'
alias ae='subl README.md' # Edit readme file
alias yi="python -i"
alias kar="/Applications/Karabiner.app/Contents/Library/bin/karabiner"
alias le='less -r'
alias wifi='wifi-password -q'
# alias du='du -sh * | sort'
alias eo='echo'
alias es='elasticsearch'
alias mc='md-to-alfred'
alias pd='pandoc'
alias yt='yotube-dl'
alias r='rg'
alias alf='alfred'
alias d='cd'
alias alert="tput bel" # Bell when the program is finished. i.e. npm install && alert
# TODO: fk alias to run last cmd as sudo instantly
alias lg='ls | grep'
alias so='source'
alias top='gotop'
alias ka='echo'
alias rl='curl'
alias how='howdoi'
alias ua='unalias'
alias m='mkdir'
alias jj='killall tmux'
alias mm='tldr'
alias ma='man'
# alias aw='k -h' TODO: ?
alias rec='asciinema rec'
alias dus='du -s'
alias to='touch'
alias t='bat'
alias zo='open'
alias ff='open .'
alias ki='kill'
alias icat='imgcat'
alias tt='tldr'
alias tre='tree -a'
alias q='exit'
alias screen='screenfetch'
alias ad='open .'
alias mx='chmod +x'
alias rr='rm -rf'
# alias a='ls -FG'
alias a='exa'
alias aa='exa -la' # See hidden files
alias wg='wget -r --no-parent'
alias v='mv'
alias os='osascript'
# alias lt='ls -lart'
# alias aa='ls -lahFG'
# alias aa='exa -lahF'
alias tp='type'
# alias gr='goreleaser'

# Dev
alias ll='ln -s'
alias jd='jid'
alias tm='task'
alias rf='reflex'
alias ser='serve'
alias cra='npx create-react-app'
alias lic='legit'

# App
#alias to.='gittower .' # Open current dir in Tower

# Python
alias p='python3'
alias p2='python2'
alias po='poetry'

# Login to AWS ECR
alias ecrlogin='aws ecr get-login-password --region us-east-1 --profile $AWS_PROFILE | docker login --username AWS --password-stdin '

# Docker
alias c='docker'
alias cs='docker ps'
alias cu='docker-compose up'
# alias cr='docker rm'
# alias cc='docker compose'
# alias cg='docker logs'
# alias cgt='docker logs --tail 100'
# alias cs='docker ps'
# alias csq='docker ps -q'
# alias csa='docker ps -a'
# alias ck='docker kill'
alias docker_clean_images='docker rmi $(docker images -a -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

# Docker ssh agent
alias docker_ssh_agent='docker run -d --name=ssh-agent nardeas/ssh-agent'
alias docker_ssh_key_add='docker run --rm --volumes-from=ssh-agent -v ~/.ssh:/.ssh -it nardeas/ssh-agent ssh-add /root/.ssh/id_rsa'
alias docker_exec=


# Kubernetes
alias k='kubectl'
alias kl='kubectl logs'
alias kf='kubectl logs -f' # Get logs for <pod> streaming in real time
alias kde='kubectl describe'
alias ke='kubectl explain'
alias kg='kubectl get'
alias ks='kubectl get pods'
alias kd='kubectl delete pods'
alias ksw='kubectl get pods -o=wide -w'
alias kp='kubectl port-forward'
#alias kbcontexts='kubectl config view -o jsonpath='{.contexts[*].name}'' # List kubernetes contexts

# Node
alias no='node'

# NPM
alias it='npm init'
alias ig='npm install -g'
alias iis='npm install && npm start'
alias ia='npm add'
alias ir='npm run'
alias ire='npm remove'
alias is='npm start'
alias dev='npm run dev'
alias igl='npm list -g --depth 0'

# Yarn
alias y='yarn'
alias ya='yarn add'
alias yr='yarn run'
alias yre='npm remove'
alias ys='yarn start'
alias ydev='yarn run dev'

# Pnpm
alias pn='pnpm'
alias pni='pnpm install'

# rust
alias ru='rustup'

# Go
alias o='go'
alias org='richgo'
alias og.='go get ./...' # go get all packages for current project
alias ot='playgo'
alias or='go run'
alias oo='go install'
alias ov='go vet'
alias ogu='go get -u' # use the network to update the named packages and their dependencies
alias ob='go build'
alias ora='go-pry'
alias oe='go build -o main'
alias ugo='Go-Package-Store' # displays updates to Go packages

# Ruby
alias rb='ruby'

# Piping
alias h2='head -n 2'
alias h10='head -n 10'
alias t10='tail -n 10'

# Metro
alias metro='flutter pub run nylo_framework:main'

# Conda
alias cpip='$(dirname $(which python))/pip'

alias hs='ghci'

alias cwd='pwd | pbcopy'

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  local DISTRIB=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
  if [[ ${DISTRIB} = *"buntu"* ]]; then
    # Ubuntu
    if uname -a | grep -q '^Linux.*microsoft'; then
      alias pbcopy="clip.exe"
      alias pbpaste="powershell.exe Get-Clipboard"
    else
      # Native ubuntu
    fi
  elif [[ ${DISTRIB} = "Debian"* ]]; then
    # debian
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # mac
fi

# Delete things
alias rrpdf='rm -rf *.pdf'

# Source things
alias sz='exec zsh'

# Hugo
alias us='hugo server -D'
alias ut='hugo server -w' # testing
alias u='hugo'

# Nginx
alias ngup='sudo nginx'
alias ngdown='sudo nginx -s stop'
alias ngre='sudo nginx -s stop && sudo nginx'
alias nglog='tail -f /usr/local/var/log/nginx/access.log' # TODO: maybe wrong location
alias ngerr='tail -f /usr/local/var/log/nginx/error.log'

# Utility
alias net="ping ya.ru | grep -E --only-match --color=never '[0-9\.]+ ms'"                # check connection
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
alias ba="bash"

# easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias cpu='top -o cpu'   # CPU
alias mem='top -o rsize' # Memory

# Apps
alias can="open -a Google\ Chrome\ Canary"
alias saf="open -a Safari"

# Edit configs
alias ew='nvim ~/.dotfiles/nvim/init.vim' # nvimrc
alias essh='nvim ~/.ssh/config' # ssh config
alias ez='nvim ~/.zshrc'

# cd places
alias ds='cd ~/.ssh'
alias dz='cd ~/.dotfiles'
alias de='cd ~/Desktop'
alias dq='cd ~/Downloads'
alias drp='cd ~/Dropbox'

# Xcode
alias dx='cd ~/src/Xcode'
alias dxi='cd ~/src/Xcode/iOS'
alias dxm='cd ~/src/xcode/macOS'

# Config
alias d..='cd ~/.config'
alias db='cd ~/.dotfiles/bin'
alias dh='cd ~/.hammerspoon'

# Utilities
alias ungit="find . -name '.git' -exec rm -rf {} \;" # Remove git from a project
alias gto='gittower'

# Git
alias gj='open `git config remote.origin.url`'
alias gm='git branch -m' # Rename current branch
alias ger='git checkout -' # Checkout last branch you were on
alias grl='git reset --hard && git clean -df' # Reset to exact state as last commit
alias grhf='git checkout HEAD --' # Git reset single file
alias glo='git log --pretty=oneline --abbrev-commit --graph --decorate'
alias gpm="git push origin master"
alias gfk='git fetch && git reset --hard && git clean -dfx' # Reset repo to clean remote state
alias gsp='git pull --rebase --autostash' # Git stash, pull and apply stash
alias gu='git issues'
alias gdp='git reset --hard HEAD~; git push --force-with-lease' # Delete previous commit locally and remote
alias gpd="git push origin develop"
alias ggh='push -u origin HEAD'
alias gre='git rebase -i HEAD~4'
alias gS='git stash'
alias gqa='git stash apply'
alias gb='git checkout -b'
alias gr='git reset --hard'
alias grc='git rm --cached'
alias ggn='git_add_origin_and_origin_push'
# alias gt='git tag'
alias g:='git push -u origin HEAD'
#alias gu='git commit --amend'
alias ggf='git push -f'
alias g::='git_remote_add_origin_from_active_link'
# alias g="git"
alias gi='git init'
alias gl='git pull'
alias gn='git clone'
alias g.='git add .'
alias ga='git add'
# alias gb='git branch'
alias gg='git push'
#alias gr='git rm'
# alias gf='git fetch'
alias glp='git pull && git push'
alias grao='git remote add origin'
#alias gz='git discard'
#alias gr='git rm --cached -r'

# Undo your last commit, but don't throw away your changes
alias greset='git reset --soft HEAD^'

# Git Diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdn='git diff --name-only'

# Git Status
alias gs='git status --short'
alias gss='git show --word-diff=color' # See changes made
alias upg='find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;'

# Emacs

alias emacs-osx="open /Applications/Emacs.app $@"
alias emacs='/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs'
alias emacs='/opt/homebrew/opt/emacs-mac/Emacs.app/Contents/MacOS/Emacs -nw  "$@"'
alias emacsclient='/Applications/MacPorts/Emacs.app/Contents/MacOS/bin/emacsclient'


# Ruby
alias be="bundle exec"

alias g=git
alias gnp="git --no-pager"
alias k=kubectl
alias ks="kubectl --namespace=kube-system"

# Tmux
alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'


alias clean_desktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias show_desktop='defaults write com.apple.finder CreateDesktop true && killall Finder'

alias ifconfig='sudo ifconfig'
alias s='sudo'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias l='ls -lart'
alias h='history'
alias installz='sudo apt-get install $1 -y'
alias autoremove='sudo apt-get autoremove -y'
alias autoclean='sudo apt-get autoclean -y'
alias root='sudo -i'
alias diff='colordiff'
alias mount='sudo mount | column -t'
alias webup='sudo python -m http.server 80'
alias httpup='sudo ~/apps/up-http-tool/up'
alias ftpup='sudo python -m pyftpdlib -p 21'
alias smbup='sudo python3 /usr/share/doc/python3-impacket/examples/smbserver.py -smb2support share $(pwd)'
alias vpn-htb='sudo openvpn --config /home/crystal/HTB.ovpn'
alias vpn-academy='sudo openvpn --config /home/crystal/HTB-Academy.ovpn'
alias vpn-release_arena='sudo openvpn --config /home/crystal/HTB-Release-Arena.ovpn'
alias vpn-starting_point='sudo openvpn --config /home/crystal/HTB-Starting-Point.ovpn'
alias vpn-thm='sudo openvpn --config /home/crystal/THM.ovpn'
alias ss='searchsploit $1'
alias ssx='searchsploit -x $1'
alias ssm='searchsploit -m $1'
alias gobusterz='gobuster dir -w /usr/share/dirbuster/wordlists/directory-list-lowercase-2.3-medium.txt -u $1'
alias mscanz='sudo masscan -p1-65535,U:1-65535 $1 --rate=1000 -e tun0 --wait 5 > mscan.txt'
alias nmapz='/home/crystal/scripts/gen_nmap.py; while read item; do sudo nmap -sV -sC -sU -sS $item; done < nmap.txt; rm mscan.txt nmap.txt'
alias qmapz='sudo nmap -sV -sC $1'
alias nse='ls /usr/share/nmap/scripts | grep'
alias nse-help='nmap --script-help'
alias pattern_create='/usr/share/metasploit-framework/tools/exploit/pattern_create.rb -l $1'
alias pattern_offset='/usr/share/metasploit-framework/tools/exploit/pattern_offset.rb -q $1' 
alias nasm_shell='/usr/share/metasploit-framework/tools/exploit/nasm_shell.rb'
alias msfelfscan='/usr/share/framework2/msfelfscan'
alias wpscan='wpscan -e ap,t,u --api-token <no_stealing_cats_tokens> --url $1'
alias wes-ng='python /home/crystal/scripts/windows/wesng/wes.py'
alias aslr_off='echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias gen_nmap='/home/crystal/scripts/gen_nmap.py'
alias gcc_no_protections='gcc -fno-stack-protector -z execstack -no-pie'
alias dvwa_start='sudo service mysql start && sudo service apache2 start'
alias docker_fix='sudo mkdir /sys/fs/cgroup/systemd; sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd'
alias android_studio='/home/crystal/apps/android-studio/bin/studio.sh'
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan:1.10.0'
alias pipz_upgrade='pip freeze > requirements.txt; pip install -r requirements.txt --upgrade; rm requirements.txt;'
alias ghidra_auto='python3 /home/crystal/apps/auto_ghidra.py'
alias pwninit='/home/crystal/apps/pwninit --template-path ~/.config/pwninit-template.py; sed -n "4,6p" solve.py; rm solve.py; mv *_patched $1'
alias burpsuite='java -jar --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED /usr/bin/burpsuite'
alias ctfd_download='python ~/ctf/helpers/ctfd_download_python/download.py'
alias enum4linux='python /home/crystal/scripts/enum4linux-ng/enum4linux-ng.py'
alias subbrute='python /home/crystal/apps/subbrute/subbrute.py'
alias mobsf_emulator='emulator -avd $1 -writable-system -no-snapshot'
alias codemerx='/home/crystal/apps/codemerx/bin/CodemerxDecompile'
alias webdavup='sudo wsgidav --host=$1 --port=$2 --root=/tmp --auth=anonymous'
alias username-anarchy='ruby /home/crystal/apps/username-anarchy/username-anarchy'
alias xs-strike='python /home/crystal/apps/XSStrike/xsstrike.py'
alias jwt_tool='python /home/crystal/apps/jwt_tool/jwt_tool.py'
urlencode() {
    python3 -c "from pwn import *; print(urlencode('$1'));"
}
urldecode() {
    python3 -c "from pwn import *; print(urldecode('$1'));"
}
ffuf-vhost() {
    arg_count=3
    if [[ $2 && $2 != -* ]]; then
        wordlist=$2
    else
        wordlist='/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt'
        arg_count=2
    fi
    ffuf -c -H "Host: FUZZ.$1" -u http://$1 -w $wordlist ${@: $arg_count};
}
ffuf-dir() {
    arg_count=3
    if [[ $2 && $2 != -* ]]; then
        wordlist=$2
    else
        wordlist='/usr/share/dirbuster/wordlists/directory-list-lowercase-2.3-medium.txt'
        arg_count=2
    fi
    ffuf -c -u $1FUZZ -w $wordlist ${@: $arg_count};
}
ffuf-req() {
    arg_count=2
    if [[ $1 && $1 != -* ]]; then
        wordlist=$1
    else
        wordlist='/usr/share/dirbuster/wordlists/directory-list-lowercase-2.3-medium.txt'
        arg_count=1
    fi
    ffuf -c -ic -request new.req -request-proto http -w $wordlist ${@: $arg_count};
}
plzsh() {
    if [[ $1 ]]; then
        port=$1
    else
        port=1337
    fi
    stty raw -echo; (echo 'python3 -c "import pty;pty.spawn(\"/bin/bash\")" || python -c "import pty;pty.spawn(\"/bin/bash\")"' ;echo "stty$(stty -a | awk -F ';' '{print $2 $3}' | head -n 1)"; echo reset;cat) | nc -lvnp $port && reset
}
qssh() {
    sshpass -p $2 ssh -o StrictHostKeyChecking=no $1@$3 ${@: 4};
}
rdp() {
    xfreerdp /u:$1 /p:$2 /v:$3 /size:1440x810 /clipboard /cert-ignore ${@: 4};
}
extract() {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}




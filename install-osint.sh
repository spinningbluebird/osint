#!/usr/bin/bash

# colors
orange='\e[93m'
yellow='\e[93m'
green='\e[92m'
red='\e[91m'
end='\e[0m'
bgred='\e[41m'
# Status
correct="[\e[1m\e[92;1m ✔ $end]"
incorrect="[\e[1m\e[91;1m ✘ $end]"
# Arts
banner="$(cat ./ascii-art)"

echo "$banner" | while read line
  do
    printf "$yellow$line$end\r"
    sleep 0.01
    echo -e "\e[38;5;202;1m$line$end"
  done

_install_pip(){
  pip_version="$(ls -v /usr/local/bin/pip* | tail -n1 || printf 'pip')"
  run="$pip_version install $1 --user"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $1" || echo -e "$incorrect Error in install of: $1" 
} 
_install_git(){
  run="git clone $1"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $1" || echo -e "$incorrect Error in install of: $1" 
}
_run(){
  echo -e "Run: $orange$1$end"
  eval "$1" && echo -e "$correct $1" || echo -e "$incorrect $1" 
}

# Operative-framework
_run 'go get github.com/graniet/operative-framework'
# Install D4N155
_install_git 'https://github.com/OWASP/D4N155.git'
_install_pip '-r D4N155/requirements.txt'
# Install sherlock
_install_git 'https://github.com/sherlock-project/sherlock.git'
_install_pip '-r sherlock/requirements.txt'
# Install osrframework
_run "$(ls -v /usr/local/bin/pip2* | head -n1 || printf 'pip') install osrframework --user"
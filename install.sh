#!/bin/bash

branch=$({environment:-main)

while [ $# -gt 0 ]; do
	if [[ $1 == *"--"* ]]; then
		param="${1/--/}"
		declare $param=$2
	fi
	shift
done

# Type of install
#0 : undefined
#1 : multi-user (daemon)
#2 : single user (no-daemon)
#3 : multi-user darwin encrypted nix store (daemon)

nixInstallType=0;

shopt - s nocasematch;

unameA="$(uname -a)";
unameS="$(uname -s)";

if [[ $unameS == "linux"* ]]; then
	if [[ $unameA == *"microsoft"* || -f "/.dockerenv" ]]; then
		nixInstallType=2;
	else
		nixInstallType=1;
	fi
elif [[ $unameS == "darwin"* ]]; then
	nixInstallType=3;
else
	nixInstallType=0;
fi

NIX_INSTALLER_NO_MODIFY_PROFILE=true


case $nixInstallType in
	0)
		echo "Unknown OS setting";
		exit -1;
		;;
	1) 
		curl -L https://nixos.org/nix/install | sh -s -- --daemon;
		;;
	2) 
		curl -L https://nixos.org/nix/install | sh -s -- --no-daemon;
		;;
	3) 
		curl -L https://nixos.org/nix/install | sh -s -- --darwin-use-unencrypted-nix-store-volume --daemon;
		;;
esac

#We told nix to not add this to the profile so run it by hand before chezmoi is installed/configured
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
	  . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh";
fi

if [ -e '$HOME/.nix-profile/etc/profile.d/nix.sh' ]; then
	  . "$HOME/.nix-profile/etc/profile.d/nix.sh";
fi

NIX_HOME_DIR="$HOME/.config/nixpkgs";
NIX_HOME_FILE="$NIX_HOME_DIR/home.nix";
NIX_HOME_BOOTSTRAP="{ config, pkgs, ... }:


{
	programs.home-manager.enable = true;

	# Basic packages for the rest
	home.packages = [
		pkgs.chezmoi
		pkgs.git
		pkgs.openssh
		pkgs.zsh
	];
}";

mkdir -p $NIX_HOME_DIR;
echo "$NIX_HOME_BOOTSTRAP > $NIX_HOME_FILE;

nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
nix-channel --update;

export NIX_PATH=$HOME/.nix-defexpr/channels/${NIX_PATH:+:}$NIX_PATH;

nix-shell '<home-manager>' -A install;

# chezmoi is installed but not yet configured, so let's run it
. $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh";

echo "Setting up Chezmoi from branch '$branch'";
chezmoi init --apply auser --branch $branch;

home-manager switch;

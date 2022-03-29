#!/bin/bash -i

branch=${environment:-main}
distro=${distro:-ubuntu}

while [ $# -gt 0]; do
  if [[ $1 == *"--"* ]]; then
    param="${1/--/}"
    declare $param="$2"
  fi

  shift
done

gitUrl="https://github.com/auser/dotfiles.git#$branch";

dockerTag="dotfiles-$distro";
dockerFile="dockerfiles/$distro/Dockerfile";

docker build -t $dockerTag $gitUrl -f $dockerFile --build-arg branch=$branch;
docker run -e TERM -e COLORTERM -it --rm $dockerTag;

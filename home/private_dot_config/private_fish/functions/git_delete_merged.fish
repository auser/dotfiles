function git_delete_merged --description='Deletes merged branches'
  git branch --merged | grep -v '\*' | xargs -n 1 git branch -d
end
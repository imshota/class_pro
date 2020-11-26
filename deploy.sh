#!/bin/sh -ex
target_branch="ghp-deploy"
git config --global user.name "CircleCI deploy"
git config --global user.email "<>"
git checkout $target_branch
git reset --hard origin/main

gcc -o deploy_test.out func.c
echo "output of deploy_test.out: $(./deploy_test.out)" > deploy_test.txt

git add deploy_test.out deploy_test.txt
git commit -m "[skip ci] updates GitGub Pages"
if [ $? -ne 0 ]; then
  echo "nothing to commit"
  exit 0
fi
git remote set-url origin "class@github.com:imshota/class_pro.git"
git push -f origin $target_branch

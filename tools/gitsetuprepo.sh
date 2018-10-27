#!/bin/bash
# run this only the first time within local master branch
# this is inspired by https://www.braintreepayments.com/blog/our-git-workflow/

echo "configuring git repository ..."

repo_version=v0.0.2
repo_release=v0.1_release

# renaming origin to github
git remote rename origin github 

# doing some checking before commit
git log
git status

vim VERSION
vim CHANGELOG
vim README.rst

git add -i

echo release : $repo_release
echo version : $repo_version

read -p "Continue committing to master ... ? " -n 1 -r

git commit -a   #m "LARA app basic config files added"
git tag -a $repo_version -m \"$repo_version\"

# generatate github_master branch
git checkout -b github_master

git checkout master

# generatate first release branch from master
git checkout -b $repo_release

# merging v0.1_release into github_master (squashing all single commits to one single)
git checkout github_master
git merge --squash $repo_release

git commit -am $repo_version
git tag $repo_version -m \"$repo_version\"

# pushing github_master (=current HEAD ) to master (master) on github
# git push --tags destination source_branch:target_branch
git push --tags github HEAD:master

# merging github_master back to release
git checkout $repo_release
git merge github_master

# also pushing everything to release
git push -u --tags github HEAD:$repo_release

# coming back to master
git checkout master
git merge $repo_release

# show, where I am
git branch

# Branching Plan

We will be following a very common branching scheme, as illustrated below. This is to help keep major changes isolated from other changes. The main idea is, there will be a working branch. This will be where _non_ feature changes are made. Then for every major feature we will make a new branch for it, and merge it when we feel it's ready. Please find some time and read through [this document](http://git-scm.com/book/en/Git-Branching-What-a-Branch-Is)

![](http://nvie.com/img/2009/12/Screen-shot-2009-12-24-at-11.32.03.png)

# Branches

## develop

  git checkout develop

this is where we will fix bugs in previous features, add code that is not really a feature.

## feature branches

  git checkout develop
  git checkout -b somefeature

This will be where major features are developed. __Only branch new features off of develop__. Once your in a feature branch you will only be working off the code that was in develop at the time of the branch. Even if develop is updated.

# Useful Git Stuff

To avoid committing the wrong things to the wrong place this is good practice todo before every commit.

  git branch
    *the_right_branch
    other_branches

  git status
    **to verify what files to add**

  git add **all_the_files_you_changed**

  git commit -m "some message"

If you want to update the code in one of your branches to the version that is on Github do:

  git pull origin branch_name


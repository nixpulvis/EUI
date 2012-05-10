# Branching Plan

We will be following a very common branching scheme, as illustrated below. This is to help keep major changes isolated from other changes. The main idea is, there will be a working branch. This will be where _non_ feature changes are made. Then for every major feature we will make a new branch for it, and merge it when we feel it's ready.

![](http://nvie.com/img/2009/12/Screen-shot-2009-12-24-at-11.32.03.png)

# Branches

## develop

Changes for this branch would be things like fixes for unreleased bugs, small style changes, efficiency and documentation additions.

To commit to this branch first make sure your in this branch. 

	git checkout develop

Then to push the commits to github
	
	git push origin develop
	
## features branches

Lets say I want to add a new feature, the minimap for example. First thing I would do before getting started coding would be to make a new branch for this feature.

	git checkout -b minimap
	git commit -m "working on minimap's buttons"
	git push origin minimap
	
To switch back to develop just type `git checkout develop` and make the changes there you need to make. 

## release

This is where code goes when we are done developing it. It needs to be tested and bugs need fixing, but there are no major features we are going to add before this version is released.

	git checkout release

## master

This will be the working branch. Where people can download and use EUI. Changes made here are reserved for new versions that are ready to be released and post release bug fixes.

	git checkout master
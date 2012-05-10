# Branching Plan

We will be following a very common branching scheme, as illustrated below. This is to help keep major changes isolated from other changes. The main idea is, there will be a working branch. This will be where _non_ feature changes are made. Then for every major feature we will make a new branch for it, and merge it when we feel it's ready.

![](http://nvie.com/img/2009/12/Screen-shot-2009-12-24-at-11.32.03.png)

The one difference we will be doing from this image, is that we will not be separating release and master. This is just to make life easy. Because users generally don't download from git source anyway.
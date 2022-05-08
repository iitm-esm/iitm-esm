## Guide

The Central Repository of IITM-ESM on github is https://github.com/iitm-esm/iitm-esm.git. main branch represents the official project history. Instead of committing directly on their local main branch, developers create a new branch every time they start work on a new feature.
Feature branches can (and should) be pushed to the central repository. This makes it possible to share a feature with other developers without touching any official code. The following is a walk-through of the life-cycle of a feature branch.
All feature branches are created off the latest code state of a project. If already cloned once and want to start working on a new feature in the same directory: git checkout main git fetch origin git reset --hard origin/main
Description: This switches the repo to the main branch, pulls the latest commits and resets the repo's local copy of main to match the latest version.

However, if starting afresh in a new directory, clone the main repository in your local machine or HPC: git clone git@github.com:iitm-esm/iitm-esm.git

2.Use a separate branch for each feature or issue you work on. A branch should be created and checked out locally (so that any changes you make will be on that branch). This can be done using:

git checkout -b new-feature

Description: This checks out a branch called new-feature based on main, and the -b flag tells Git to create the branch if it doesn’t already exist.

Note: Feature branches should follow the format: alias/new-feature. Lets say, Aditi wants to work on a new feature which is related to land ice coupling. She would give the following command to the terminal:

git checkout -b aditi/land_ice_coupling

Feature branches should have descriptive names, like land_ice_coupling or issue-#1061. The idea is to give a clear, highly-focused purpose to each branch.

On this branch, edit, stage, and commit changes in the usual fashion, building up the feature with as many commits as necessary.
git status git add <some-file> git commit

The developer can then push the commits to the central repository. This serves as a convenient backup when collaborating with other developers.
git push -u origin new-feature

Description: This command pushes new-feature to the central repository on github, and the -u flag adds it as a remote-tracking branch. After setting up the tracking branch.

Once a feature is complete and tested thoroughly, you don’t immediately merge it into main. Instead, you push the feature branch to the central repository and file a pull request asking to merge your additions into main. The other developers (gatekeepers) then review the changes before they become a part of the main codebase. You can think of pull requests as a discussion dedicated to a particular branch. This pull request can be placed from github.com/iitm-esm/iitm-esm.git.
Note: The above specifications follow a git feature branch workflow. For a general understanding of the idea, refer to git feature workflow.

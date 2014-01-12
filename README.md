# git housekeeping

I made this script to make sure that my code is all under version control and pushed somewhere. When you have 200 project folders it becomes hard to do manually.

## Usage

    cd ~/projects && ruby git-housekeeping.rb

## Results

For every subdirectory of the current directory, it will print out one of:

* *Not a Git repo* - the project has no Git version control at all. Danger danger!
* *Never committed* - you initialized a repo, but there's not a single commit in it. Just as bad as the previous one.
* *No remote* - the repo is an orphan. Better push it somewhere to be safe.
* *Unstaged changes* and *Uncommitted changes* - you made changes to the repo, but didn't create a commit. That's a bad habit. Commit early and often.
* *Unpushed changes* - some commits in some branches are not pushed to any remote. This could be what you want in the short-term, but just as likely you forgot about the poor souls.
* *OK* - none of the described problems found.


* * *

Have a clean projects folder!



---
description: Haiku projects, including imported assets, are backed by version control using git.  Every change made is tracked atomically as individual commits. When publishing, Animator tags commits and pushes to our infrastructure.
---

# Advanced:  Version Control

Animator projects, including imported assets, are backed by version control using git.

Every change made is tracked atomically as an individual commit. When publishing a project, Animator tags a commit with a version number and pushes it to our infrastructure.

If you’re new to git, [this blog post](http://blog.teamtreehouse.com/git-for-designers-part-1) is a good starting point.

### FAQ's {#faq}

**What's happening behind the scenes?**

When you create a new project, Animator takes care of all the hard work of setting up a git repository on your local machine and remotely on our infrastructure. In Animator, whenever you make a change to your project or an asset, its tracked as a commit locally. Each time a project is published, its version number is incremented. Every publish attaches your version number as a tag in git, and pushes the commit to your remote repository.

<br>

**What’s the best way to restore a previous project state?**

1. With your project open, click on `Developer -> Open Terminal`.

2. Enter `git log --pretty=oneline` to list all previous commits. Use the `⬆` and `⬇` keys to scroll.

3. Copy the commit hash in the left column to your clipboard, and then press  `q` to exit the git log terminal state.

4. Enter `git reset --hard yourcommithash` pasting your commit hash from your clipboard

5. Return to Animator and continue working!

<br>

**What are Animator's future plans related to version control?**

Git provides a powerful, flexible technical foundation for version control. In the future, we plan on improving the quality of commit messages, and expose many of gits features visually to aid team collaboration between technical and non-technical users.

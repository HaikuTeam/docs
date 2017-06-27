# Using the Haiku CLI

<br>

#### OVERVIEW

The Haiku CLI is the "Swiss army knife" for developers using Haiku.  You can use it to import a Haiku into an existing codebase (essentially `npm install`,) or you can use the CLI to directly clone a Haiku project to your computer, to access and edit the code manually (essentially, `git clone`.)


#### INSTALLATION

To install, run the following command in your terminal:

`curl http://code.haiku.ai/scripts/cli/installer.js | node`

> _Coming soon:_  you will soon be able to install the CLI directly from npm, with `npm install -g @haiku/cli`\)


#### USAGE

```
Usage:
  haiku <command> [flags]

Commands:
  clone <project_name> - Clone a Haiku project to your filesystem, passing through to git clone
  delete - Delete a Haiku project by name (interactive)
  diff-tail - See a live stream of code diffs that are being written by Haiku
  list - List your team's Haiku projects
  login - Log in to Haiku (interactive)
  logout - Log out of Haiku
  install <project_name> - Install a Haiku project as an npm module, requires a package.json in current directory
  update - Updates all Haiku-installed packages, passing through to npm update
  help - Display this message
```
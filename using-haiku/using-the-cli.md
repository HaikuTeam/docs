# Using the Haiku CLI

#### OVERVIEW

The Haiku CLI is the "Swiss army knife" for developers using Haiku.  You can use it to import a Haiku into an existing codebase (essentially `npm install`,) or you can use the CLI to directly clone a Haiku project to your computer, to access and edit the code manually (essentially, `git clone`.)


#### INSTALLATION

To install, run the following command in your terminal:

**With npm:** (and instructions to [install npm](https://www.npmjs.com/get-npm) itself)

`npm install -g @haiku/cli`

**With yarn:** (and instructions to [install yarn](https://yarnpkg.com/lang/en/docs/install/) itself)

`yarn global add @haiku/cli`


#### USAGE

```
NAME:
    haiku - The Haiku CLI — developer utilities for automating Haiku actions and performing local and server-enabled actions without requiring the desktop app.

USAGE:
    haiku [global options] command [command options] [arguments...]

VERSION:
    2.x.x

COMMANDS:
    list               Lists your team projects
    change-password    Changes your Haiku account password (interactive)
    clone              Clone a Haiku project to your filesystem, passing through to git clone
    delete             Deletes a Haiku project for your entire team.  Cannot be undone.
    install            Install a Haiku project as an npm module, requires a package.json
    login              Logs into Haiku services.  (interactive)
    logout             Logs out of Haiku services.
    update,upgrade     Updates dependencies
```

<br>

[Next: Haiku Core Developer API](/embedding-and-using-haiku/haiku-core-api.md) &rarr;

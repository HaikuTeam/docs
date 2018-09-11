---
description: Learn about publishing and embedding your Haiku. The first step to getting your Haiku out into the world is to publish it. Simply press Publish and your up-to-the-moment work will be shuttled out to the cloud and packaged up for use in any codebase.
---

# Publishing and Embedding


#### PUBLISH BUTTON {#button}

The first step to getting your Haiku out into the world is to _publish_ it.

You'll find a button on the top-right of project editor that does just that.

![](/assets/publish-button.jpg)

Simply press PUBLISH and your up-to-the-moment work will be shuttled out to the cloud and packaged up for use in any codebase.  Depending on the project settings configured when creating the project, you'll be given a private or a public link.

[Read more about Project Settings](../using-haiku/starting-haiku.md#public--private-projects)

<br>

#### PUBLISH AND EMBED OPTIONS {#options}

![](/assets/publish-options.jpg)

The shareable link will take you to your Haiku's Share Page: see below.

Here you can also explore embed options for your Haiku, which are also mirrored on your Share page.

> _Note on publish speed_: Depending on your connection speed and place in the world, publishing can currently take a little while, between 5 seconds and 2 minutes.  We're working on making this faster.  Once when we have realtime collaboration hooked up, publishing should be seamless and nearly immediate.

<br>

#### SHARE PAGE {#share}

![](/assets/share-page.png)


The Share Page is your entry point for sharing Haiku.  You can see and interact with your Haiku, share the link and explore embed options.


#### HOW TO USE {#howtouse}

The key to the Share Page is the "Get the Code" button on the bottom-right.  If you click that button, the bottom panel expands and explains exactly how to use your Haiku in a number of different codebases, including vanilla HTML (embed,) vanilla JS, React, Vue, and more.

![](/assets/share-page-get-the-code.png)


#### EMBED IN ANY WEBPAGE OR WEB APP {#embed}

**HTML Embed**

From the Share Page "How to Use" menu, select the HTML Embed option, then copy and paste the snippet anywhere you'd like.  Here's an example of an HTML embed in CodePen: [https://codepen.io/anon/pen/EXQZEb](https://codepen.io/anon/pen/EXQZEb)


**React Component**

From the Share Page "How to Use" menu, select the React option, then **follow the instructions to install the CLI** (More info here:  [Using the Haiku CLI](../using-haiku/using-the-cli.md))

Then from the command line, inside your React project, run `haiku install YourProjectName`.  Behind the scenes, this simply runs `npm install`, and sets up your environment to pull that component from the correct server.

> _Important_: the `haiku install` command will create or modify a file called `.npmrc` in your project.  It's important that you check this into your version control, otherwise other teammates will not be able to install your Haiku components.

<br>

#### FORKING {#forking}

![](/assets/forking.gif)

Forks are a unique copy of a project, which can be freely experimented on without affecting the original project. Forks can be a fun and interesting way to build upon other people's work, using their project as a starting point for your own idea.

With Haiku for Mac installed, public projects can be forked by selecting **Fork this component** on their share page. Private projects cannot be forked.

[Read more about Public & Private projects](../using-haiku/starting-haiku.md#public--private-projects)

> _Note_: Projects containing source design assets are included with projects when forked. Sketch & SVG files are bundled with Haiku projects, and Figma project URL’s are viewable but not editable (unless specified otherwise in Figma).

<br>


#### ACCESSING THE RAW CODE {#rawcode}

**`~/.haiku` Folder**

When you open any project with Haiku on your desktop, the project files are copied to your filesystem at this location:  `~/.haiku/projects/YOUR_ORG/YOUR_PROJECT`

**`haiku clone`**

You can also clone down a project directly to any location of your choosing.  You can do this with the `haiku clone YourProject` command, which uses `git clone` behind the scenes.  First, you need to install the Haiku CLI, see:  [Using the Haiku CLI](../using-haiku/using-the-cli.md)

<br>

[Next: Progress Bar Tutorial](/embedding-and-using-haiku/progress-bar-tutorial.md) &rarr;

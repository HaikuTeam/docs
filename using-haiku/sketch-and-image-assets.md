---
description: Haiku Animator integrates with the tools you already love. Draw in Sketch, bring to life in Animator. Let's start by covering how to get your Sketch design into Animator.
---

# Sketch and Other Image Assets

Animator doesn't _yet_ provide its own drawing tools. Though we plan to add some in the future, this was an intentional decision.  Designers told us resoundingly that they don't want _yet another drawing tool_, so we simply integrated with existing ones.  Think of it this way:  **draw in your favorite drawing tool, bring to life in Animator.**

Let's first cover how to get your Sketch design into Animator:

<br>

#### HOW TO LINK A SKETCH FILE {#linksketch}

The first step to bringing your Sketch design to life is to import it.

To do so, simply click "IMPORT" at the top of the library panel.

![](/assets/import-sketch.jpg)

Behind the scenes, we convert all your Sketch design's artboards, pages, and slices into individual assets that may be independently composed and animated on stage.

To get an asset on stage, just drag and drop it!

<br>

#### DRAGGING AND DROPPING ITEMS ON STAGE {#draganddrop}

This one's self-explanatory:  to get an item from the Library to the Stage, simply drag and drop.  The new element will show up on the stage where you drop it, and a new row will show up in the Timeline representing the new element.

<br>

#### CHANGING ASSETS FROM SKETCH {#changeassets}

What if you need to make a change to the Sketch file? That's fine! We'll take care of bringing your new changes into Animator and onto any assets you've placed on the stage.

When you import a Sketch file, we automatically make a copy of that file and start tracking changes behind the scenes with Git.  _What this means is if you make changes to your original file, they won't show up by default in Animator._

**To make changes to your Sketch-linked assets, double-click the Sketch file in the library.**  Sketch will launch, and when you **Save** in Sketch, changes will automatically be tracked in Animator. Even elements already on the stage remain linked and can be updated directly from Sketch.

![](/assets/open-sketch.gif)

#### Other Image Assets {#other}

Animator also supports SVG files. If you want to work with an .svg file, just click "IMPORT" in your library as we did above for a .sketch file.

If you want to work with raster assets (JPEG, PNG, etc) the best way to currently do that is to paste your asset into a .sketch file, and mark that Sketch layer for export or as a slice.

<br>

[Next: Importing Figma Projects](/using-haiku/importing-figma-projects.md) &rarr;

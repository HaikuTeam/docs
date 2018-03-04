---
description: Learn how to use Haiku to create a small practical component and embed it a real web app.
---

# Tutorial 3: Progress Bar

Welcome to the third Haiku tutorial! Here we'll show how to use Haiku to create a small, practical component — **file upload progress bar** — and get it running in a real web app.

<p data-height="208" data-theme-id="0" data-slug-hash="MvrZyM" data-default-tab="result" data-user="Haiku" data-embed-version="2" data-pen-title="Tutorial 1" class="codepen">See the Pen <a href="https://codepen.io/Haiku/pen/MvrZyM/">Tutorial 1</a> by Haiku (<a href="https://codepen.io/Haiku">@Haiku</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>


For this tutorial, we'll imagine that you work on a team that is building a web app. The web app has a feature where users can upload a file. And your task is to design the progress bar component.

Let's get started!


### Part I: The React App

An engineer has already built the file upload system. She also set up a React app that displays the file upload progress. Although it works well, visually its look and feel could clearly be improved:

![](/assets/tutorials/tutorial-3/boring.gif)

Now you, as the designer, will make a component to show the upload progress. The upload progress value (a fraction between `0.0` and `1.0`) will drive the length of the progress bar.

> To see the code for the _unfinished_ React app, clone [the repo](https://github.com/HaikuTeam/tutorial-1) and check out the `master` branch.

<br>

### Part II: The Sketch Design

Our first step is to use our favorite design tool, [Sketch](https://www.sketchapp.com/), to draw a decent-looking progress bar component. Here's what our progress bar design elements look like once they are completed in Sketch:

![](/assets/tutorials/tutorial-3/sketch.png)

As we create the design, we use Sketch to **create slices of each element we might wish to independently animate, and give each one a unique name**. We've now got the following slices:

* ProgressContainer - The background element
* ProgressBorder - Some visual trim
* ProgressFiller - The piece that will animate as uploading occurs
* BubbleSmall, BubbleMedium, and BubbleBig - Some visual flair

We save our sliced-up Sketch file as `FileUploader.sketch` somewhere on our file system, and get ready to make it into a dynamic component!

> To take a closer look at our design, [download the Sketch source file](/assets/downloads/FileUploader.sketch).

<br>

### Part III: Composing in Haiku

Now it's time to [fire up Haiku](/using-haiku/starting-haiku.md) and start composing our animation.

First we **import our Sketch file** to make the slices available to our scene:

![](/assets/tutorials/tutorial-3/import.gif)

Now we **resize the artboard** to about the size we want it to be:

![](/assets/tutorials/tutorial-3/resize-artboard.gif)

Next we **place elements on stage** to start composing the scene:

![](/assets/tutorials/tutorial-3/instantiate.gif)

Then we **position elements** until they are lined up how we want:

![](/assets/tutorials/tutorial-3/composed.png)

> For further instruction on these techniques, see our guides on the [Stage](/using-haiku/editing-elements-on-the-stage.md) and the [Timeline](/creating-an-animation.md).

<br>

### Part IV: Animating in Haiku

Let's add some visual flair to the component! We'll place a few of our bubble slices on the stage and **animate them using the Timeline**.

![](/assets/tutorials/tutorial-3/anim.gif)

For _each of the bubble elements_, here are the steps we follow:

1. Move the ticker to frame `0`.
2. Place a bubble on stage at the desired start position.
3. Move ticker to frame `40` (or whatever frame we want the animation to end!).
4. Move the bubble to the desired end position.
5. On the Timeline, between the start and end keyframes, right-click and:
  * Choose "Make Tween"
  * Choose the desired curve, e.g. "Ease Out > Cubic"
6. Press the play button to see the animation.

> For more detail on using the Timeline to animate, see the [Timeline guide](/creating-an-animation.md).

<br>

### Part V: Dynamic Behavior in Haiku

Of course, our progress bar has to be able to respond to changes. To make our component dynamic, we _create a state value_ and then _write an expression to link that state to an element's property_.

In our case, we'll **create a state** called `uploadProgress`:

![](/assets/tutorials/tutorial-3/state-default.png)

Then we'll **write an expression** that links that state value to the `X Position` of our ProgressFiller element:

![](/assets/tutorials/tutorial-3/expr-input.png)

> The value `33.5` is the position at which we placed the filler element. `297.5` is the length of the element. Here, what we'll do is move the element to the left (outside of the scene), and then have it enter the scene as a fraction of its length as the upload progress continues.

Then we'll verify that our change works by modifying the state value, and watch the change take place on the stage:

![](/assets/tutorials/tutorial-3/state-change.gif)

> All we did here was change our `uploadProgress` state from `0.0` to `0.5`, that is, halfway complete. Since our element jumped to about halfway, we know we got our expression math right. (Also: There's a lot more to learn about expressions in our **[Expressions guide](/using-haiku/writing-expressions.md)**.)

<br>

### Part VI: Publishing with Haiku &amp; Grabbing the Share Link

We now have a nice-looking dynamic component which is ready to be added to our team's file upload React app. The next step is to _publish the component_ and grab a small snippet of code to _embed the component_ in our React app.

First we click the `Publish` button (at top right) to **publish the component**:

![](/assets/tutorials/tutorial-3/publish.gif)

Wait for several moments, and soon we'll **receive a share link**, which points to our component's _share page_, which displays our playable component and provides snippets of code for embedding:

![](/assets/tutorials/tutorial-3/share-page.gif)

Since our host app is built in React, we'll grab the React code snippet, which looks something like this:

```
import Tutorial1 from '@haiku/MyTeam-tutorial1/react'
render() {
  return (
    <div>
      <Tutorial1 haikuOptions={{loop: true}} />
    </div>
  )
}
```

<br>

### Part VII: Embedding Your Haiku

At this point, the engineer is probably getting ready for the painstaking work of converting _yet another_ static design into HTML, CSS, and JavaScript. ...But to her surprise, you say:

_"Hey engineer, please use the [Haiku CLI](/using-haiku/using-the-cli.md) to run `$ haiku install Tutorial1` in the React app project. Once that finishes up, use this code snippet to embed the component I made in Haiku!":_

```
import Tutorial1 from '@haiku/MyTeam-tutorial1/react'
<Tutorial1
  haikuOptions={{loop: true}}
  haikuStates={{uploadProgress: { value: this.state.uploadProgress }}}
  />
```

> Note: You'll need to replace `MyTeam` with your own team name!

<br>

The engineer then sets things up as instructed in the React app, and _voilá_:

![](/assets/tutorials/tutorial-3/finished.gif)

It looks pretty good... (At least, it's a start!)

> To see the code for the _finished_ React app, clone [the repo](https://github.com/HaikuTeam/tutorial-1) and check out the `finished` branch.

<br>

### Part VIII: Finishing Up

Now that your app is published and embedded, it's up to you to refine it and take it the rest of the way to be a design that you and your team can be proud of.

**If you want to make more design changes**, make them in Sketch while Haiku is running, and the changes will be merged in seamlessly. When you're ready to push them to production, just `Publish` again, and tell your engineer that a new version of the component is ready and it's time to run `$ haiku update`.

**If you want to add more programmatic behavior**, check out our [Haiku Developer API](/embedding-and-using-haiku/haiku-core-api.md) which an engineer can use to add complex business logic to any component.

<br>

### In Closing

There's a lot more you can do with Haiku — this is just an introductory tutorial to give you the sense of the kind of things you can create. If you have questions or suggestions about other lessons/tutorials we could add, please [contact us](mailto:contact@haiku.ai).

<br>

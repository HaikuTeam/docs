---
description: Use Actions to execute small snippets of JavaScript throughout your project. Actions are designed to be accessible to people who only know a little code, or who want to learn—as well as to engineers.
---

# Actions

Use Actions to execute small snippets of JavaScript throughout your project. Actions are designed to be accessible to people who only know a little code, or who want to learn—as well as to engineers.

You can use Actions to:

* Travel through time by changing the timeline position
* Respond to user input
* Work with real data
* Change properties of elements
* And more!

If you haven't already, check out [Tutorial 2: Interactivity with Actions](https://medium.com/haiku-blog/designing-the-real-thing-with-haiku-actions-a80ccddfcb1) to see Actions in action.

<br>

#### FRAME ACTIONS

![](/assets/insert-frame-action.gif)

Frame Actions are triggered every time a frame is crossed. To add a Frame Action, hover above the frame you wish to insert an Action to and click the `(+)` button.

<br>

#### EVENT ACTIONS

![](/assets/insert-event-action.gif)

To add an Event Action, `Right click` (or select the settings button next to) an element on the stage and select **Edit Element Actions**.

#### ACTIONS API

Inside an action, the `this`-binding of the listener function's scope is an instance of your component, which is represented as a `HaikuComponent`. You can read more about this in the [Haiku Core section](/embedding-and-using-haiku/haiku-core-api.md). Here is a quick example:

```
// click action
function (target, event) {
  var starX = this.querySelector('Star').getPositionX();
  if (starX > 100) {
    this.setState({
      opacity: this.state.opacity - 0.1;
    });
  }
}
```

<br>

[Next: Just-in-time Properties](/using-haiku/just-in-time-properties.md) &rarr;

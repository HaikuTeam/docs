---
description: Everything you build with Haiku is backed by simple JavaScript code. Under the hood, your Haiku is one JavaScript file on your filesystem.
---

# Advanced:  Editing Haiku as Code

Everything you build with Haiku is backed by simple JavaScript code.

<br>

Under the hood, your Haiku is one JavaScript file on your filesystem. You can find it in the folder that contains your project's content, e.g. `~/.haiku/projects/YOUR_ORG/YOUR_PROJECT`.

The file _code/main/code.js_ (within the project folder) is the code for your Haiku. It exports a static object that you can think of as the _definition_ of your Haiku. When you embed your Haiku on a web page, the [Haiku Core](/embedding-and-using-haiku/haiku-core-api.md) transforms that definition into a dynamic UI.

<br>

#### EXAMPLE CODE {#examplecode}

Below is an example of the code for a simple interactive component, using Haiku's static definition format. This should look similar to the content you will see in your project's _code/main/code.js_ file.

```
module.exports = {
  "template": {
    "elementName": "div",
    "attributes": { "id": "box" },
    "children": []
  },

  "states": {
    "clicks": {
      "value": 0
    }
  },

  "eventHandlers": {
    "#box": {
      "onclick": {
        "handler": function () {
          this.clicks = this.clicks + 1
        }
      }
    }
  },

  "timelines": {
    "Default": {
      "#box": {
        "content": {
          "0": {
            "value": function ({ clicks }) {
              return 'Clicked ' + clicks + ' times'
            }
          }
        },
        "style.backgroundColor": {
          "0": { "value": "red" },
          "1000": { "value": "blue" }
        }
      }
    }
  }
}
```

Let's explore how this works.

<br>

#### CODE.JS — GUIDED TOUR {#codejs}

##### template

The **template** property describes the structure of your scene. Think of the template as a picture of your Haiku as a whole – including elements that may not always be visible.

```
"elementName": "div",
"attributes": { "id": "box" },
"children": []
```

Note that the _template_ is just a plain, static object. That's because adding dynamic behavior is the job of _eventHandlers_ and _timelines_, which we'll explain further below.

<br>

##### states {#states}

The **states** property describes your Haiku's internal state. States are key/descriptor pairs. The key is the name of the state, and the descriptor is an object with a `value` field. The `value` field contains the value of the state.

```
"clicks": {        // <- State name
  "value": 0,      // <- State value field specifies the state's default value
  "type": "number" // <- Optional type field specifies the state's type
```

Now let's look at how to modify this state using _eventHandlers_.

<br>

##### eventHandlers {#eventHandlers}

The **eventHandlers** object describes how you want your Haiku to respond to events such as UI events (e.g., a user's mouse click) and lifecycle events (e.g., the component's instantiation).

```
"#box": {                           // <- CSS selector determines which elements in the template to match
  "onclick": {                      // <- Event name
    "handler": function (event) {   // <- Handler function handles the event
      this.clicks = this.clicks + 1 // <- Handler function body makes state changes
```

As you can see, event listeners are just plain objects with a _handler_ property, which is a function. The parent object designates the name of the event to subscribe to. And the outermost object uses a CSS selector to designate which elements in the _template_ to listen to.

Within the context of a handler function, `this` is bound to your component's instance. By mutating properties that match the names of your declared _states_ (e.g. `this.clicks = 2`), you change their state values. When those state values change, the Haiku Core knows it must re-render your Haiku.

<br>

##### timelines {#timelines}

The **timelines** object is where _states_, _eventHandlers_, and _template_ come together to create a dynamic UI. The Haiku Core processes your timeline definitions and applies their _outputs_ to the appropriate elements in your scene.

You can create as many timelines as you want, but there must always be a `"Default"` timeline:

```
"Default": {              // <- Timeline name
  "#box": {               // <- CSS selector determines which elements receive these behaviors
    "position.x": {       // <- Output name
      "0": {              // <- Keyframe (0ms) determines the start time of transition
        "value": 0,       // <- Keyframe value specifies the value of the "content" output at 0ms
        "curve": "linear" // <- Keyframe curve (optional) specifies the transition style
      },
      "1000": {           // <- Keyframe (1000ms) determines end time of the transition
        "value": 123      // <- Keyframe value specifies the value of the "content" output at 1000ms
```

A _timeline_'s purpose is to answer the question "What should the elements on stage look like right now?" During each frame of playback, the core queries your timeline object and assembles a set of _outputs_ to apply to the elements in your template.

In the snippet above, a `"position.x"` output is applied to some element whose id is `"box"`. At 0ms, the element's position.x will be `0`. At 1000ms, it will be `123`. As the clock advances from 0ms to 1000ms, the value of position.x gets smoothly transitioned from `0` to `123`, using a `"linear"` curve.

The `"value"` of an output can be any value that serializes to JSON (strings, numbers, `null`...). But the `"value"` can also be a function, giving you a powerful way to create dynamic behavior in your component.

<br>

**Using _expressions_ to create dynamic behavior**

When the timeline's output `"value"` is a function, we call it an _expression_. Here is an example of what an _expression_ would look like in your code:

```
"timelines": {
  "Default": {
    "#box": {
      "position.x": {
        "1000": {
          "value": function () {
            return Math.sin(Math.PI)
          }
```

<br>

Expressions are essentially just JavaScript functions. The return value of the expression becomes the output value of the property it belongs to.

<br>

_Expressions are one of the most powerful features in Haiku_, and we'll only scratch the surface in this section. For much more about expressions (including how to write expressions based on dynamic data), head over to the **[guide on expressions](./using-haiku/writing-expressions.md)**.

<br>

#### FAQ {#faq}

- **How do I edit my project's code?:** Just fire up a text editor and make a change to the _code/main/code.js_ file. If the Haiku app is running, your changes should appear instantly on stage.

- **Could the code.js format be nicer?** Yes. We plan to improve this in the near future. We welcome ideas for ways that it could be more concise to write and more clear to read.

- **Why not use an HTML string or JSX or [etc] for the template?:** We plan to support a more readable template format in the near future. For that reason, our template object format is intentionally kept quite similar to the format of compiled JSX.

<br>

[Next: Version Control](/using-haiku/advanced-version-control.md) &rarr;

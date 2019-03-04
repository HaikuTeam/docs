---
description: Values you summon into expressions are called summonables. Built-in summonables are commonly-used piece of data that Animator tracks and updates such as current mouse position or the dimensions of the viewport.
---

# Summonables

As you may know from our sections on [expressions](/using-haiku/writing-expressions.md) and [editing Animator projects as code](/using-haiku/advanced-editing-haiku-as-code.md), expression functions can summon _states_ that your component has defined.

In general, we call any value you summon into an expression a **_summonable_**.

In addition to its states, expressions can also summon _built-in variable values_. Built-in summonables are commonly-used pieces of data that the Haiku core automatically tracks and updates for your convenience.

They represent things such as the user's current mouse position or the dimensions of the viewport.  When writing an expression, any of them can be summoned by name.

<br>

#### SUMMONING BUILT-IN SUMMONABLES {#builtin}

Built-in summonables can be summoned in the same way as states. Just include them by **typing their names** in your expression function's signature. For example, if you want to access the injectable called `$user.mouse.x` (i.e., the x-position of the user's mouse), your expression would look like this:

```
function ($user) {
  return $user.mouse.x
}
```

If you are typing an expression inside the Animator app, this function signature will be created for you automatically. All you need to do is type `$user.mouse.x` like so:

![](/assets/expression-single-line-usermousex.png)

To see what is happening under the hood, use `Shift + Enter` to toggle multi-line mode, and watch the expression signature change as you type:

![](/assets/expression-multi-line-usermousex.png)

<br>

#### LIST OF BUILT-IN SUMMONABLES {#list}

The following is a list of built-in summonables available to you within expressions. Each is shown here along with a brief annotation about its purpose.

> Note: All of these properties are intended to be **read-only**; you'll get unpredictable results if you try to modify them.

* **$window (Object) - A reference to the [window](https://developer.mozilla.org/en-US/docs/Web/API/Window)** object

* **$core (Object) - Collection of data about the current state of the [Haiku Core](/embedding-and-using-haiku/haiku-core-overview.md)**
  * options (Object) - The current option configuration of the core
    * seed (String) - Seed used for producing predictable randomness, etc.
    * loop (Boolean) - Whether or not the core is configured to loop the animation
    * sizing (String) - The sizing mode of the component (`"cover"` or `"contain"`)
    * preserve3d (String)
    * position (String)
    * overflowX (String)
    * overflowY (String)
  * timeline (Object) - Collection of data representing the currently active timeline
    * name (String) - Name of the timeline (e.g. `"Default"`)
    * duration (Function) - The total duration (in milliseconds) of this timeline
    * repeat (Boolean) - Whether this timeline is configured to repeat, i.e. loop
    * time (Number) - The total actual elapsed time (in milliseconds), regardless of the `max`
    * frame (Number) - The total number of frames that would have elapsed since this timeline started playing
  * clock (Object) - Collection of data about the core's global clock
    * frameDuration (Number) - How much "apparent time" each frame represents (usually 16.666 milliseconds)
    * frameDelay (Number) - How long the core waits between frame renders (usually 16.666 milliseconds)
    * time (Number) - The total time that has elapsed since the clock started ticking
* **$element (Object) - Collection of data about the currently targeted element**
  * offset (Object) - Specification of the element's placement within the parent, offset from its natural placement (0,0)
    * x (Number) - % offset in the x-dimension, e.g. `0.5`
    * y (Number) - % offset in the y-dimension, e.g. `0.5`
    * z (Number) - % offset in the z-dimension, e.g. `0.5`
  * attributes (Object) - The element's attributes as an object
  * tagName (String) - The name of the element, e.g. `"path"`
  * matrix (Array) - Array representing the computed 16-element transform matrix
  * opacity (Number) - The opacity value of the element (must be on the range `0..1`)
  * origin (Object) - The point about which transforms are applied
    * x (Number) - % of the element's x-dimension, e.g. `0.5`
    * y (Number) - % of the element's y-dimension, e.g. `0.5`
    * z (Number) - % of the element's z-dimension, e.g. `0.5`
  * rotation (Object) - Specification of the element's rotation in space
    * x (Number) - The x-rotation, in radians
    * y (Number) - The y-rotation, in radians
    * z (Number) - The z-rotation, in radians
  * scale (Object) - Specification of the element's scale in space
    * x (Number) - The x-scale as a percentage of the original size, e.g. `1.0`
    * y (Number) - The y-scale as a percentage of the original size, e.g. `1.0`
    * z (Number) - The z-scale as a percentage of the original size, e.g. `1.0`
  * shown (Boolean) - Whether the element is shown (visible) or not (invisible)
  * size (Object) - The computed pixel dimensions of the element (note: does not account for its own transform)
    * x (Number)
    * y (Number)
  * sizeAbsolute (Object) - For any dimension sized absolutely, fields of this object determine the size
    * x (Number) - Pixel size of the x-domension
    * y (Number) - Pixel size of the y-domension
    * z (Number) - Pixel size of the z-domension
  * sizeProportional (Object) - For any dimension sized proportionally, fields of this object determine the size
    * x (Number) - % of the parent's x-dimension, e.g. `0.55`
    * y (Number) - % of the parent's y-dimension, e.g. `0.55`
    * z (Number) - % of the parent's z-dimension, e.g. `0.55`
  * translation (Object) - Specification of the element's translation, i.e. position offset from origin point
    * x (Number) - Pixel offset of the x-dimension
    * y (Number) - Pixel offset of the y-dimension
    * z (Number) - Pixel offset of the z-dimension
* **$tree (Object) - Collection of data about the component's render tree**
  * parent (Object) - The parent element of the targeted element. See the `$element` schema.
  * children (Array) - Array of the targeted element's child elements (if any). See the `$element` schema.
  * component (Object) - The element representing the top element of the component's render tree. See the `$element` schema.
  * root (Object) - The element representing the root element of the Haiku Core's top-level context. Usually the same as "component". See the $element schema.
  * element (Object) - The currently targeted element. See the `$element` schema.
* **$user (Object) - Collection of data about the user's current interaction state**
  * mouse (Object) - Data about the current mouse state
    * x (Number) - The x-position in pixels of the mouse, with respect to the Haiku Core context
    * y (Number) - The y-position in pixels of the mouse, with respect to the Haiku Core context
    * down (Boolean) - Whether any of the mouse buttons are down
    * buttons (Array) - Array of currently pressed mouse buttons (e.g. `[1,0,0]` if only the primary button is down)
  * keys (Object) - Dictionary mapping key codes to each key's currently active presses (e.g. `{"72": 1, "65": 0}` means `h` is pressed but `a` is not)
  * touches (Array) - List of currently active touchscreen touches
    * [array element]
      * x (Number) - The x-position in pixels of the touch, with respect to the Haiku Core context
      * y (Number) - The y-position in pixels of the touch, with respect to the Haiku Core context
  * mouches (Array) - For convenience, a combination of currently active touches and mouse presses _(mouse only included when the mouse is down)_
    * [array element]
      * x (Number) - The x-position in pixels of the touch/mouse, with respect to the Haiku Core context
      * y (Number) - The y-position in pixels of the touch/mouse, with respect to the Haiku Core context
* **$helpers (Object) - Collection of helper functions**
  * now (Function) - Returns the current _apparent_ time with respect to the core clock starting time, accounting for pauses, seeks, rewinds, etc.
  * rand (Function) - Returns a pseudo-random number in the range [0,1] generated from the `seed` specified in the `options`
  * find (Function) - Given a CSS selector, finds all `HaikuElement` instances matching that selector in your component tree. Useful when you want to bind an expression value to a value carried by some element in your component.

> Note: The above list is incomplete and simplified. Also, we plan to provide many additional built-in summonables for convenience in the future.

> The root names of these built-in summonables are prefixed with a dollar sign (`$`) to differentiate them from your internal states, and to make sure your Animator's private namespace stays clean.

<br>

[Next: Actions](/using-haiku/actions.md) &rarr;

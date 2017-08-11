# Summonables

As you may know from our sections on [expressions](using-haiku/writing-expressions.md) and [editing Haiku as code](using/haiku/advanced-editing-haiku-as-code), expression functions can summon _states_ that your component has defined.

In general, we call any value you summon into an expression a **_summonable_**.

In addition to its states, expressions can also summon _built-in variable values_. Built-in summonables are commonly-used pieces of data that the Haiku player automatically tracks and updates for your convenience.

They represent things such as the user's current mouse position or the dimensions of the viewport.  When writing an expression, any of them can be summoned by name.

<br>

#### SUMMONING BUILT-IN SUMMONABLES

Built-in summonables can be summoned in the same way as states. Just include them by **typing their names** in your expression function's signature. For example, if you want to access the injectable called `$user.mouse.x` (i.e., the x-position of the user's mouse), your expression would look like this:

```
function ({ $user, $user: { mouse: { x }}}) {
  return $user.mouse.x
}
```

If you are typing an expression inside the Haiku app, this function signature will be created for you automatically. All you need to do is type `$user.mouse.x` like so:

![](/assets/expression-single-line-usermousex.png)

To see what is happening under the hood, use `Shift + Enter` to toggle multi-line mode, and watch the expression signature change as you type:

![](/assets/expression-multi-line-usermousex.png)

<br>

#### LIST OF BUILT-IN SUMMONABLES

The following is a list of built-in summonables available to you within expressions. Each is shown here along with a brief annotation about its purpose.

> Note: All of these properties are intended to be **read-only**; you'll get unpredictable results if you try to modify them.

* **$window (Object) - Collection of data from the [window](https://developer.mozilla.org/en-US/docs/Web/API/Window)**
  * width (Number) - The width of the window in screen pixels
  * height (Number) - The width of the window in screen pixels
  * orientation (Object) - Collection of data about the [window.screen.orientation](https://developer.mozilla.org/en-US/docs/Web/API/Screen/orientation)
    * angle (Number) - The angle of the screen in degrees
    * type (String) - The orientation type, e.g. `"landscape-primary"`
  * availHeight (Number)
  * availLeft (Number)
  * availWidth (Number)
  * colorDepth (Number)
  * pixelDepth (Number)
  * navigator (Object) - Collection of data from [window.navigator](https://developer.mozilla.org/en-US/docs/Web/API/Navigator)
    * userAgent (String)
    * appCodeName (String)
    * appName (String)
    * appVersion (String)
    * cookieEnabled (Boolean)
    * doNotTrack (Boolean)
    * language (String)
    * maxTouchPoints (Number)
    * onLine (Boolean)
    * platform (String)
    * product (String)
    * vendor (String)
  * document (Object) - Collection of data from [window.document](https://developer.mozilla.org/en-US/docs/Web/API/Document)
    * charset (String)
    * compatMode (String)
    * contentType (String)
    * cookie (String)
    * documentURI (String)
    * fullscreen (Boolean)
    * readyState (Number)
    * referrer (String)
    title (String)
  * location (Object) - Collection of data from [window.location](https://developer.mozilla.org/en-US/docs/Web/API/Location)
    * hash (String)
    * host (String)
    * hostname (String)
    * href (String)
    * pathname (String)
    * protocol (String)
    * search (String)
* **$player (Object) - Collection of data about the current state of the [Haiku Player](./embedding-and-using-haiku/haiku-player-overview.md)**
  * version (String) - The current version of the player
  * options (Object) - The current option configuration of the player
    * seed (String) - Seed used for producing predictable randomness, etc.
    * loop (Boolean) - Whether or not the player is configured to loop the animation
    * sizing (String) - The sizing mode of the component (`"cover"` or `"contain"`)
    * preserve3d (Boolean)
    * position (String)
    * overflowX (String)
    * overflowY (String)
  * timeline (Object) - Collection of data representing the currently active timeline
    * name (String) - Name of the timeline (e.g. `"Default"`)
    * duration (Number) - The total duration (in milliseconds) of this timeline
    * repeat (Boolean) - Whether this timeline is configured to repeat, i.e. loop
    * time (Object) - Collection of data about the timeline's current time
      * apparent (Number) - The time (in milliseconds) _up to_ this timeline's `max`
      * elapsed (Number) - The total actual elapsed time (in milliseconds), regardless of the `max`
      * max (Number) - The maximum time (in milliseconds) that this timeline can reach
    * frame (Object) - Collection of data about the timeline's current frame
      * apparent (Number) - The frame the component is currently rendering (e.g. if paused at frame `2`, the value will be `2`)
      * elapsed (Number) - The total number of frames that would have elapsed since this timeline started playing
  * clock (Object) - Collection of data about the player's global clock
    * frameDuration (Number) - How much "apparent time" each frame represents (usually 16.666 milliseconds)
    * frameDelay (Number) - How long the player waits between frame renders (usually 16.666 milliseconds)
    * time (Object) - Collection of data about the player's global clock time
      * apparent (Number) - The current time at which the context is currently rendering
      * elapsed (Number) - The total time that has elapsed since the clock started ticking
* **$element (Object) - Collection of data about the currently targeted element**
  * properties (Object) - Collection of data about properties of the element
    * align (Object) - Specification of the element's placement within the parent, offset from its natural placement (0,0)
      * x (Number) - % offset in the x-dimension, e.g. `0.5`
      * y (Number) - % offset in the y-dimension, e.g. `0.5`
      * z (Number) - % offset in the z-dimension, e.g. `0.5`
    * attributes (Object) - The element's attributes as an object
    * elementName (String) - The name of the element, e.g. `"path"`
    * matrix (Array) - Array representing the computed 16-element transform matrix
    * mount (Object) - Specification of the placement of the element offset from its natural placement (0,0)
      * x (Number) - % offset in the x-dimension, e.g. `0.5`
      * y (Number) - % offset in the y-dimension, e.g. `0.5`
      * z (Number) - % offset in the z-dimension, e.g. `0.5`
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
  * siblings (Array) - Array of the targeted element's sibling elements (if any). See the `$element` schema.
  * component (Object) - The element representing the top element of the component's render tree. See the `$element` schema.
  * root (Object) - The element representing the root element of the Haiku Player's top-level context. Usually the same as "component". See the $element schema.
  * element (Object) - The curently targeted element. See the `$element` schema.
* **$user (Object) - Collection of data about the user's current interaction state**
  * mouse (Object) - Data about the current mouse state
    * x (Number) - The x-position in pixels of the mouse, with respect to the Haiku Player context
    * y (Number) - The y-position in pixels of the mouse, with respect to the Haiku Player context
    * down (Boolean) - Whether any of the mouse buttons are down
    * buttons (Array) - Array of currently pressed mouse buttons (e.g. `[1,0,0]` if only the primary button is down)
  * keys (Object) - Dictionary mapping key codes to each key's currently active presses (e.g. `{"72": 1, "65": 0}` means `h` is pressed but `a` is not)
  * touches (Array) - List of currently active touchscreen touches
    * [array element]
      * x (Number) - The x-position in pixels of the touch, with respect to the Haiku Player context
      * y (Number) - The y-position in pixels of the touch, with respect to the Haiku Player context
  * mouches (Array) - For convenience, a combination of currently active touches and mouse presses _(mouse only included when the mouse is down)_
    * [array element]
      * x (Number) - The x-position in pixels of the touch/mouse, with respect to the Haiku Player context
      * y (Number) - The y-position in pixels of the touch/mouse, with respect to the Haiku Player context
* **$helpers (Object) - Collection of helper functions**
  * now (Function) - Returns the current _apparent_ time with respect to the player clock starting time, accounting for pauses, seeks, rewinds, etc.
  * rand (Function) - Returns a pseudo-random number generated from the `seed` specified in the `options`

> Note: The above list is incomplete and simplified. Also, we plan to provide many additional built-in summonables for convenience in the future.

> The root names of these built-in summonables are prefixed with a dollar sign (`$`) to differentiate them from your internal states, and to make sure your Haiku's private namespace stays clean.

<br>

[Next: Haiku Player Overview](/embedding-and-using-haiku/haiku-player-overview.md) &rarr;

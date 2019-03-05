# Haiku Core API

<br>

#### OVERVIEW {#overview}

A programmatic interface to the Haiku Core (and your published project) is available for those who need more control. With the programmatic API, you can access your project's internal content and create fine-grained behavior that responds to user and page events.

<br>

#### EMBED API {#embedapi}

The first interface to control your project is via its declarative embedding API. (Getting your embed snippet is covered in the [embedding section](/embedding-and-using-haiku/publishing-and-embedding.md).)

<br>

**Passing in/overriding embed states**

The first thing you might want to do is override the [states](/using-haiku/defining-states.md) you've defined.

For example, if you are embedding a project as a React component, you can override its internal states by passing a `haikuStates` prop. (Note: It is best to think of Animator states as a combination of React's `this.state` and `this.props`, since internally the Haiku Core treats them the same.)

```
<MyHaiku
  haikuStates={{
    clicks: { "value": 0 }  // Overrides (or sets) a state named "clicks"
  }}/>
```

<br>

**Configuring embed options**

Haiku Core's behavior can be controlled by passing in lifecycle event handlers and a `haikuOptions` prop:

```
<MyHaiku
  // onHaikuComponentWillInitialize: Function
  // Fired when the component initialization begins
  onHaikuComponentWillInitialize: null,

  // onHaikuComponentDidMount: Function
  // Fired when the component initialization finishes
  onHaikuComponentDidMount: null,

  // onHaikuComponentWillMount: Function
  // Fired when the component is about to attach to the DOM
  onHaikuComponentWillMount: null,

  // onHaikuComponentDidInitialize: Function
  // Fired immediately after the component has attached to the DOM
  onHaikuComponentDidInitialize: null,

  // onHaikuComponentWillUnmount: Function
  // Fired when the component is about to detach from the DOM
  onHaikuComponentWillUnmount: null,

  // contextMenu: String
  // Whether the Animator menu will display when the component is right-clicked;
  // value may be 'enabled' or 'disabled'
  contextMenu: 'enabled',

  // mixpanel: String|Boolean
  // If provided, the component will transmit metadata to Mixpanel;
  // specify your own token here, or set to falsy to disable tracking altogether.
  // We send only public information: your component's name, its Animator account username,
  // the software version it was built with, and its share identifier.
  mixpanel: '{mixpanel api token}',

  // seed: String
  // Random seed used for deterministic randomness
  seed: '{will be auto-generated if not supplied}',

  // automount: Boolean
  // Whether we should mount the given context to the mount element automatically
  automount: true,

  // autoplay: Boolean
  // Whether to start playing the animation immediately
  autoplay: true,

  // loop: Boolean
  // Whether to continuously loop the animation
  loop: true,

  // sizing: String
  // Configures the sizing mode of the component;
  // controls how it sizes to fill its container;
  // values may be 'normal', 'stretch', 'contain', or 'cover';
  // the behavior matches CSS' behavior
  sizing: 'normal',

  // forceFlush: Boolean
  // If true, the renderer will not cache properties nor patch updates;
  // it will fully render the component on every animation frame
  // (warning: not recommended, as this can severely deoptimize animation)
  forceFlush: false,

  // freeze: Boolean
  // Whether to prevent the global clock from updating the timelines
  // (warning: only use if you know what you're doing)
  freeze: false,

  // frame: Function
  // Optional function that we will call before every frame renders
  frame: null,

  // clock: Object
  // Configuration options that will be passed to the HaikuClock instance
  clock: {},

  // alwaysComputeSizing: Boolean
  // Whether we should always assume the size of the mount element will change on every tick;
  // This boosts performance when not using an explicit `sizing` option
  alwaysComputeSizing: true,

  // position: String
  // CSS position setting for the root of the component in DOM;
  // (warning: not recommended to change this, as it may affect layout behavior)
  position: 'relative',

  // useWebkitPrefix: Boolean
  // Whether to prepend a webkit prefix to transform properties;
  // `undefined` configures this to be auto-detected
  // (warning: not recommended to change this)
  useWebkitPrefix: undefined,

  // overflowX: String
  // CSS overflow-x setting for the component;
  // falsy specifies the default browser behavior
  // (warning: to configure both settings together, use `overflow`)
  overflowX: null,

  // overflowY: String
  // CSS overflow-x setting for the component;
  // falsy specifies the default browser behavior
  // (warning: to configure both settings together, use `overflow`)
  overflowY: null,

  // overflow: String
  // CSS overflow setting for the component;
  // falsy specifies the default browser behavior
  // (warning: this will override both `overflowX` and `overflowY` if set)
  overflow: null
/>
```
<br>

**Passing in children &amp; using "placeholders"**

You can pass child elements into your `<MyHaiku>` element to be inserted in place of elements that you have composed and orchestrated on stage. This is a great way to use Animator to animate dynamic content.

In [Animator](https://www.haikuforteams.com/), use the Timeline to add a `controlFlow.placeholder` property to any element on stage. Set the field's value to a CSS id selector, such as `#some-content`. Then, when embedding your `<MyHaiku>` in a React component, pass it a child element whose id matches that selector.

```
<MyHaiku>
  <div id="some-content">
    I will be inserted in place of the element
    where controlFlow.placeholder was set to #some-content
  </div>
</MyHaiku>
```

<br>

**Embed lifecycle hooks**

The Haiku Core also exposes lifecycle hooks for embedded components, which you can hook into in order to gain access to your component's _programmatic_ API (see below).

```
<MyHaiku
  onHaikuComponentDidMount={(component) => {
    // Access the programmatic API to your component here
  }} />
```

<br>

#### PROGRAMMATIC API {#programmaticapi}

Assuming you have a variable with an instance of your component (see above), a programmatic API is available that allows you to control the precise behavior of your component on a frame-by-frame basis.

<br>

##### HaikuBase {#haikubase}

Base class for all the core Haiku classes. Encapsulates common logic for eventing and data caching.

**.on(eventName: string, eventHandler: function): void**

Listen for an event emitted by the instance. Example:

```
// Listen to a specific event.
base.on('some:event', (...args) => {
  // Respond to event here
});
```

Please see subclasses for more detail about available events.

**.emit(eventName: string, payload: any): void**

Emit an event of a given name, dispatching to all matching listeners. Example:

```
// Emit a specific event.
base.emit('some:event', { my: 'data' });
```

##### HaikuElement {#haikuelement}

Represents a single rendered node in the component tree. Can be used to read information about the node, such as its position. The entry point to access any `HaikuElement` in your tree is your `HaikuComponent` (see below). `HaikuElement` is a subclass of `HaikuBase`.

###### PROPERTIES {#properties}

* `attributes` (object) - An object containing all HTML/SVG attribute values of the element.
* `type` (string|object) - The type of rendered element this is. In case of normal renderable elements, it is a string like `'svg'`. In case of embedded components, it is an object descriptor of the component. (If you definitely want a string, use `tagName` instead.)
* `tagName` (string) - The element's tag name, e.g. `'svg'` or `'div'`. For embedded components, it is always `'div'`.
* `title` (string) - The element's title.
* `source` (string) - The design source file from which the element was derived, if any.
* `id` (string) - The element's `id` attribute value.
* `className` (string) - The element's `class` attribute value.
* `parentNode` (object) - The simplified renderable node object used for this element. (If you want a `HaikuElement`, use `parent` instead.)
* `childNodes` (array) - Returns an array of simplified renderable node objects used for the children of this element. (If you want a collection of `HaikuElement` instances, use `children` instead.)
* `children` (array) - Returns an array of `HaikuElement` instances representing the children of this node.
* `parent` (HaikuElement) - The parent `HaikuElement` of this element, if any.
* `instance` (HaikuComponent) - If the element represents a component, it will return this object.
* `host` (HaikuComponent) - The instance of `HaikuComponent` that hosts/controls this element, which may belong to an ancestor of this element.
* `context` (HaikuContext) - The instance of `HaikuContext` that manages this element, its host component, clock, etc.
* `layout` (object) - The computed layout of the element. Includes its `rotation`, `scale`, `size`, `matrix`, etc.
* `target` (object) - Returns the live DOM node rendered by this element.

###### METHODS {#methods}

**.getComponentId(): string**

Returns the Haiku identifier of the element.

**.querySelector(selector: string): HaikuElement**

Query the subtree of this element and return the first element found that matches the given CSS selector. Example: `element.querySelector('#Slice1')`. Also, please see the section at the bottom called "CSS selection in Haiku."

**.querySelectorAll(selector: string): []<HaikuElement>**

Like `.querySelector()`, but returns the collection of all matching elements. Also, please see the section at the bottom called "CSS selection in Haiku."

##### HaikuComponent {#HaikuComponent}

Manages the behavior of your component at the top level. Subclass of `HaikuElement` (see above), representing both the root element of your component tree, and the controller for the behavior of all descendants.

###### EVENTS

* `'component:will-initialize'` - Fires before the instance constructor runs.
* `'component:did-initialize'` - Fires after the instance constructor runs.
* `'component:did-mount'` - Fires when the instance is added to the DOM.
* `'component:will-unmount'` - Fires when the instance is removed from the DOM.

You can subscribe to frame events:

* `'timeline:{name}:{frame}'` - For example, `'timeline:Default:22'` would subscribe to an event that fires any time the timeline animation triggers frame 22.

You can subscribe to any UI event:

* `'{dom event name}'` - For example, `'click'` would subscribe to an event that fires any time an element within the component is clicked. The targeted element is passed as the first argument to the handler, and the event payload itself is passed as the second. (See the [list of all available web events](https://developer.mozilla.org/en-US/docs/Web/Events).)

You can also subscribe to custom events:

* `'wow-custom-event'` - Custom elements and embedded components may emit events with custom names, outside of the default UI events triggered by browsers. To subscribe to those, just listen to the event by name.

###### PROPERTIES

* `state` (object) - An object of the state values held by this instance of your component. (These states are the same states you configure visually using the State Inspector in Animator.)
* `CORE_VERSION` (string) - The semver-based version of Haiku Core that is running this instance.
* `config` (object) - The configuration settings for this instance.

###### METHODS

**.setState(states: object): void**

> Note: As known as immediate `setState`

Similar to React's API, `.setState` updates the states defined in the instance of your component. (These states are the same states you configure visually using the State Inspector in Animator.) A state can be a `number`, `string`, `array`, `object`, or `null`. Example:

```
this.setState({
  numClicks: this.state.numClicks + 2,
  opacityVal: 0.23
});
```

Changing states cause any expressions that depend on those values to re-evaluate.


**.setState(states: object, transitionDefinition: {duration: number, curve?: string, queue?: boolean}): void**

> Note: As known as transition `setState`


In addition to immediate `setState`, user has the option to set a state transition similar to [animation transition/tween](/using-haiku/creating-an-animation.html). For example, lets queue a state transition of state `foo` to value `10`, using an exponential ease in curve in the time span of 1 second (1000 ms)


```
this.setState({foo: 10},
{
  duration: 1000,
  curve: "easeInExpo",
  queue: true
})
```

`duration` parameter means how long the transition should span. `curve` option allows user to define transition curve, defined in [Core](https://github.com/HaikuTeam/core/blob/master/src/api/index.ts#L574)  (if none is provided, `linear` is automatically set). `queue` parameter enables queue transitions to be executed, by default set to `false` if not specified.

Be careful, as of version 3.5.0, state transition works only with state being transitioned from `number` to `number`.


*How state transition queue works*

Each state has its individual state transition queue.

A transition `setState` with multiple states is processed as several transition `setState` with same `transitionDefinition` parameter. Eg.

```
this.setState({foo: 4, baz: 8}, { duration: 3000, curve: "linear" })
```
is equivalent to
```
this.setState({foo: 4}, { duration: 3000, curve: "linear" })
this.setState({baz: 8}, { duration: 3000, curve: "linear" })
```

If a immediate `setState` or a non-queued(`queue=false`) transition `setState` is called on one or more states, it will stop any running state transition and clear affected states queue.

After a queued transition `setState` is completed, if queue has any other state transition, it wil set current state value (current as of state transition completion) as state start value and will transition up to `states` parameter. Eg. Imagine user set frame 0 action the following code, and initial value of state `positionx` is 5:

```
this.setState({positionx: 10}, { duration: 1000, curve: "linear", queue: true })
this.setState({positionx: 20}, { duration: 2000, curve: "linear", queue: true })

```

Let's call first transition the one to `positionx: 10` and second the one to `positionx: 20`. The first state transition will be execution until 1000ms, then second state transition will start, using state `positionx: 10` as start value. At 3000ms timestamp, second state transition will be completed. In the below code, timestamps and value table would be



| Timestamp (ms) | positionx value | Active state transition |
| :------------- |:--------------- | :---------------------- |
| 0              | 5               | first                   |
| 500            | 7.5             | first                   |
| 1000           | 10              | second                  |
| 2000           | 15              | second                  |
| 3000           | 20              | ------                  |



**.set(key: string, value: any): void**

Set a single state value.

**.get(key: string): any**

Get a single state value. You can also equivalently use `this.state.*`.

**.getAddressableProperties(): object**

Return a schema object describing all of the public states defined by this component. Can be used to discover the expected values and types that can be passed into this component as props or via the `.setState()` API.

**.getTimeline(name: string): HaikuTimeline**

Returns the `HaikuTimeline` instance of the given name hosted by this component. See the `HaikuTimeline` API for more details.

**.getDefaultTimeline(): HaikuTimeline**

Returns the `HaikuTimeline` named `'Default'`, which is the default timeline for all HaikuComponent instances. See the `HaikuTimeline` API for more details.

**.deactivate(): void**

Permanently stop animating and performing any updates on this component. Useful if you are completely finished rendering this component and want to reduce CPU workload.

**.assignConfig(configObject: object): void**

Dynamically reconfigure your component instance. Valid fields are the same as those that may be passed to embedded React components:

```
component.assignConfig({
  seed: '{random}', // (String) - Random seed used for deterministic randomness
  autoplay: true, // (boolean) - Whether to start playing the animation immediately
  loop: true, // (boolean) - Whether to continuously loop the animation
  sizing: 'normal' // (String) - The sizing mode, either "cover" or "contain"
  states: {
    clicks: { "value": 0 }  // Overrides (or sets) a state named "clicks"
  }
})
```

**.getClock(): HaikuClock**

Returns an instance of the `HaikuClock` that manages time for this instance (see below).

<br>

##### HaikuClock {#clock}

Manages the apparent progression of time in your component's _context_, including all of its descendants. Subclass of `HaikuBase`.

###### METHODS

**.assignOptions(optionsObject: object): void**

Configure the clock's internal options settings.

```
clock.assignOptions({
  frameDuration: 16.666,  // Apparent time to elapse per frame
  frameDelay: 16.666  // How long to wait between frame renders
})
```

**.getTime(): number**

Return the current time (in milliseconds) held by this clock.

**.getFrameDuration(): number**

Return the value of the apparent duration of a single frame.

**.isRunning(): boolean**

Return whether or not the clock is currently running.

**.start(): void**

Start the clock. Warning: This will (re)start _all_ components that are managed by this clock!

**.stop(): void**

Stop the clock. Warning: This will stop _all_ components that are managed by this clock!

<br>

##### HaikuTimeline {#timeline}

An instance of a timeline, which controls animation for the properties of a specific, targeted set of elements within the host component tree. Subclass of `HaikuBase`.

###### EVENTS

* `'play'` - Fired when the timeline is played. Always preceded by `'start'`.
* `'start'` - Fired when the timeline is started.
* `'pause'` - Fired when the the timeline is paused. Always preceded by `'stop'`.
* `'stop'` - Fired when the timeline is stopped.
* `'seek'` - Fired when a timeline _seek_ occurs. Always preceded by `'start'`. The time value (`number`) is passed as the first argument to the handler.
* `'tick'` - Fired when the timeline clock is updated in preparation for rendering an animation frame. Use with care, as under normal conditions this event is fired 60 times per second. The current frame value (`number`) is passed as the first argument to the handler.

###### METHODS

**.assignOptions(optionsObject: object): void**

Assign the configuration options for this timeline instance:

```
timeline.assignOptions({
  loop: true, // Whether this timeline should keep looping its animation
})
```

**.getMaxTime(): number**

Returns the maximum time (in milliseconds) that any modification occurs from this timeline. This number is the same as the millisecond value of the max keyframe. Same as `.getDuration()`.

**.getClockTime(): number**

Returns the time of held by the clock (`HaikuClock`) that manages this timeline instance.

**.getElapsedTime(): number**

Returns how much time has elapsed since this timeline started playing, regardless of what its max time is.

**.getBoundedTime(): number**

Returns the current time (in milliseconds) since this timeline began playing, unless that number is larger than the max time, in which case, returns the max. Same as `.getTime()`.

**.getTime(): number**

Same as `.getBoundedTime()`.

**.getDuration(): number**

Same as `.getMaxTime()`.

**.getBoundedFrame(): number**

Returns the current frame number, unless that frame is larger than the max keyframe, in which case, returns the max. Same as `.getFrame()`.

**.getUnboundedFrame(): number**

Returns the current frame number as if the timeline would continue elapsing frames after its max value. Useful if you need to know what the frame _would be_ in either case.

**.getFrame(): number**

Same as `.getBoundedFrame()`.

**.isPlaying(): boolean**

Returns whether or not this timeline is currently playing.

**.isFinished(): boolean**

Returns whether or not this timeline has gone past its max frame.

**.setRepeat(doRepeat: boolean): void**

Set the looping behavior of this timeline instance. Setting `true` instructs this timeline to `loop`. This is the same as setting the `loop` option.

**.getRepeat(): boolean**

Returns whether or not this timeline is configured to loop.

**.start(): void**

Start this timeline from frame 0.

**.stop(): void**

Stop this timeline. (This pauses the timeline and resets to 0.)

**.pause(): void**

Pause this timeline at the current frame.

**.play(): void**

Play this timeline at whatever frame it is currently at. (This does _not_ reset the playhead to 0.)

**.seek(amount: number, unit: 'ms'|'fr' = 'fr'): void**

Jump to a specific frame or millisecond time. If no unit is specified in the second argument, frames are used.

Note that since common values for milliseconds and frames don't precisely line up (frame 5 is at 83.3 milliseconds), a small amount of rounding occurs when milliseconds are specified.

Also, note that this _locks playback to the specified frame_. Use `.gotoAndPlay` if you want it to continue playing from the new point.

**.gotoAndPlay(amount: number, unit: 'ms'|'fr' = 'fr'): void**

Seek to a specific frame or millisecond time, and play from that point.

**.gotoAndStop(amount: number, unit: 'ms'|'fr' = 'fr'): void**

Seek to a specific frame or millisecond time, and stop the timeline at that point.

<br>

### CSS selection in Haiku {#css}

Haiku Core's API currently offers a familiar CSS-like querying system for locating and targeting elements inside your component tree. However, it has some limitations; it doesn't support the full feature set of major CSS selector engines.

**We currently support:**

* By tag name, e.g. `.querySelector('div')`
* By id, e.g. `.querySelector('#foo')`
* By class name, e.g. `.querySelector('.bar')`
* Comma-separated lists of the above, .e.g `div, #foo, .bar`
* By Haiku identifier, e.g. `.querySelector('haiku:abcde12345')`. (Note: this Haiku-specific extension is subject to revision in the future. As Haiku elements' identifiers are autogenerated in Animator for Mac, use with care.)

**Not yet supported:**

* Attributes selectors such as `[foo="bar"]`
* Descendant combinators such as `>`, `~`, ` ` (space), `+`
* Pseudo-classes such as `:focus`

We may support more CSS selector features if we hear from the community that they would be useful.

<br>

[Next: Editing Animator projects as Code](/using-haiku/advanced-editing-haiku-as-code.md) &rarr;

# Haiku Core API

<br>

#### OVERVIEW

A programmatic interface to the Haiku Core (and your published Haiku) is available for those who need more control. With the programmatic API, you can access your Haiku's internal content and create fine-grained behavior that responds to user and page events.

<br>

#### EMBED API

The first interface to control your Haiku is via its declarative embedding API. (Getting your embed snippet is covered in the [embedding section](/embedding-and-using-haiku/publishing-and-embedding.md).)

<br>

**Passing in/overriding embed states**

The first thing you might want to do is override the [states](/using-haiku/defining-states.md) you've defined.

For example, if you are embedding a Haiku as a React component, you can override its internal states by passing a `haikuStates` prop. (Note: It is best to think of Haiku states as a combination of React's `this.state` and `this.props`, since internally the Haiku Core treats them the same.)

```
<MyHaiku
  haikuStates={{
    clicks: { "value": 0 }  // Overrides (or sets) a state named "clicks"
  }}/>
```

<br>

**Configuring embed options**

Much of the Haiku Core's options can be controlled by passing in an options prop:

```
<MyHaiku
  haikuOptions={{
    seed: '{random}', // (String) - Random seed used for deterministic randomness
    autoplay: true, // (boolean) - Whether to start playing the animation immediately
    loop: true, // (boolean) - Whether to continuously loop the animation
    sizing: 'normal' // (String) - The sizing mode, either "cover" or "contain"
  }}/>
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

#### PROGRAMMATIC API

Assuming you have a variable with an instance of your component (see above), a programmatic API is available that allows you to control the precise behavior of your component on a frame-by-frame basis.

<br>

##### HaikuComponent

Manages the behavior of your component at the top level.

###### METHODS

**.on(eventName: string, eventHandler: function) -> void**

Listen for an event emitted by the instance. Events available are:

* `'haikuComponentWillInitialize'` - Before the instance constructor runs
* `'haikuComponentDidInitialize'` - After the instance constructor runs
* `'haikuComponentDidMount'` - When the instance is (re)added to the DOM
* `'haikuComponentWillUnmount'` - When the instance is removed from the DOM

**.assignConfig(configObject: object) -> void**

Dynamically reconfigure your component instance. Valid fields are the same as those that may be passed to embedded React components:

```
component.assignConfig({
  options: {
    seed: '{random}', // (String) - Random seed used for deterministic randomness
    autoplay: true, // (boolean) - Whether to start playing the animation immediately
    loop: true, // (boolean) - Whether to continuously loop the animation
    sizing: 'normal' // (String) - The sizing mode, either "cover" or "contain"
  },
  states: {
    clicks: { "value": 0 }  // Overrides (or sets) a state named "clicks"
  }
})
```

**.getClock() -> HaikuClock**

Returns an instance of the `HaikuClock` that manages time for this instance (see below).

**.getTimeline(timelineName: string) -> HaikuTimeline**

Returns an instance of the `HaikuTimeline` of the given name `timelineName` (see below).

<br>

##### HaikuClock

Manages the apparent progression of time in your component's _context_, including all of its descendants.

###### METHODS

**.assignOptions(optionsObject: object) -> void**

Configure the clock's internal options settings.

```
clock.assignOptions({
  frameDuration: 16.666,  // Apparent time to elapse per frame
  frameDelay: 16.666  // How long to wait between frame renders
})
```

**.getTime() -> number**

Return the current time (in milliseconds) held by this clock.

**.getFrameDuration() -> number**

Return the value of the apparent duration of a single frame.

**.isRunning() -> boolean**

Return whether or not the clock is currently running.

**.start() -> void**

Start the clock. Warning: This will (re)start _all_ components that are managed by this clock!

**.stop() -> void**

Stop the clock. Warning: This will stop _all_ components that are managed by this clock!

<br>

##### HaikuTimeline

An instance of a timeline, which controls animation for a specific set of elements, as well as their properties.

###### METHODS

**.assignOptions(optionsObject: object) -> void**

Assign the configuration options for this timeline instance:

```
timeline.assignOptions({
  loop: true, // Whether this timeline should keep looping its animation
})
```

**.getMaxTime() -> number**

Returns the maximum time (in milliseconds) that any modification occurs from this timeline. This number is the same as the millisecond value of the max keyframe. Same as `.getDuration()`.

**.getClockTime() -> number**

Returns the time of held by the clock (`HaikuClock`) that manages this timeline instance.

**.getElapsedTime() -> number**

Returns how much time has elapsed since this timeline started playing, regardless of what its max time is.

**.getBoundedTime() -> number**

Returns the current time (in milliseconds) since this timeline began playing, unless that number is larger than the max time, in which case, returns the max. Same as `.getTime()`.

**.getTime() -> number**

Same as `.getBoundedTime()`.

**.getDuration() -> number**

Same as `.getMaxTime()`.

**.getBoundedFrame() -> number**

Returns the current frame number, unless that frame is larger than the max keyframe, in which case, returns the max. Same as `.getFrame()`.

**.getUnboundedFrame() -> number**

Returns the current frame number as if the timeline would continue elapsing frames after its max value. Useful if you need to know what the frame _would be_ in either case.

**.getFrame() -> number**

Same as `.getBoundedFrame()`.

**.isPlaying() -> boolean**

Returns whether or not this timeline is currently playing.

**.isFinished() -> boolean**

Returns whether or not this timeline has gone past its max frame.

**.setRepeat(doRepeat: boolean) -> void**

Set the looping behavior of this timeline instance. Setting `true` instructs this timeline to `loop`. This is the same as setting the `loop` option.

**.getRepeat() -> boolean**

Returns whether or not this timeline is configured to loop.

**.start() -> void**

Start this timeline from frame 0.

**.stop() -> void**

Stop this timeline. (This pauses the timeline and resets to 0.)

**.pause() -> void**

Pause this timeline at the current frame.

**.play() -> void**

Play this timeline at whatever frame it is currently at. (This does _not_ reset the playhead to 0.)

**.seek(milliseconds: Number) -> void**

Jump to a specific time (in milliseconds) in the timeline.

Note that since common values for milliseconds and frames don't precisely line up (frame 5 is at 83.3 milliseconds), a small amount of rounding occurs.

Also, note that this _locks playback to the specified frame_. Use `.gotoAndPlay` if you want it to continue playing from the new point.

**.gotoAndPlay(milliseconds: Number) -> void**

Seek to a specific frame, and play from that point.

**.gotoAndStop(milliseconds: Number) -> void**

Seek to a specific frame, and stop the timeline at that point.

<br>

[Next: Editing Haiku as Code](/using-haiku/advanced-editing-haiku-as-code.md) &rarr;

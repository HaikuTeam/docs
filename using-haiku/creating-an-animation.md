# Creating Animations

<br>

#### OVERVIEW

When you're crafting animations in Haiku, it helps to think about how you're *changing values over time.*  For example, how does the `X position` or the `Y position` of this object change over the span of 1 second?  

When you drag the timeline *ticker* left or right, you're changing the current *time.*  Any changes you make for a given ticker position affect the values (keyframes) specifically at that time.

Once you've set up two points in time, you can then create a *transition* to have Haiku automatically ease between the values.  Experiment with different easing curves to finesse your animations!

![](/assets/animate-position.gif)

> Advanced: Animating along curves
> While we plan to support custom, visual animation along paths in the future, there's a lot you can do with Haiku today.  Since you can animate X and Y position separately, try out *different easing curves* for each of X and Y positions.  For example, if you animate `linear` with X and `ease in > quadratic` with Y, you can plot half of a parabola (then `ease out > quadratic` with Y while continuing linearly with X to plot the other half.)  You can do the same thing with `sin`, `circ`, `bounce`, and any number of other transitions to create complex parametric path animations.


A technical note:  dragging an element across the stage *at a point in time* is exactly the same as editing the `X Position` and `Y Position` properties in the Properties *at that point in time.*  They are both 'windows' into the same underlying data.  In fact, both of these are *also* the same as editing the values manually in the code—you can read more about this at [Advanced:  Editing Haiku as Code](using-haiku/advanced-editing-haiku-as-code.md).


<br>

#### TIMELINE ANATOMY

Creating animations boils down to using the Timeline and the Stage.  The Stage is pretty self-explanatory, especially if you're familiar with a drawing tool like Sketch.  The Timeline, on the other hand, may seem intimidating if you're new to animation.  Don't be scared!  We've done our best to make it as accessible and familiar as possible, taking cues from existing tools like After Effects and Flash/Animate (and even data entry tools like Excel!) 

This is the basic anatomy of the Timeline.  These terms are defined visually here for clarity when they're referenced elsewhere in the docs.

![](/assets/timeline-anatomy.png)



#### CREATING OR EDITING A KEYFRAME

New keyframes will automatically be created when you 1.) advance the ticker to a new point in time and then 2.) change properties *on the stage* (e.g. by resizing or moving an element,) or *numerically in the properties panel*

You can also create a keyframe by right-clicking on any property in the timeline and selecting "Create Keyframe"

![](/assets/create-keyframe.png)


To EDIT THE POSITION of a keyframe, simply click and drag to the left or right.

To EDIT THE VALUE of a keyframe, simply align the ticker over the keyframe, then edit the property VISUALLY on stage (e.g. drag the object to change its Position X and Position Y,) or NUMERICALLY (change the value in the Properties Input to the desired value.  You will also see the property update on Stage when you do this.)

<br>


#### CREATING OR EDITING A TRANSITION/TWEEN

Once you've created two keyframes (note, there's always a keyframe at the first frame) you can create a Transition.  Haiku will then ease between the values of the two keyframes, along the Easing Curve that you specify.

To create a transition, RIGHT CLICK between two keyframes, then choose "Create Tween" > and select your desired curve.

![](/assets/make-tween.png)

> Coming soon:  we'll be adding support for custom easing curves, plus the ability to better visualize the shape of a given curve.

<br>


#### ZOOMING WITH THE TIMELINE

You can zoom in or out with the timeline by dragging either end of the horizontal scroll bar.  Notice the white vertical tick in the scrollbar—this shows you where the Ticker is along the timeline, while the width of the scrollbar shows how much of the timeline is currently visible in the viewport.


<br>

#### CHANGING TIMELINE UNITS

You can click the number in the "Ticker Position (Current Frame)" box on the top of the timeline to toggle between showing units in Seconds vs Frames.

<br>

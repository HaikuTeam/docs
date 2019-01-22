---
description: Animation is one of the main features of Haiku, and the heart of creating animations in Haiku is the Timeline. Using a combination of the Timeline and Stage, you can move and transform elements in your component over time, with the result being... animation!
---

# Creating Animations with the Timeline

Animation is one of the main features of Haiku, and the heart of creating animations in Haiku is the **Timeline**. Using a combination of the Timeline and Stage, you can move and transform elements in your component over time, with the result being... animation!

<br>

Think of it like this: While the Stage shows what each element in your Haiku _looks like_ as it animates, the Timeline depicts how the elements' _properties_ change.

The Stage is pretty self-explanatory — especially if you're familiar with a drawing tool like Sketch.

But the Timeline may seem intimidating if you're new to animation. Don't be scared!  We'll do our best to make it as accessible and familiar as possible. (If you've used Adobe After Effects, Flash, or even Final Cut, then you're probably already familiar with the idea.)

<br>

#### THINKING LIKE AN ANIMATOR {#animator}

It's helpful, first of all — especially if you're just starting out — to try to get into the mindset of an animator.

To think like an animator means to think about _what elements will look like at various points in time_, and then _how those elements will transition between one point in time and the next_.

In more technical terms, the same idea could be expressed as this question: How does the `X position` or the `Y position` of some element change over the span of 1 second?

Using the Timeline, you can precisely control the answer.

<br>

#### TIMELINE - OVERVIEW {#timeline-overview}

The Timeline consists of a few fundamental pieces:

* A list of all of the _elements currently on stage_
* Beneath each element heading, a list of the element's _properties_
* _Property input fields_ showing the value for each property
* _Keyframes_ and _transitions_, which show how values change over time
* A _ticker_, which represents the current point in time being edited

<br>

#### TIMELINE - ANATOMY {#timeline-anatomy}

Stepping back and taking a wider view, this is the overall anatomy of the Timeline. (These terms are defined visually here for clarity when they're referenced elsewhere in the docs.)

![](/assets/timeline-anatomy.png)

<br>

#### HOW TIMELINE AND STAGE INTERACT {#timeline-and-stage}

To understand how the Timeline and Stage interact, let's look at how a simple design (a heart, as shown here) moves around on the stage when animations have already been defined on the timeline.

When the ticker is at frame 0, the heart is shown on the stage at its initial position (150, 168).

<table>
  <tr>
    <td><img src="/assets/comix/tl1.png"></td>
    <td><img src="/assets/comix/st1.png"></td>
  </tr>
</table>

If we press the play button and wait until frame 10 is reached, we see that the heart jumps to a new position, (211, 217). That's because frame 10 is marked as a _keyframe_ for a change in the `position.x` and `position.y` properties of the element.

<table>
  <tr>
    <td><img src="/assets/comix/tl2.png"></td>
    <td><img src="/assets/comix/st2.png"></td>
  </tr>
</table>

Keep playing, and soon the ticker will reach frame 15. The heart's position jumps again, this time to the position (288, 97). As you can see, there are two more _keyframes_ defined at frame 15, which explains the jump to the new position.

<table>
  <tr>
    <td><img src="/assets/comix/tl3.png"></td>
    <td><img src="/assets/comix/st3.png"></td>
  </tr>
</table>

The keyframes at frame 15 indicate the beginning of a _transition_ (or tween) for the `position.x` and `position.y` properties. Thus, instead of jumping instantly from the baseline position (288, 97), the heart will slide smoothly between until it reaches the destination position (84, 119).

<table>
  <tr>
    <td><img src="/assets/comix/tl4.png"></td>
    <td><img src="/assets/comix/st4.png"></td>
  </tr>
</table>

Each transition is associated with an _easing curve_, which designates what the smooth movement between the two values should look like. There are many easing curves to choose from, but we'll cover those later.

<br>

#### INTERACTING WITH THE TIMELINE

When you drag the timeline *ticker* left or right, you're changing the current *time.*

**Any changes you make while the ticker is at a certain position will affect the values (_keyframes_) specifically at that time.**

Once you've affected values at two such points in time (i.e., created _keyframes_), you can then create a *transition* to have Haiku automatically ease between the values.  Experiment with different easing curves to finesse your animations!

![](/assets/animate-position.gif)

> **Advanced: Animating along curves**<br>
> While we plan to support custom, visual animation along paths in the future, there's a lot you can do with Haiku today.  Since you can animate X and Y position separately, try out *different easing curves* for each of X and Y positions.  For example, if you animate `linear` with X and `ease in > quadratic` with Y, you can plot half of a parabola (then `ease out > quadratic` with Y while continuing linearly with X to plot the other half.)  You can do the same thing with `sin`, `circ`, `bounce`, and any number of other transitions to create complex parametric path animations.

<br>

#### USING THE STAGE TO CREATE KEYFRAMES {#stage-keyframes}

If you drag an element across the stage *at a point in time*, keyframes will automatically be created at that time. That is, dragging an element on stage _is exactly the same as editing the `X Position` and `Y Position` properties in the at that point in time!_

Both techniques are 'windows' into the same underlying data.

In fact, both of these techniques also have exactly the same outcome as editing the values manually in the code — which you can read more about under [Advanced:  Editing Haiku as Code](./advanced-editing-haiku-as-code.md).

<br>

#### USING PROPERTY INPUTS TO CREATE KEYFRAMES {#propertyinputs}


First, move the ticker to frame 10, then double click the "rotation" value to focus the input:

![](/assets/keyframe-input-1.png)

Then, change the value to the desired rotation value, and press `Enter` to save the value. Keyframes for the value `1.234` will be created at that point in time:

![](/assets/keyframe-input-2.png)

<br>

##### Writing expressions in property inputs {#expressions}

Property inputs can contain more than just simple values. They can be little snippets of code that we call _expressions_. A la Microsoft Excel, just **begin your property input value with an _equals sign_**, and the input will recognize that you're typing in an expression.

![](/assets/expr-00.png)

Expressions are a powerful tool and there's a lot you can do with them, so we've covered them in detail in **[the expressions guide](/using-haiku/writing-expressions.md)**.

<br>

#### CREATING OR EDITING A KEYFRAME {#editingkeyframe}

New keyframes are automatically created when you:

1. advance the ticker to a new point in time and then
2. change properties *on the stage* (e.g. by resizing or moving an element) or *numerically in the properties panel*.

You can also create a keyframe by right-clicking on any property in the timeline and selecting "Create Keyframe".

![](/assets/create-keyframe.png)

<br>

To _move a keyframe itself_, simply click and drag to the left or right.

To edit the _value of a keyframe_, simply align the ticker over the keyframe, then edit the property visually on stage (e.g. drag the object), or numerically via the property inputs (e.g. change the value in the input field to the desired value).

<br>

#### CREATING OR EDITING A TRANSITION/TWEEN {#tweens}

Once you've created two keyframes (there's always a keyframe at the first frame) you can create a Transition.  Haiku will then ease between the values of the two keyframes, along the Easing Curve that you specify.

To create a transition, right-click between two keyframes, then choose `"Create Tween" >` and select your desired curve.

![](/assets/make-tween.png)

Once the transition has been created, you can always modify it, if you right-click on the transition and choose one of the following two options:

- `"Change Tween >"`: lets you select a curve from a set of predefined curves.
- `"Edit Bezier Curve" >`: lets you create a customized Cubic Bezier Curve.

<br>

#### ZOOMING WITH THE TIMELINE {#zooming}

You can zoom in or out with the timeline by dragging either end of the horizontal scroll bar.  Notice the white vertical tick in the scrollbar — this shows you where the Ticker is along the timeline, while the width of the scrollbar shows how much of the timeline is currently visible in the viewport.

<br>

#### CHANGING TIMELINE UNITS {#units}

You can click the number in the "Ticker Position (Current Frame)" box on the top of the timeline to toggle between showing units in Seconds vs Frames.

<br>

[Next: Keyboard shortcuts &amp; Input](/using-haiku/keyboard-shortcuts-and-input.md) &rarr;

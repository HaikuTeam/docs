---
description: Every Haiku you create can have its own collection of internal state. These pieces of data are special to your component in that you may summon them into your expression functions, allowing you to create complex dynamic behavior.
---

# Defining States

Every Haiku you create can have its own collection of internal state. These pieces of data are special to your component in that you may "summon" them into your [expression functions](/using-haiku/writing-expressions.md), allowing you to create complex dynamic behavior.

<br>

#### DEFINING/EDITING STATES

You can manage your Haiku's state values using the State Inspector, which is accessible via a tab next to the Library:

<div style="width: 300px; margin: 0 auto;">
  <img src="/assets/states-ui-empty.png"/>
</div>

Press the "+" button at top-right to add a new state value. In the left field, type the state name. In the right field, type the state value. Haiku will automatically infer whether your input value is a string, numeric, or a complex data type like a JSON array or object.

<div style="width: 300px; margin: 0 auto;">
  <img src="/assets/states-ui.png"/>
</div>

Press `Enter` to save the state value.

<br>

#### SUMMONING STATES IN EXPRESSIONS

To access a state value in an [expression](/using-haiku/writing-expressions.md), simply **type its name**. Haiku will automatically detect the state you are referencing, and will send its current value to your expression whenever it is evaluated.

![](/assets/expr-multiline-ui-0.png)

<br>

#### CHANGING STATE VALUES

You're probably thinking to yourself, "States aren't very useful unless you can change them." You're right! 

There are two ways to change state: Externally and programmatically from component itself. 


##### Changing state externally


Every Haiku component provides a way to change its states, available when the component is [embedded](/embedding-and-using-haiku/publishing-and-embedding.md) in production.

All you need to do to update states dynamically as your component animates is to pass in a new _states object_, and the new values it contains will be used in place of the ones you defined inside the Haiku app.

<br>

**Using React:**

```
<MyComponent
  haikuStates={{
    foo: { value: 2 },        // Overrides the default value 1
    bar: { value: "howdy" },  // Overrides the default value "hello"
    baz: { value: 0.98 }      // Overrides the default value 0.98
  }} />
```
<br>

##### Changing state programmatically

Another option to change states is inside [actions](/using-haiku/actions.md), as a response to a Haiku event (eg. On frame play, mouse click, mouse hover, etc). For example, imagine user want to change previous defined `baz` to `8` when user click on some element, the action contents of `click` should be:

```
this.setState({baz: 8})

```

Another useful option in addition to setting a state right away, is set a state transition. State transitions work just like as [animation transition/tween](/using-haiku/creating-an-animation.html), but with states instead. To to the same state change above, but in the time span of 3 seconds in a nicely incremental way:

```
this.setState({baz: 8}, {duration: 3000, curve: "linear"})
```

If `baz` value was 2 before user clicked the element, the transition will go linearly from `2` to `8` in a time span of 3 seconds (3000 ms). Be careful, as of version 3.5.0, state transition works only with state being transitioned from `number` to `number`.


Another transition curves beyond `linear` and option to queue state transitions are detailed in our  [Haiku Core API section](/embedding-and-using-haiku/haiku-core-api.md), under `setState`.



> Note: For more about how to interact with your component programmatically, see the [Haiku Core API section](/embedding-and-using-haiku/haiku-core-api.md).

<br>

[Next: Just-in-time Properties](/using-haiku/just-in-time-properties.md) &rarr;

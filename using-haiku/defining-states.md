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

> Note: For more about how to interact with your component programmatically, see the [Haiku Player API section](/embedding-and-using-haiku/haiku-player-api.md).

<br>

[Next: All About "Summonables"](/using-haiku/summonables.md) &rarr;

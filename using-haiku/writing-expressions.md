<br>

# Writing Expressions

Whether you're visually creating an animation with the [Timeline](/using-haiku/creating-an-animation.md), or [hand-editing your Haiku as code](/using-haiku/advanced-editing-haiku-as-code.md), one of the most powerful techniques you can use to bring your Haiku to life is **expressions**.

_Expressions_ are just small snippets of code that add dynamic behavior to the properties of your Haiku. To be more specific, they're really _just JavaScript functions_ that run at specific moments in time as your Haiku animates.

![](/assets/expr-anim.gif)

<br>

#### WRITING AN EXPRESSION IN THE TIMELINE

In the [Timeline guide](/using-haiku/creating-an-animation.md), we cover how to use the property inputs on the timeline to create keyframes. But those inputs can contain more than just simple values — they can also contain expressions!

Just as you might write a formula with Microsoft Excel, in Haiku you can start creating an expression by **typing an _equals sign_ character**. The input field will automatically recognize that you're typing in an expression:

![](/assets/expr-00.png)

To save your expression, just press `Enter` or `↑` or `↓` (just like Excel). To cancel what you've typed, just press `Escape` and the field's contents will revert to the previous value.

If it's easier to write your expression on multiple lines, you can toggle multi-line mode by pressing `Shift + Enter`.

![](/assets/expr-multiline-00.png)

> Note how the `=` is automatically converted to a `return` which is secretly what the `=` represents!

To save a multi-line expression, press `Cmd + Enter`.

<br>

#### DYNAMIC EXPRESSIONS

Expressions like the one shown in the first example (`Math.sin(Math.PI)`) aren't incredibly useful. (At least, not for much other than making the meaning of your input numbers more obvious.) However, you can also use expressions to compute _dynamic values_ based on _dynamic data_.

For example, you might want to make an element move around and follow the user's mouse cursor. Or you might want to create a loading animation thats show the progress of a file upload occurring at an unpredictable rate.

But where does the dynamic data come from in the first place? And how do you reference dynamic data in an expression?

<br>

#### DYNAMIC DATA PART I: STATES

The basic kind of dynamic data in Haiku is called a _state_. You can manage your state values using the State Inspector which is accessible via a tab next to the Library:

<div style="width: 300px; margin: 0 auto;">
  <img src="/assets/states-ui.png"/>
</div>

> Note: Managing and changing states in production is covered in depth in the **[States guide](/using-haiku/defining-states.md)**.

<br>

#### SUMMONING STATES

To access a state value in an expression, simply **type its name**. Haiku will automatically match the word you type to the state you are referencing. Haiku will keep track of the state value and pass it to your expression whenever it is calculated.

![](/assets/expr-ui.png)

<br>

If you toggle multi-line mode, you can see the entire expression function. As you can see, the state you referenced has been added to the function signature. (The Haiku Player uses the function signature to know which states to automatically _inject_ into your expression function.)

![](/assets/expr-multiline-ui-0.png)

> Note: Clearly, states aren't much use unless they can be changed! Changing your Haiku's states is covered in depth in the **[States guide](/using-haiku/defining-states.md)**.

<br>

#### DYNAMIC DATA PART II: BUILT-INS

In addition to _states_, Haiku also provides a collection of built-in pieces of dynamic data that you can summon into your expression function, for example:

* The user's mouse position (`$user.mouse.x` and `$user.mouse.y`)
* The window size (`$window.width` and `$window.height`)
* And a lot more

[See the complete list of available built-in "summonables"](/using-haiku/summonables) &rarr;

<br>

#### SUMMONING BUILT-INS

Just like with states, you can summon any dynamic built-in data point if you simply **type its name**. For example:

![](/assets/expr-singleline-ui.png)

> The full list of built-ins that you can reference inside your expressions is available in the **[Summonables section](/using-haiku/summonables.md)**.

<br>

#### ADVANCED: EXPRESSIONS IN CODE

Expressions that you write [manually in your code](using-haiku/advanced-editing) are the same as [expressions](using-haiku/writing-expressions.md) you create visually using the Haiku app. _When you write an expression in the Haiku app, it gets written to your code file as an expression function, just as if you had written it manually!_

Here's what an expression might look like if hand-written in code:

![](/assets/expr-code-after.png)

> Note: When writing expressions by hand in code, you're responsible for modifying the function signature to request the correct values to be injected.

Here's a full code snippet showing how a hand-written expression which references some internal states would look inside your component's code:

```
"states": {
  "foo": { value: 1 },
  "bar": { value: 2 },
  "baz": { value: 3 }
},
"timelines": {
  "Default": {
    "#box": {
      "position.x": {
        "0": {
          "value": function ({ foo, bar, baz }) {
            return foo + bar + baz // Returns `6`
```

<br>

> Technical note: The Haiku Player automatically optimizes your expression functions using summoned values: Only when the states they summon have changed is the function re-evaluated. For that reason, it's required that you write expression functions as _pure functions_ (expressions should avoid making side-effects and/or referencing any hidden state).

<br>

[Next: Defining States](/using-haiku/defining-states.md) &rarr;

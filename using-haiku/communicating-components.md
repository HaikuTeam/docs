---
description: Communicating between components
---

# Communicating between Components {#component-to-component}

Components can communicate with other components in two ways:
1. Overidding subcomponent instance states
2. Emitting custom Actions

#### Overidding subcomponent instance states

Every component has its own internal collection of [States](/using-haiku/defining-states.md). Subcomponents automatically display their available states as timeline rows when instantiated (see below). To override the default values of these states, create new keyframes with the overriding values you'd like to pass in. Note that you can set these values to match the states within the consuming component using [expressions](/using-haiku/writing-expressions.md).

![Pass In State](/assets/passin.png)



#### Emitting custom Actions
Components can also pass messages to other components using [Actions](/using-haiku/actions.md) combined with the `.send()` method.

To do so, create a custom Action on the component on which you want to receive the message.

![Add custom Action](/assets/custom_action.gif)

This subcomponent's custom Action can be called from any other component by using an element or frame Action along with the `.send()` method. `.send()` takes 3 arguments. Here's an example call: `this.send('down', 'MyCustomAction', 'hello')`.

The first argument indicates which direction along the component tree you want to send the message. The options are `up`, `down`, `sideways`, or `*` . (Using `*` broadcasts all directions simultaneously.) The second argument specifies the custom Action you desire to trigger. The third, optional, argument holds any data you want to send into the custom Action for reference.

<br>

[Next: Haiku Core Overview](/embedding-and-using-haiku/haiku-core-overview.md) &rarr;

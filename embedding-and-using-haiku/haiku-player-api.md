# Haiku Player API

<br>

#### OVERVIEW

A programmatic interface to the Haiku Player (and your published Haiku) is available for those who need more control. With the programmatic API, you can access your Haiku's internal content and create fine-grained behavior that responds to user and page events.


####

**Passing in/overriding states**

The states can be overridden by passing them into your embedded Haiku instance. For example, if you are embedding a Haiku as a React component, you can override its internal states by passing a `haikuStates` prop. (Note: It is best to think of Haiku states as a combination of React's `this.state` and `this.props`, since internally we treat them the same.)

```
<MyHaiku haikuStates={{ "clicks": { "value": 0 }}}/>
```
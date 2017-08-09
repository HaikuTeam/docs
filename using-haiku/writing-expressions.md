**Special injectables**



For convenience we also automatically make available to machines a set of what we call _injectables_. That is, your machine function can request a lot more than just those states which you've explicitly defined. Special injectables are prefixed with a dollar sign (`$`) to differentiate them from your internal states (and to make sure your own namespace stays clean):

```
function ({ numClicks, $injectableExample }) { ... }
```

Special injectables available include:

The above list is incomplete and simplified. Also, we plan to provide many additional injectables for convenience in the future.


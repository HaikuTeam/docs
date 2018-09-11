---
description: Release Notes - Version 4.0.0
---

# Release Notes: Version 4.0.0
Release date - August 20, 2018.



#### WHAT'S NEW
- Haiku Pro - Offline support, video exports, and power-user features. Pro also comes with unlimited private projects and unlimited access to Haiku Cloud.
- Shape morphing - Added support for editing vertices of shapes and animating those changes.
- Snapping - Elements on stage now automatically snap to align with other elements, making it easier to compose elements precisely. (To turn off, hold down the Cmd key.)
- Align and distribute panels - You can now align and distribute any set of elements on Stage. Look for the icon above the Stage and click it to open the align/distribute menu.
- Code editor - You can now switch between Design and its Code when editing a component.
- Timeline marquee selection - You can now select multiple keyframes/transitions in the Timeline with a marquee.
- Locking - Using the lock symbol next to the element name in the Timeline, you can now lock elements to prevent edits.
- Pinch zooming - Added ability for trackpad users to pinch to zoom on the Stage and in the Timeline.
- Copy-and-paste curves - Using the right-click context menu, you can now copy and paste curves between different transitions in the Timeline.
- Sync toggling - You can now prevent design changes from automatically syncing to specific elements on the Stage. Look for the sync arrow icon in the Timeline.
- New tour - New users can select Help > Take Tour to take the new-and-improved tour.
- Added ability to collapse all timeline rows by collapsing the top row.
- Added a better visual indication of the final keyframe of the timeline.
- Added Cmd+Enter and Cmd+S keyboard shortcuts for saving the code in the Action editor.
- Added a warning to make it clear that Expressions are deleted when grouping/ungrouping a set of elements.
- Added ability to attach events to individual shapes inside slices.
- Added ability to change the type of a value that had been entered as a State.
- Added the ability to fire an Action on every frame (Action editor > Component/Lifecycle > Frame).
- Implemented Hover and Unhover events as a more convenient way to triggers Actions when the user hovers/unhovers an element. (You may find the behavior of these events more intuitive than Mouse Enter, Mouse Over, etc. Look for them in the Action editor under 'Favorites.')
- Made the property input fields in the Timeline more forgiving when the value entered doesn't match the expected type (you can now enter numbers in property fields that expect strings, for example).
- Improved the Library UI, making it easier to connect with your favorite design tool (Sketch, Figma, or Adobe Illustrator).
- Improved the component code format to be more readable and less verbose: Element identifiers now include layer names, and non-tweened properties can be written as simple key-value pairs.
- Added the ability to imperatively evaluate summonables/helpers from within Action handler functions. (Try this.evaluate('$user.mouse.x').)
- In Haiku Core, added support for 'auto' sizing, allowing components to be sized to their content.
- In Haiku Core, added support for a new $container summonable, allowing elements to be positioned according to their container's dimensions using Expressions.
- In Haiku Core, improved and simplified the API for various summonables. Try these: $timeline.frame, $element.width.
- In Haiku Core, added support for non-distortive sizing of subcomponents: When a component on Stage exposes numeric width and height States, resizing that subcomponent on Stage will apply changes to those fields directly (instead of applying a distortive scale).


#### FIXES
- Fixed a bug preventing Frame Actions from being accounted for when determining the final keyframe/loop point in animations.
- Fixed issue causing both X and Y keyframes to be created when elements were only moved in one direction.
- Fixed a bug causing line elements from being lost during ungroup.
- Fixed issues related to incorrect composition of 3D rotations. (Projects with 3D rotation created in earlier versions of Haiku may look slightly different.)
- Fixed a crash caused by copying and pasting certain components.
- Fixed issue causing errors when using a return statement in an Action handler function.
- Improved performance when horizontally scrolling in the Timeline.
- Improved performance when expanding/collapsing rows in the timeline.
- Improved performance when placing elements on the Stage.
- In Haiku Core, improved general animation performance.
- Improved error-catching to make it less likely for errors in user-authored code in Actions or Expressions to crash or appear on the Dashboard.
- Improved handling of values such as Infinity, null, undefined, and NaN when returned from Expressions.
- Fixed a number of crashes that could occur due to asset size in large projects.
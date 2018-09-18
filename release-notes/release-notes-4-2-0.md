---
description: Release date - September 10, 2018.
---

# Release Notes: Version 4.2.0
Release date - September 10, 2018.


#### WHAT'S NEW
- Elements now remain direct-selected through undo/redo.
- You can now change the email address you use to sign in at [account.haiku.ai](https://account.haiku.ai/).
- You can now find a link to your public profile when publishing a public project.
- Added the ability to tween percent values (e.g. `25%` to `50%`).


#### FIXES
- Creating a project with the same name as a previously deleted project no longer shows shadow copies of the old project's design files in the asset library.
- Fixed bug that could cause some subcomponents' overridden states not to be rendered while editing.
- Fixed bug that could cause infinite loops to be triggered when using certain Timeline APIs in Action code for Component > Will Mount.
- Fixed an issue where ungrouping SVGs containing inline CSS caused a loss of styles.
- Fixed an issue preventing ungrouped SVG elements from receiving display properties from the original SVG.
- Fixed a rare crash triggered by quickly dragging or scaling elements on stage immediately after instantiation.
- Fixed an issue where the library won't show the buttons to create design assets if you have a component defined.
- Fixed an issue where sometimes a published project might show the wrong version.
- Fixed a bug causing the Frame Actions Editor to display the wrong title.
- Fixed an issue where externally hosted image files were not included in Lottie exports.
- Fixed an issue where adding keyframes on an SVG path property without a tween might result in an empty Lottie export.
- Improved the logic to create new components.
- Ensured that locked elements do not intercept pointer events on stage.
- Improved accuracy of marquee selection in Timeline.
- Fixed crashes during marquee selection in Timeline.
- Fixed layout issues with long component names in Timeline.

---
description: Release Notes - Version 4.1.1
---

# Release Notes: Version 4.1.1
Release date - August 30, 2018.


#### WHAT'S NEW
- Creating a component with the + sign now always creates an empty component.
- Reduced the footprint of @haiku/core by 30KB (3KB minified and gzipped).
- We added some helpful tooltips throughout the app.
- Generally improved app performance and stability for large projects.


#### FIXES
- Greatly improved the performance of Haiku when working with large or complex SVGs.
- Fixed several app stability issues affecting the ability to merge in design changes from Sketch/Illustrator/Figma.
- Fixed an issue where the cancel button did not always close the action editor.
- Fixed several issues where some elements might disappear, lose opacity, or become distored when ungrouped.
- Fixed several issues that may have caused publishing a project to hang.
- @haiku/cli now uses configured proxy settings.
- In @haiku/core, fixed a regression affecting ID-based selectors in bytecode.
- Fixed a regression where we no longer highlighted the stage title bar action button when a selected element has an action.
- Made various improvements to the action editor autocompleter.
- Creating a component using the Toolbar or Library menus now creates an empty component.
- When creating a component, only the states used by expressions applied to its elements are cloned to the subcomponent.
- Fixed bugs with Hover/Unhover Actions when attached across nested component instances.
- Fixed a bug preventing the States panel from updating when double clicking to edit a component.
- Fixed action button color when element has action.
- Action editor auto completer got smarter and now replaces correct text.
- Fixed issues related to timeline scrolling.
- Fixed spacing on the Library for elements with long names.


#### BREAKING CHANGES

- String templates are officially deprecated. This is not expected to affect any Haiku users.
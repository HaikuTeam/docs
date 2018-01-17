<br>
# FAQ's

#### I NEED HELP / I HAVE A FEATURE REQUEST

The best way to talk to us is on [our community Slack](https://join.slack.com/t/haiku-community/shared_invite/enQtMjU0NzExMzQzMjIxLTA3NjgzZDYzYmNjYzcxNmUwY2NhMTE0YTE2OGVjZGE0MDhmNGIxOWUzOTk5OTI5MmQ0ZjA5MDAwNGY1Yjk1OTg) or [by email](mailto:contact@haiku.ai).

We're a small team, but we'll try our best to respond to emails within 1-2 business days.

<br>

#### WHEN WILL HAIKU LEAVE PUBLIC BETA?

Haiku is already usable and ready for production projects, however we'll likely continue to be in beta for a while. Remember Gmail was in beta for years!

<br>

#### HOW MUCH WILL HAIKU COST?

While we're in public beta Haiku is 100% free to use. In future, we'll charge for premium features however Haiku will always have a free tier or trial in some capacity.

<br>

#### CAN I RELY ON HAIKU TO KEEP MY ANIMATIONS AROUND FOREVER?

You don't have to! Your designs live on your computer — they're all inside the `~/.haiku` folder (you can type `open ~/.haiku` in terminal to open that folder in Finder).

Haiku is built on top of git, and just like code, it all just sits in files and folders on your computer — it only ever goes to our servers when you publish. When you Publish, you're just triggering a `git push` behind the scenes.

We're also soon going to be open-sourcing significant parts of our stack. This means that you don't need Haiku *at all* to have on-going control of your animations. We believe *your work* should be *yours* and we don't buy into the 'walled garden' approach to design and developer tools.

<br>

#### DO WE NEED HAIKU TO KEEP THEM AROUND FOREVER, OR CAN WE CACHE THEM SOMEWHERE?

Along the lines of the above, you have full control of all of your design files, which are inside `~/.haiku` . Cache away! Along with the upcoming open-sourcing, you'll have full ongoing control of any project you create in Haiku, even if you uninstall and delete your account.

<br>

#### ARE THERE ANY LEGAL IMPLICATIONS? WHO OWNS THE ANIMATIONS?

This is covered in our [Terms of service](https://www.haiku.ai/terms-of-service.html) in the bottom paragraph. You own your animations — we don't.

<br>

#### HOW DO I KEEP THE SAME TRANSFORM DIMENSIONS FOR DIFFERENT SIZED ELEMENTS?

If you want to use different sized elements in Haiku with consistent transform sizes, in Sketch use Artboards instead of Slices.

<br>

#### HOW DO I USE CUSTOM FONTS?

When viewing your published haiku on `share.haiku.ai` your browser may render text elements using default system fonts. To use custom fonts, ensure that your Sketch source file is referencing the same custom font name that's embedded in your website or app.

Alternatively, you can also right click a text element in Sketch and use 'Convert to Outlines' to convert your text element to a vector shape.

<br>

#### DOES HAIKU SUPPORT WPF?
To our knowledge, yes, though we haven't tried ourselves. As Haiku supports Lottie, you can use [Lottie React Native](https://github.com/airbnb/lottie-react-native) —> [React Native Windows](https://github.com/Microsoft/react-native-windows), which is reported to support WPF.

<br>


# TROUBLESHOOTING


#### MY TEXT ELEMENTS ARE CROPPED AT THE BOTTOM

To fix this, ensure that your line height is the same or greater than the character size in Sketch.

<br>

#### ROTATIONS AREN'T BEHAVING HOW I EXPECT THEM TO

Rotations in Haiku are based on radians, not degrees. In future, you'll be able to use both radians and degrees for rotation input, but for now you can use a [degrees to radian calculator](https://www.calcunation.com/calculator/degrees-to-radians.php).

<br>


[Next: Starting Haiku](using-haiku/starting-haiku.md) &rarr;

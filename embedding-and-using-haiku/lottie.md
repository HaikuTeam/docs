---
description: Use Haiku to author animations for Lottie, an open source iOS, Android, and React Native library.
---

# iOS & Android Rendering powered by Lottie

#### OVERVIEW {#overview}

Lottie is an [open source](https://github.com/airbnb/lottie-ios) iOS, Android, and React Native library [from Airbnb](https://airbnb.design/lottie/) that renders animations, allowing apps to use animations as easily as they use static images. Using Haiku, you can author Lottie compatible animations.


#### USING LOTTIE {#usage}

![](/assets/lottie-json.png)

After [publishing](/embedding-and-using-haiku/publishing-and-embedding.md), go to to the share page and select iOS/Android under "Get the code". Download _lottie.json_ and follow the linked instructions.

#### SUPPORTED VERSIONS {#versions}

Haiku has been tested with the following versions of Lottie:

- **lottie-web**: 5.1.1+
- **lottie-ios**: 2.1.4+
- **lottie-android**: 2.2.5+
- **lottie-react-native**: 2.2.5+

#### LIMITATIONS {#limitations}

Lottie does not support all features of After Effects; please refer to the [list of supported features](http://airbnb.io/lottie/supported-features.html) for details.

Dynamic Haiku features including [Expressions](../using-haiku/writing-expressions.md), [Actions](../using-haiku/defining-states.md), [Summonables](../using-haiku/summonables.md), or [Actions](../using-haiku/actions.md) will not translate to dynamic Lottie animations. Additionally, because Haiku components are typically created from scalable vector graphics (SVGs), which use many different conventions than After Effects shapes, you may notice some discrepancies between your Haiku rendered in a browser vs. Lottie. We are working closely with the Lottie team to bring our products closer together.

If you encounter any issues, or if you have any questions about Lottie, please contact us on [our community Slack](https://www.haiku.ai/slack-community) or [by email](mailto:contact@haiku.ai).

<br>

[Next: Using the Haiku CLI](/using-haiku/using-the-cli.md) &rarr;

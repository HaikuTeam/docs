---
description: Turn any Figma design into an interactive React component with Haiku.
---

# Turn any Figma Design Into an Interactive React Component with Haiku

Haiku now allows you to easily bring your [Figma](/[http://figma.com](http://figma.com/) designs to life on the web by animating in Haiku and publishing as a clean React component. This tutorial will step you through the process.


<br>

#### Designing your element in Figma {#figma}

We're going to start by designing an animated button in Figma. To design a simple button in Figma navigate to [http://figma.com](http://figma.com/) and create an account if you haven’t already done so.
![](/assets/figma_home.png)


Create a new Figma design by clicking on the plus sign in the top left of the app.
![](/assets/new_file_figma.png)




We are going to design a confirmation button that will animate upon being clicked by the user.

Start by drawing a rectangle, adding a color gradient, and adding some text to the button.


![](/assets/design_button.png)

Now let’s add a smiley face to the button that we will animate later in Haiku. Start by creating the ‘eyes’ of the smiley face which should be the same size as the dot on the “i” in the word confirm. You can use the ellipse tool to size them and then the color palette to make them white.




![](/assets/create_eye.png)

Once you have created both ellipses you can rename them in the left hand panel.


![](/assets/name_eyes.png)

Once we have the eyes, we’ll need to draw the smile using the Pen tool. Fill it in with a white color to match the eyes and don’t worry too much about lining everything up in Figma since we’ll have the ability to redo this once we export to Haiku. Your button should look something like this:




![](/assets/final_figma.png)

Now we’re ready to bring our button to life in Haiku! If you don’t have Haiku download already, you can do that [here](/https://www.haiku.ai/account/new).

#### Getting set up in Haiku {#setup}

Open up Haiku and create a new project by pressing the New Project button in the top right of Haiku.

![](/assets/new_project.png)

Now give your project a name, set it as public or private, and press Name Project.

![](/assets/create_new_project.png)


#### Importing your Figma element into Haiku {#importfigma}

Welcome to Haiku! The first thing we want to do is import your elements from Figma into Haiku. To do that, double click on the Figma file at the bottom of your Library window on the left side.

![](/assets/library_window.png)

Haiku will then prompt you to log in with Figma and simply press ‘Allow Access’ to give Haiku access to your Figma elements. Once you’ve authorized Figma, double click your file again and enter the link from your Figma project. You can grab this link from the URL bar or the Share button in the top right of Figma.

When you press import you’re going to get the following message:

![](/assets/figma_error.png)

This is because we need to make sure our elements in Figma are either slices or groups so that Haiku can recognize them. This is similar to Sketch, where we have to export our designs as slices for Haiku to read them. This is easy to do. Simply right click on your element in the left panel and choose ‘Group Selection’


![](/assets/group_menu.png)

Then, rename your element to something you’ll recognize by double clicking on the text.

![](/assets/rename.png)

Do that for all of the elements you want to import into Haiku and then press the refresh button next to your Figma file ! Everything will appear in Haiku.


![](/assets/refresh.png)

Congratulations - your Figma elements were successfully imported into Haiku. Haiku always keeps it's connection to your Figma source project. Press the refresh button any time to pull the latest changes from your Figma project. Now, let’s animate your design!

#### Animating your design in Haiku {#animate}

 To animate our button in Haiku we want to make it so that the button does nothing until a user clicks on it. Once clicked, we want the ‘confirm’ text to shift from the center of the button to the left and have the smiley ‘jump out’ of the word and land on the right side of the button.

Your Haiku window should look like the image below. You will see all of your elements in the left hand side, a blank Stage on the right, and a Timeline on the bottom. Click on an element and drag it onto the stage so we can start editing it in time and space.



![](/assets/new_proj.png)



![](/assets/btn_on_screen.png)

Now that my button and “confirm” text are on the Stage we can see that things have changed in the Timeline below the stage. My elements now exist in the Timeline and they have a variety of properties which things like opacity, position, and scale. Let’s finish our initial setup by dragging our to ‘eye’ elements onto the Stage. They should line up on top of each other and exactly on top of the dot on the “i” in confirm. Press Command + or Command - to zoom in and out of the stage for help lining up your elements.

Because this is going to function as a button we want it to do nothing until a user clicks on it, and then once clicked, we want it to animate. We can do all of this in Haiku using the two different types of [actions](https://docs.haiku.ai/using-haiku/actions.html) - Event Actions and Frame Actions. You can basically think of Frame Actions as actions that are triggered at different frames in the animation Timeline (e.g: 'at 60ms begin animation') and Event Actions as actions that are triggered with events like clicks, keyboard commands, mouse-overs and more.  

We’ll want an event action on the button itself that will jump to the frame in the Timeline where animation begins when the button is clicked. We also want to set a frame action in the timeline that will loop the button while we wait for user input (the click). Let’s set up the frame action first.

Go to the timeline and mouse over the top of frame 30 until you see a plus button.

![](/assets/btn_on_screen.png)

Click on the button and you’ll get a popup where you can write javascript code to create actions for frame 30. There’s nothing special about frame 30, and you can do this with any other frame.


![](/assets/action_popup.png)

For this frame action we want to use the “Go To And Play” snippet so that when they Haiku reaches frame 30 we ‘go to and play’ from frame 0. Enter frame 0 as the parameter for the function. Then press save. We’re done with our looping! You should see a blue lighting bolt above frame 30 that let’s you know there’s a frame action above frame 30.


![](/assets/frame_lightning.png)

The other action we want to create in Haiku is our element action so that when someone clicks the Confirm button our animation starts. To do this, right click on the button element and choose ‘Edit Element Actions’

![](/assets/edit_element_actions.png)

Now we want to add a new ‘Click’ action

![](/assets/edit_element_actions.png)

Just like with the Frame Action, we want to Go To and Play but this time from frame 31. This is one frame after our loop so that once we click on the button our loop ends and our animation can begin.


![](/assets/go_to_play_31.png)

Press save again and now we can begin working on our animation in the timeline.

In Haiku, we can drag our playhead through the timeline and then when we edit elements on the stage their properties will be updated wherever the playhead is.

There are three main animations going on in this Haiku. 1) We want our ‘Confirm’ text to shift over to the left. 2) We want the ‘eyes’ on the smiley to pop out of the “i” and 3) we want our smiley face to slide up into the button.

Let’s start by animating the text. We’ll skip ahead to frame 120 (which will be the last frame) and put the playhead on frame 120. Remember, whatever you do to elements on the stage will be updated in their respective properties wherever the playhead is. So let’s put the playhead on frame 120 and move the ‘Confirm’ text to where we want it at the end of the animation.

You can either drag the text to the left side with your cursor or you can update the properties manually in the Timeline. Either works!

![](/assets/move_confirm.png)

Now that we have updated the properties you can test out your animation by pressing play but you’ll see it isn’t much of an animation at all yet. The text just jumps to the left side once the playhead reaches frame 120. To add a smooth transition we want to add a keyframe where we want the animation to start - frame 31- and then add a ‘tween’ to smooth the animation between the two properties.

Add a Keyframe to frame 31 (where we want our animation to begin) by right clicking the dark bar on Position X and choosing ‘Create Keyframe’.

![](/assets/create_keyframe.png)

Now that we have Keyframes at frame 31, where the animation starts, and at frame 120 where the animation ends we can make a ‘tween’ between these two keyframes. Let’s do that now.

Right click on the dark bar between the two keyframes and choose ‘Make Tween’ > ‘Ease Out’ > ‘Cubic’:

![](/assets/make_tween.png)

You should see the tween show up on the timeline between the two keyframes.

That’s it!

Now press play and you should see the smooth animation of the text from the center to the left side. Now we just have to animate the smiley !

For this animation, we want the eyes of the smiley to jump out, bounce up, and land in their desired positions on the right side of the button. To do that, let’s put the playhead halfway between the start and end of the animation (about frame 76) and then use our cursor to update the X and Y properties of our two eyes.

![](/assets/playhead_76.png)

Once we’ve moved both of the eyes ‘halfway’ on our animation we can animate them the same way we did for the text. First, we’ll add a Keyframe at frame 31 where we want the animation to start. Then, by right clicking the timeline for both Position X and Position Y we can add a ‘tween’ that will smooth the animation.

![](/assets/eye_tween.png)

Once you’ve added tweens to both the X and Y properties your timeline for each eye should look like this:

![](/assets/both_tweens.png)

Make sure you do this for both eyes. Then, repeat the process so that the eyes end up where you want them to be in the final frame (frame 120). Add another tween between frame 76-120 and press play to see the text move and your eyes animate!

You’ll notice that the tweens on the timeline should match up with your inutuions about the speed and animation of your elements. This is what they should look like below and don’t forget to zoom in and out on the timeline by dragging the slider on the bottom.

![](/assets/intuitive_tweens.png)

Were almost done with the animation. For the final piece we want the smiley face to slide up from the bottom. We’ll move the playhead to frame 31 and drag the face onto the Stage but off of the Main canvas.


![](/assets/smiley_drag.png)

Then, we’ll animate it the same way we have done with our other elements. We’ll skip the playhead to the last frame (120) and orient the face where we want it to be. Then, we can use tweens to smooth the animation.

The last step is to make sure we ‘stop’ our animation once it’s over so it doesn’t keep looping. Add a frame action to frame 121 just like we did on frame 31 but this time choose ‘Stop’ and then press save.

![](/assets/stop_action.png)

Now, press the preview button in the top right to preview your Haiku!.

![](/assets/preview_eye.png)

You should be able to press the button you designed and see it animate!

Congratulations. We’re almost done - now we can publish our Haiku and import it as a component into a React project.

#### Publish your Haiku {#publish}

To publish your Haiku, simply press the ‘Publish’ button next to preview in the top right of Haiku.


![](/assets/publish-button.jpg)

Once you’ve shared it you can send your shareable link to anyone and they can view and even fork your Haiku. In addition, Haiku provides us with Install Options for a variety of Web and Mobile platforms. Let’s finish the tutorial by getting our Haiku into a React project and live in our browser.

#### Import your Haiku into React {#import}

![](/assets/publishmenu.png)

If you already have a React project, navigate to it in your terminal. If not, you can use ‘ npx create-react-app app-name ‘ to get one up and running.

In the popover window with the publish options click on the React button to view the necessary steps and code to get your Haiku design up and running in React. Following the steps in our publish window we’ll need to first install the Haiku CLI if you haven't already done so:

`npm install -g @haiku/cli`

After we’ve installed the Haiku command line interface we need to import our Haiku into our react project. We can do that with the following command:

`haiku init `
`npm i --save @haiku/zackabaker1-your_tutorial_name_here`


Now that your design is available as a component in React we need to do what we would do with any other React Component. Import it, and add it to our render function. Haiku gives some example code already so add that into your project anywhere along with the important statement to call your component.


And that’s it! Your Haiku component is now live in your React project.
![](/assets/inbrowser.png)

#### Want to learn more?

For more tutorials, documentation, and help navigate to our Learn page here:

http://haiku.ai/learn

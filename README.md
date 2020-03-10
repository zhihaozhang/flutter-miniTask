
 *First Screen:*
 
【done】 Nav bar with a title “Video Demo”

【done】 A single centered button “Start Video”


 【done】 When the button is tapped the camera should open and record a video.
 
 【done】 When the video is done recording show the second screen.

*Second Screen:*

 【done】 Nav bar with title “Video History” and a back button to the First Screen
 
 【done】A list of previously recorded videos.
 
 【not done】 When a video is taped from the list it should open Safari or Chrome and play the video.
 
 > due to Apple’s [sandboxing schema](https://developer.apple.com/app-sandboxing/), an App can’t get the resource of other App including Safari. I tried to use **url_launcher** on an Android Phone, but also failed. Since I used to be an iOS-developer, I think it’s an impossible task within native iOS-dev. But I’m not sure if it’s possible within native Android-dev and Flutter.
 
 As alternative，I play the video within the app. The gif below shows the function of the app.
 
 ![](https://tva1.sinaimg.cn/large/00831rSTgy1gcp6eor2s8g304g09ib2c.gif)
 
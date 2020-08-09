# Wasteagram

The portfolio project for Mobile Software Development

# Description
Your client, Matthew Peter, is the owner of TwentySix Cafe, a Portland coffee shop.

"Man, I am so tired of these wasted bagels and pastries we have at the end of every day!" he says. "I'm losing money, and it's so wasteful... I feel like there's an episode of Portlandia about this. I mean, why waste a donut? A donut!"

Mr. Peter wants his employees to run an application that, "is like Instagram, but for food waste," he says. Every night the person closing the shop can gather up the leftover baked goods, take out their phone, start the app, and create a post consisting of a photo of the wasted food and the number of leftover items.

"If only I could see a list of these posts over time, then at least I'd know how much money I'm losing, and I could make adjustments to my pastry orders," he says, dreamily. "No more forsaken donuts!"

You have engaged Matthew Peter in a paid contract to develop a functioning version of the application that he and his employees can try out at the coffee shop. "Hey, I know," he says, "Let's call it Wasteagram."

# Requirements
The functional requirements are:

* <s>Display a circular progress indicator when there are no previous posts to display in the List Screen.</s>
* <s>The List Screen should display a list of all previous posts, </s><b><i>with the most recent at the top of the list.</b></i>
* <s>Each post in the List Screen should be displayed as a date, representing the date the post was created, and a number, representing the total number of wasted items recorded in the post.</s>
* <s>Tapping on a post in the List Screen should cause a Detail Screen to appear. The Detail Screen's back button should cause the List Screen to appear.</s>
* <s>The Detail Screen should display the post's date, photo, number of wasted items, and the latitude and longitude that was recorded as part of the post.</s>
* <s>The List Screen should display a large button at the center bottom area of the screen.</s>
* <s>Tapping on the large button enables an employee to capture a photo, or select a photo from the device's photo gallery.</s>
* <s>After taking a new photo or selecting a photo from the gallery, the New Post screen appears.</s>
* <s>The New Post screen displays the photo of wasted food, a Number of Items text input field for entering the number of wasted items, and a large upload button for saving the post.</s>
* <s>Tapping on the Number of Items text input field should cause the device to display its numeric keypad.</s>
* <s>In the New Post screen, tapping the back button in the app bar should cause the List Screen to appear.</s>
* <s>In the New Post screen, tapping the large upload button should cause the List Screen to appear, with the latest post now appearing at the top of the list.</s>
* <s>In the New Post screen, if the Number of Items field is empty, tapping the upload button should cause a sensible error message to appear.</s>

* In addition to the functional requirements above, your application should meet the following technical requirements:

* <s>Use the location, image_picker, cloud_firestore, and firebase_storage packages to meet the functional and technical requirements.</s>
* <s>Incorporate the use of Firebase Cloud Storage and Firebase Cloud Firestore for storing images and post data.</s>
* <s>Data should not be stored locally on the device.</s>
* <s>On the List Screen, the application should display the posts stored in the Firestore database.</s>
* <s>On the Detail Screen, the application should display the image stored in the Cloud Storage bucket.</s>
* <s>On the New Post screen, tapping the large upload button should store a new post in the Firestore database.</s>
* <s>Each "post" in Firestore should have the following attributes: date, imageURL, quantity, latitude and longitude.</s>
* <s>The application should incorporate the Semantics widget in multiple places, such as interactive widgets like buttons, to aid accessibility.</s>
* <s>The codebase should incorporate a model class.</s>
* The codebase should incorporate a few (two or three) simple unit tests that test the model class.

The functional and technical requirements specifically exercise the Exploration content and our module learning outcomes. In addition, here are some optional extra credit requirements that can add up to 5% to your overall class grade:

* The app bar of the List Screen should display the total sum of the number of wasted items in all posts (extra 1% added to class grade)
* Add integration tests that verify any one particular part of the UX flow (extra 1% added to class grade)
* Integrate the use of in-app analytics (Analytics) to monitor application usage (extra 1.5% added to class grade)
* Integrate the use of crash reporting (Sentry or Crashlytics) to record application crashes (extra 1.5% added to class grade)

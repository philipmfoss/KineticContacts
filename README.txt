Coding Challenge for Kinetic Cafe

Project: Kinetic Contacts

Philip Foss
2015-01-07

Your overall approach:

I created an iOS application using standard UIKit components following an MVC pattern.
Code is test-driven with testing emphasis on the RandomUser web-service component.
I created a data model for RandomUser types rather than using key-value programming techniques. I did this because I prefer string types with good encapsulation and minimal mutability.
Classes are intended to be highly coherent and loosely coupled. Image caching and all RandomUser web-services are encapsulated in their own classes. The RandomUser API class has as simple an interface as possible.
RandomUser URL building is done in a separate class to allow for good unit testing.

Unit tests aim for maximum coverage with minimal cases. That is: only the high level RUApi class needs to be unit tested, as the RU data model and RUJsonParser will be tested by the same cases.
View controllers do not have any unit testing.
No custom view classes were created so no unit testing is necessary.

I chose to limit parsing of the RandomUser web-service responses to only the data that will be used by the application.
All web calls are made on background threads.

Files are grouped by feature. All RandomUser classes are in the RandomUser group. Image caching is in a separate group.

The code has been run through the static analyzer and profiled for memory leaks.
The code should compiled with no warnings.


What platform you chose and why you chose it:

I chose iOS 6.0 as iOS is my preferred platform, and there is little value in supported iOS versions older than 6.0.
For expedience only iPhone in portrait mode is supported.
Project is built in Xcode 5.1.1.
You will need to sign it yourself to deploy to device.


What features you completed:

A simple Contacts list is shown with thumbnails loaded on-demand as the user scrolls the list. The contact list is limited to 100 contacts.
Selecting any contact will take the user to the Details page.
A full size image of the contact is displayed along with contact title, first name, last name, phone number, cell number, email, and address.
Users can return to the Contacts list.
A wait dialog is shown where appropriate.

Given more time, what else would you have liked to complete and how long it would have taken you?

* Contact list sorting by name - est. 1 hour
* Add a refresh button to Contact list in case of network issues - set. 1 hour
* Make the phone number field in Details selectable, launching the telephony app - set. 1 hour
* Make the cell number field in Details selectable, launching the telephony app - set. 1 hour
* Make the email field in Details selectable, launching the email app - set. 1 hour
* Add animated placeholder thumbnails for Contact list - est. 2 hours
* Create an app icon - no est.

Given more time, what else would you have done to make the project more robust?

* Improve the image cache implementation. Better use of GCD.
* Smarter loading of thumbnails based on scrolling velocity, pre-loading thumbnails where applicable, and delayed loading of thumbnails if user is scrolling too quickly. Cancel thumbnail loading if user scrolls away from contacts while thumbnails have not been loaded.
* Increase capacity by downloading RandomUser objects in batches.
* Improve argument validation on some methods.
* Increase unit test code coverage.
* Add integration testing to Controller classes.

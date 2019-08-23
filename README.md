# iOS GIPHY App Challenge
Coding Challenge: A mobile app that shows the currently trending content from GIPHY.

## Build Instructions
The app has been developed in Xcode 10.3 using Swift 5 with a deployment target of iOS 12.0. Open the project through `giphytrends.workspace` and run the `giphytrends` target. External libraries are managed through [CocoaPods](https://github.com/CocoaPods/CocoaPods) and deliberately checked into the repository to allow for an easy build process.

### External Libraries:
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [SDWebImage](https://github.com/SDWebImage)

## Development Approach
I started working on this take home test by separating the task description into small issues. These issues filled up a simple [kanban board](https://github.com/easytargetmixel/ios-giphy-app-challenge/projects/1), along with my initial thoughts and ideas in the issue descriptions.

The project structure is driven by functionality topics first and technological layers second. Files and classes related to one topic, i.e. the grid view or the full screen view, belong together. This is reflected in the directories and helps modularising the app.

As this is a coding challenge, I have not deleted branches after merging them into the release branch (master). This way, it is easier to trace the work that has been done.

## Possible Improvements

During the initial project phase and as I made progress, I identified several additional features and potential improvements. Whenever I have an idea during the development process, I try to turn it into a full-fledged issue. Not only does this ensure that ideas do not get lost, it also acts as a kind of filter. Adding a short issue description and prioritising an issue helps determining the feasibility of a feature. Additional features and potential changes can be found in the [Issues Section](https://github.com/easytargetmixel/ios-giphy-app-challenge/issues).

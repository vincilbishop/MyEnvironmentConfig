MyEnvironmentConfig
===================

Helper classes that map configuration values to Xcode build configurations. 

## Installation

- Install using CocoaPods.
- Add Environment $(CONFIGURATION) to info.plist.
- Add Environments.plist configuration file, populate with you favorite variable goodness.
- Add a convenience category on the MYEnvironmentConfig class exposing strongly typed configuration values.
- Initialize MyEnvironmentConfig in appDidFinishLaunching.

## References 

These are some helpful sites with good ideas:

- Dynamic configuration values per build configuration: (http://code.tutsplus.com/tutorials/ios-quick-tip-managing-configurations-with-ease--mobile-18324)
- Dynamic bundle identifiers and display names, per build configuration: (http://jaysonlane.net/tech-blog/2012/04/post-release-development-bundle-identifiers-and-display-names/)

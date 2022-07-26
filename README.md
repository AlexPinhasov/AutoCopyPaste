# AutoCopyPaste

<h4 align="center">A tool to find copy-paste code in your Xcode project and see them as ⚠️ Warnings!.</h4>
<p align="center">
<img src="/Images/Example.png">
</p>

<p align="center">
  <img alt="Platform" src="https://img.shields.io/cocoapods/p/EqualableGeneric.svg">
  <img alt="Author" src="https://img.shields.io/badge/author-Alex Pinhasov-blue.svg">
  <img alt="Swift" src="https://img.shields.io/badge/swift-5.0%2B-orange.svg">
</p>

<p align="center">
  <a href="#behindthescenes">Behind the scenes</a> •
  <a href="#installation">Installation</a> •
  <a href="#author">Author</a> •
  <a href="#license">License</a>
</p>

AutoLocalized scans your project and search for your localization files and project files containing localized keys. By using Rules and Validation methods ensuring your keys and files are organized, clean, and always up to date with your work.
## Behind the scenes

I use this incedible framework https://github.com/pmd/pmd to help me find copy paste code.

<b>For every code duplication found this package</b>
- Shows the file origin, how many lines are copied and where.

##
To Do's:
- [ ] Use pmd to search for dead variables/functions .
- [ ] Add Wiki
- [x] Finish README.md
- [ ] Add build and test pass marks

## Installation
<b>1. Install Homebrew</b>
  - after that run "brew install pmd" in terminal

<b>2. AutoLocalized is available through SPM (Swift Package Manager). To install it, simply follow the next steps.
Add AutoLocalized as a dependecy using SPM:</b>
   - File -> Swift Packages -> Add Package Dependency
<p align="left">
<img src="/Images/spi.png" width="100" height="100">
</p>
<p align="left">
<img src="/Images/SPM.png" width="730" height="434">
</p>

<b> 3. Create a "New Run Script Phase" under you target in "Build Phases" tab and copy the script below.</b>

```Shell
xml_data=$(pmd cpd --files ${PROJECT_NAME} --minimum-tokens 50 --language swift --encoding UTF-8 --format xml --failOnViolation true)

SDKROOT=macosx

cd ~/Library/Developer/Xcode/DerivedData/${PROJECT_NAME}-*/SourcePackages/checkouts/AutoCopyPaste
swift run -c release AutoCopyPaste "${xml_data}"

```

* If you get an "error:invalid Access" error after building, just build agian it will go away. (SPM bug)

## Author

AlexPinhasov, alexp.software@gmail.com

## License

AutoCopyPaste is available under the MIT license. See the LICENSE file for more info.


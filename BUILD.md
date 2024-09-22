# Project 

#### Build||Release
##### IOS - Build testflight
<br />
a. In `appConfigBase.dart`, increase internal version before build

     Ex.
     int versionIOS = 115;
     int versionAndroid = 115;

<br />
b. Run `flutter build ios`

```
Building ${prj_name} for device (ios-release)...
Automatically signing iOS for device deployment using specified development team in Xcode project: 2G394G9EZU
Running pod install...                                           1,479ms
Running Xcode build...                                                  
 └─Compiling, linking and signing...                         4.9s
Xcode build done.                                           64.2s
Built /Users/macmini/Desktop/${prj_name}/build/ios/iphoneos/Runner.app.
```

<br />
c. Open Xcode tool, 

     - in `Runner -> Tab General` : Increase version name & version code 
     - choose `Product -> Archive -> Distribute` App new version

<br />
d. Click `Next` -> `Upload`
<br />
e. Visit `App Store Connect -> Testflight`, to see new version

##### Android
<br />
a. Open with folder `android` as Android Project
<br />
b. `Android studio tool => Build => Generate signed app`
<br />
c. Create new Keystore name : release
<br />
d. Fill in Keystore alias|password
<br />
e. type alias + password + select file path `release` => Next
<br />
f. Select release variant
<br />
g. Locate *.apk || *.aab folder path
<br />
h. Visit `Google Play Console`, upload `App Production version`


#### Docs. || Refs.
<br />
1. Reference

   [Project Base document]()

<br />
2. Account :

   ```
   ```
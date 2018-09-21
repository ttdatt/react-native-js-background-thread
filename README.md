
# react-native-js-background-thread [![npm version](https://badge.fury.io/js/react-native-js-background-thread.svg)](https://badge.fury.io/js/react-native-js-background-thread)

## Getting started

`$ npm install react-native-js-background-thread --save`

### Mostly automatic installation

`$ react-native link react-native-js-background-thread`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-js-background-thread` and add `RNReactNativeJsBackgroundThread.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNReactNativeJsBackgroundThread.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNReactNativeJsBackgroundThreadPackage;` to the imports at the top of the file
  - Add `new RNReactNativeJsBackgroundThreadPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-js-background-thread'
  	project(':react-native-js-background-thread').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-js-background-thread/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-js-background-thread')
  	```

## Usage

The returned data from that function must be a string

```javascript
    import {runAsync} from 'react-native-js-background-thread';

    runMe(a, b) {
        let count = 0
        for (let i = 0; i < a; i++) {
          for (let j = 0; j < b; j++) {
            count++
          }
        }

        return JSON.stringify(count)
    }

    runAsync(this.runMe, 'runMe', [200000, 10000])
        .then(result => {
          console.log('output: ', result)
        })
  


# react-native-js-background-thread
Only work on iOS

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


#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNReactNativeJsBackgroundThread.sln` in `node_modules/react-native-js-background-thread/windows/RNReactNativeJsBackgroundThread.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using React.Native.Js.Background.Thread.RNReactNativeJsBackgroundThread;` to the usings at the top of the file
  - Add `new RNReactNativeJsBackgroundThreadPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
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
  

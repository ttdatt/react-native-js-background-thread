import {NativeModules} from 'react-native';

const {RNReactNativeJsBackgroundThread} = NativeModules;

export function runAsync(func, functionName, args = []) {
  return RNReactNativeJsBackgroundThread.runAsyncCode(func.toString(), functionName, args)
}

export default RNReactNativeJsBackgroundThread;

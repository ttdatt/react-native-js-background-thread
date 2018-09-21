
package com.reactlibrary;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;

import org.liquidplayer.javascript.JSContext;
import org.liquidplayer.javascript.JSFunction;
import org.liquidplayer.javascript.JSValue;

public class RNReactNativeJsBackgroundThreadModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    JSContext jsContext;

    public RNReactNativeJsBackgroundThreadModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
        jsContext = new JSContext();
    }

    @Override
    public String getName() {
        return "RNReactNativeJsBackgroundThread";
    }

    @ReactMethod
    public void runAsyncCode(final String func, final String funcName, final ReadableArray args, final Promise promise) {
        Runnable r = new Runnable() {
            @Override
            public void run() {
                try {
                    jsContext.evaluateScript(func);
                    JSFunction function = jsContext.property(funcName).toFunction();
                    JSValue value = function.call(null, args.toArrayList().toArray());
                    promise.resolve(value.toString());
                } catch (Exception e) {
                    promise.resolve("");
                }
            }
        };

        new Thread(r).start();
    }
}
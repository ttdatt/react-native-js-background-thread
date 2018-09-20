using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace React.Native.Js.Background.Thread.RNReactNativeJsBackgroundThread
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNReactNativeJsBackgroundThreadModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNReactNativeJsBackgroundThreadModule"/>.
        /// </summary>
        internal RNReactNativeJsBackgroundThreadModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNReactNativeJsBackgroundThread";
            }
        }
    }
}

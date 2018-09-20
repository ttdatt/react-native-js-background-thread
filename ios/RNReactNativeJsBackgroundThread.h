
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <JavaScriptCore/JavaScriptCore.h>

@interface RNReactNativeJsBackgroundThread : NSObject <RCTBridgeModule>
@property (strong, nonatomic) JSContext *jsContext;
@end
  

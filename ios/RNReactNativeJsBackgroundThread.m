
#import "RNReactNativeJsBackgroundThread.h"

@implementation RNReactNativeJsBackgroundThread {
    dispatch_queue_t myQueue;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

+ (BOOL)requiresMainQueueSetup {
    return NO;
}

- (instancetype)init  {
    self = [super init];
    if (self) {
        self.jsContext = [[JSContext alloc] init];
        myQueue = dispatch_queue_create("asyncJSQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

RCT_EXPORT_METHOD(runAsyncCode:(NSString *)jsFunc funcName:(NSString *)funcName arg:(NSArray *)arg resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    
    dispatch_async(myQueue, ^{
        @try {
            [self.jsContext evaluateScript:jsFunc];
            JSValue *func = [self.jsContext objectForKeyedSubscript:funcName];
            
            NSString *result = [[func callWithArguments:arg] toString];
            resolve(result);
            
        } @catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
            resolve(@"");
        }
    });
}

@end
  

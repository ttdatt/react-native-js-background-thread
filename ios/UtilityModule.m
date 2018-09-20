//
//  UtilityModule.m
//  ConvertContact
//
//  Created by dat tran on 9/20/18.
//

#import "UtilityModule.h"

@implementation UtilityModule {
  dispatch_queue_t myQueue;
}

RCT_EXPORT_MODULE();

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

- (instancetype)init  {
  self = [super init];
  if (self) {
    //    self.jsVM = [[JSVirtualMachine alloc] init];
    //    self.jsContext = [[JSContext alloc] initWithVirtualMachine:self.jsVM];
    self.jsContext = [[JSContext alloc] init];
    myQueue = dispatch_queue_create("asyncJSQueue", DISPATCH_QUEUE_SERIAL);
  }
  return self;
}

//- (NSArray<NSString *> *)supportedEvents {
//  return @[];
//}
//
//- (NSDictionary *)constantsToExport {
//  return @{
//           };
//}

RCT_EXPORT_METHOD(runAsyncCode:(NSString *)jsFunc funcName:(NSString *)funcName arg:(NSArray *)arg resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
  
  dispatch_sync(myQueue, ^{
    @try {
      [self.jsContext evaluateScript:jsFunc];
      JSValue *func = [self.jsContext objectForKeyedSubscript:funcName];
      
      NSString *result = [[func callWithArguments:arg] toString];
      resolve(result);
      
    } @catch (NSException *exception) {
      NSLog(@"%@", exception.reason);
    } @finally {
      
    }
  });
}

@end

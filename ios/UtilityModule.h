//
//  UtilityModule.h
//  ConvertContact
//
//  Created by dat tran on 9/20/18.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <React/RCTBridgeModule.h>
//#import <React/RCTEventEmitter.h>
#import <React/RCTUtils.h>

NS_ASSUME_NONNULL_BEGIN

@interface UtilityModule : NSObject<RCTBridgeModule>
@property (strong, nonatomic) JSContext *jsContext;
@property (strong, nonatomic) JSVirtualMachine *jsVM;
@end

NS_ASSUME_NONNULL_END

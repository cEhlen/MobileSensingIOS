//
//  CallbackToUrl.h
//  Prot01
//
//  Created by Christoph Ehlen on 5/13/13.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CallbackToUrl : CDVPlugin

- (void)callbackToUrl:(CDVInvokedUrlCommand*)command;

@end

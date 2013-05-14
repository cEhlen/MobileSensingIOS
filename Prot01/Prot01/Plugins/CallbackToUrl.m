//
//  CallbackToUrl.m
//  Prot01
//
//  Created by Christoph Ehlen on 5/13/13.
//
//

#import "CallbackToUrl.h"

@implementation CallbackToUrl

- (void)callbackToUrl:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* cmd = [command.arguments objectAtIndex:0];

    if (cmd != nil && [cmd length] > 0) {
        UIApplication* ourApp = [UIApplication sharedApplication];
        NSString* returnText = [command.arguments objectAtIndex:1];
        NSString* returnPath = [NSString stringWithFormat:@"%@://?data=%@",  [command.arguments objectAtIndex:0], returnText];
        NSURL* returnUrl = [NSURL URLWithString:returnPath];
        if ([ourApp canOpenURL:returnUrl]) {
            [ourApp openURL:returnUrl];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:cmd];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end

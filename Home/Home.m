//
//  Home.m
//  Home
//
//  Created by mike on 2017/9/21.
//  Copyright © 2017年 mike. All rights reserved.
//

#import "Home.h"
#import <Module/Module.h>
#import <Router/Router.h>

@interface Home: NSObject <Module>
@end

@implementation Home
+(NSArray*) Interfaces{
    return nil;
}
+(BOOL) loadWhenStart{
    return YES;
}
-(id) initWithInjection:(id<ModuleInjection>) injection{
    self = [super init];
    if (self) {
        id<Router> router = [injection instanceForInterface:@protocol(Router)];
        id<Router> homeRouter = [router addSubRouter:@"/home"];
        [homeRouter addRouter:@"/index" competent:^UIViewController *(NSString *p, NSDictionary *pp) {
            UIStoryboard * board = [UIStoryboard storyboardWithName:@"Home" bundle:[NSBundle bundleForClass:[self class]]];
            return [board instantiateViewControllerWithIdentifier:@"home"];
        }];
    }
    return self;
}
@end

ModuleLoader(Home)

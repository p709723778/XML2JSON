//
//  LVAppDelegate.m
//  XML2JSON
//
//  Created by lvyile on 8/23/12.
//  Copyright (c) 2012 lvyile. All rights reserved.
//

#import "LVAppDelegate.h"
#import "XMLReader.h"

@implementation LVAppDelegate

-(void)test {
    
    //XML文本范例
    NSString *testXMLString = @"<items><item id=\"0001\" type=\"donut\"><name>Cake</name><ppu>0.55</ppu><batters><batter id=\"1001\">Regular</batter><batter id=\"1002\">Chocolate</batter><batter id=\"1003\">Blueberry</batter></batters><topping id=\"5001\">None</topping><topping id=\"5002\">Glazed</topping><topping id=\"5005\">Sugar</topping></item></items>";
    
    NSLog(@"xml string[\n%@\n]", testXMLString);
    // 解析XML为NSDictionary
    NSError *parseError = nil;
    NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:testXMLString error:&parseError];
    // 打印 NSDictionary
    NSLog(@"%@", xmlDictionary);
    
    //NSDictionary转换为Data
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:xmlDictionary options:NSJSONWritingPrettyPrinted error:&parseError];
    
    //Data转换为JSON
    NSString* str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSLog(@"jsonData string[\n%@\n]", str);
    //字符组转换为NSDictionary
    NSDictionary *jsonDict = [str objectFromJSONString];
    
    //NSDictionary转换为XML的plist格式
    NSData *xmlData = [NSPropertyListSerialization dataFromPropertyList:jsonDict
                                                                 format:NSPropertyListXMLFormat_v1_0
                                                       errorDescription:NULL];
    
    //Data转换为NSString输出 编码为UTF-8
    NSLog(@"XML: %@", [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding]);
    
    
    /**
     *	@brief	NSDictionary转换为XML字符串
     *
     *	@param 	@"%@" 	输出XML字符串
     *	@param 	withHeader:NO] 	是否包含XML头消息
     *
     *	@return	字符串
     */
    NSLog(@"%@",[XMLWriter XMLStringFromDictionary:jsonDict withHeader:NO]);

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self test];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

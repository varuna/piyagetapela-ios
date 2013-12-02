//
//  Utils.h
//  Piyagetapela
//
//  Created by Varuna Raghunath Lekamwasam on 12/2/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Utils : NSObject

+ (NSString * ) kTemplateURL;

+ (BOOL) isDownloadedAudioFileExist:(NSString*) name;
+ (NSString *) getFileAbsolutePath:(NSString *)name inDir:(NSString *)dir ofType:(NSString*)type;
+ (void) mkdir:(NSString*)name;
+(void) removeFile:(NSString *)inDir file:(NSString*)name ofType:(NSString*)type;
@end

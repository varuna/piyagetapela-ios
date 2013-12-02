//
//  Utils.m
//  Piyagetapela
//
//  Created by Varuna Raghunath Lekamwasam on 12/2/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSString *) kTemplateURL{
    return  @"http://piyagetapela.com";
}


+(BOOL) isDownloadedAudioFileExist:(NSString *)name
{
    NSString * file = [Utils getFileAbsolutePath:name inDir:@"sermons" ofType:@"mp3"];
    return [[NSFileManager defaultManager] fileExistsAtPath:file];
}

+(NSString *) getFileAbsolutePath:(NSString *)name inDir:(NSString *)dir ofType:(NSString*)type{
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * component = [NSString stringWithFormat:@"%@/%@.%@",dir,name,type];
    return [path stringByAppendingPathComponent:component];
}

+(void) mkdir:(NSString*)name
{
    NSError *err;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/",name]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]){
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&err];
    }
}

+(void) removeFile:(NSString *)inDir file:(NSString*)name ofType:(NSString*)type
{
    NSError *err;
    [[NSFileManager defaultManager] removeItemAtPath:[Utils getFileAbsolutePath:name inDir:inDir ofType:type ] error:&err];
}
@end

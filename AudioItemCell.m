//
//  AudioItemCell.m
//  Piyagetapela
//
//  Created by Varuna Raghunath Lekamwasam on 12/2/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import "AudioItemCell.h"

@implementation AudioItemCell

@synthesize makeAvailableOfflineSwitch,fileDownloadProgress,Uri,audioData;

NSURLConnection * connection;
long long expectedBytes;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

-(void)prepare{
    [fileDownloadProgress setProgress:0.0f];
    if ([Utils isDownloadedAudioFileExist:self.textLabel.text])
    {
        [makeAvailableOfflineSwitch setOn:YES];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)makeAvailableOffline:(id)sender {
    if ([makeAvailableOfflineSwitch isOn])
    {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[Utils kTemplateURL],Uri]];
        [self downloadWithNsurlconnection:url];
    }else{
        [Utils removeFile:@"sermons" file:self.textLabel.text ofType:@"mp3"];
    }
}

-(void)downloadWithNsurlconnection:(NSURL *)url
{
    if (connection != nil){
        [connection cancel];
        connection = nil;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    audioData = [[NSMutableData alloc] initWithLength:0];
    connection =[[NSURLConnection alloc] initWithRequest:theRequest delegate:self startImmediately:YES];
    [fileDownloadProgress setProgressTintColor:[UIColor grayColor]];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [audioData setLength:0];
    expectedBytes = [response expectedContentLength];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [audioData appendData:data];
    float progressive = (float)[data length] / (float)expectedBytes;
    [fileDownloadProgress setProgress:progressive];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (NSCachedURLResponse *) connection:(NSURLConnection *)connection willCacheResponse:    (NSCachedURLResponse *)cachedResponse {
    return nil;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self saveFileToDisk:audioData filename:self.textLabel.text];
}

-(void) saveFileToDisk:(NSData *)data filename:(NSString *)name
{
    [Utils mkdir:@"sermons"];
    [audioData writeToFile:[Utils getFileAbsolutePath:name inDir:@"sermons" ofType:@"mp3"] atomically:YES];
}

@end

//
//  DeshanaListViewController.m
//  Piyagetapela
//
//  Created by Varuna Raghunath Lekamwasam on 11/29/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import "DeshanaListViewController.h"
NSString * kTemplateURL = @"http://piyagetapela.com";

@interface DeshanaListViewController ()

@end

@implementation DeshanaListViewController

@synthesize audioItemList,player,expectedBytes,currentPercentage,trackTitle;
NSMutableData * receivedData;

-(void) viewDidLoad{
    self.theroName.text = self.name;
    self.theroImage.image = self.image;
    self.title = self.name;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return audioItemList.count;
}

-(UITableViewCell* ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"audioitem" forIndexPath:indexPath];
    NSDictionary * currentRowAudio = [audioItemList objectAtIndex:indexPath.row];
    cell.textLabel.text = [currentRowAudio objectForKey:@"title"];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * selectedRowAudio = [audioItemList objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kTemplateURL,(NSString*)[selectedRowAudio objectForKey:@"mp3"]]];
    trackTitle = [[audioItemList objectAtIndex:indexPath.row] objectForKey:@"title"];
    currentPercentage = 0;
    [self downloadWithNsurlconnection:url];
}

-(void)downloadWithNsurlconnection:(NSURL *)url
{
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    receivedData = [[NSMutableData alloc] initWithLength:0];
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self     startImmediately:YES];
}


- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [receivedData setLength:0];
    expectedBytes = [response expectedContentLength];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
    float progressive = (float)[receivedData length] / (float)expectedBytes;
    NSLog(@"%f",progressive);
    int percentage = (round(progressive * 10.0)/10.0) * 100;
    NSLog(@"%d",percentage);
    if (currentPercentage < percentage)
    {
        currentPercentage = percentage;
    }
    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

- (NSCachedURLResponse *) connection:(NSURLConnection *)connection willCacheResponse:    (NSCachedURLResponse *)cachedResponse {
    return nil;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pdfPath = [documentsDirectory stringByAppendingPathComponent:[@"sermon" stringByAppendingString:@".mp3"]];
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [receivedData writeToFile:pdfPath atomically:YES];
    NSError *err;
    player = [[AVAudioPlayer alloc]initWithData:receivedData error:&err];
    [player prepareToPlay];
    [player play];
}
@end

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

@synthesize audioItemList,player,expectedBytes,trackTitle;
@synthesize nowPlaying,playPause,next,previouse,progress;

NSURLConnection * connection;
NSTimer * timer;
NSMutableData * receivedData;
NSUInteger currentIndex;
bool isDownloadingComplete,shouldSaveToDisk;

-(void) viewDidLoad{
    self.theroName.text = self.name;
    self.theroImage.image = self.image;
    self.title = self.name;
    [progress setProgress:0.0f];
    currentIndex = 0;
    isDownloadingComplete = NO;
    shouldSaveToDisk = NO;
    nowPlaying.text = @"";
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
    [self playIndex:indexPath.row];
}

-(void) playIndex:(NSUInteger) index{
    NSDictionary * selectedRowAudio = [audioItemList objectAtIndex:index];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kTemplateURL,(NSString*)[selectedRowAudio objectForKey:@"mp3"]]];
    trackTitle = [[audioItemList objectAtIndex:index] objectForKey:@"title"];
    nowPlaying.text = [NSString stringWithFormat:@"Now downloading : %@",trackTitle];
    currentIndex = index;
    
    [self downloadWithNsurlconnection:url];
}

-(void)downloadWithNsurlconnection:(NSURL *)url
{
    if (connection != nil){
        [connection cancel];
        connection = nil;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    receivedData = [[NSMutableData alloc] initWithLength:0];
    connection =[[NSURLConnection alloc] initWithRequest:theRequest delegate:self startImmediately:YES];
    [progress setProgressTintColor:[UIColor grayColor]];
}


- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [receivedData setLength:0];
    expectedBytes = [response expectedContentLength];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
    float progressive = (float)[receivedData length] / (float)expectedBytes;
    [progress setProgress:progressive];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (NSCachedURLResponse *) connection:(NSURLConnection *)connection willCacheResponse:    (NSCachedURLResponse *)cachedResponse {
    return nil;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [progress setProgressTintColor:[UIColor blueColor]];
    [progress setProgress:0.0f];
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSError *err;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                             target:self
                                           selector:@selector(updatePlayProgress:)
                                           userInfo:nil
                                            repeats:YES];
    
    player = [[AVAudioPlayer alloc]initWithData:receivedData error:&err];
    [player setDelegate:self];
    nowPlaying.text = [NSString stringWithFormat:@"Now playing : %@",trackTitle];
    [player prepareToPlay];
    [player play];
    [playPause setBackgroundImage:[UIImage imageNamed:@"pauseButton"] forState:UIControlStateNormal];
    
    if (shouldSaveToDisk)
    {
        [self saveFileToDisk:receivedData filename:trackTitle];
    }
}

-(void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [timer invalidate];
    timer = nil;
}

-(void) updatePlayProgress:(NSTimer*)timer{
    NSTimeInterval duration = [player duration];
    NSTimeInterval current = [player currentTime];
    [progress setProgress:current/duration];
    
}
- (IBAction)onPreviousSelected:(id)sender {
    if (currentIndex > 0){
        [self stopPlaying];
        [self playIndex:--currentIndex];
    }
    
}

-(void) stopPlaying{
    if([player isPlaying]){
        nowPlaying.text = @"";
        [player stop];
        [timer invalidate];
        timer = nil;
    }
    
}

- (IBAction)onPlayPauseSelected:(id)sender {
    if ([player isPlaying])
    {
        [player pause];
        [playPause setBackgroundImage:[UIImage imageNamed:@"playButton"] forState:UIControlStateNormal];
    }else{
        [player play];
        [playPause setBackgroundImage:[UIImage imageNamed:@"pauseButton"] forState:UIControlStateNormal];
    }
}

- (IBAction)onNextSelected:(id)sender {
    if (currentIndex < audioItemList.count - 1)
    {
        [self stopPlaying];
        [self playIndex:++currentIndex];
    }
    
}

- (IBAction)onSaveToDiskStatusChanged:(id)sender {
    shouldSaveToDisk = YES;
    if (isDownloadingComplete)
    {
        [self saveFileToDisk:receivedData filename:trackTitle];
    }
}

-(void) saveFileToDisk:(NSData *)data filename:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString * file = [NSString stringWithFormat:@"sermons/%@.mp3",name];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:file];
    NSLog(@"%@",filePath);
    [receivedData writeToFile:filePath atomically:YES];
}

-(void) viewWillDisappear:(BOOL)animated
{
    if (connection != nil)
    {
        [connection cancel];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    if (timer != nil)
    {
        [timer invalidate];
    }
    [self stopPlaying];
}
@end

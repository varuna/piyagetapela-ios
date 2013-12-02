//
//  DeshanaListViewController.m
//  Piyagetapela
//
//  Created by Varuna Raghunath Lekamwasam on 11/29/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import "DeshanaListViewController.h"

@interface DeshanaListViewController ()

@end

@implementation DeshanaListViewController

@synthesize audioItemList,player,expectedBytes,trackTitle;
@synthesize nowPlaying,playPause,next,previouse,progress,saveToDisk,playerBackground,tableViewBottomSpacingContraint;

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
    shouldSaveToDisk = [saveToDisk isOn];
    nowPlaying.text = @"";
    [self togglePlayerControls:NO];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return audioItemList.count;
}

-(UITableViewCell* ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AudioItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"audioitem" forIndexPath:indexPath];
    NSDictionary * currentRowAudio = [audioItemList objectAtIndex:indexPath.row];
    cell.textLabel.text = [currentRowAudio objectForKey:@"title"];
    [cell prepare];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self togglePlayerControls:YES];
    [self playIndex:indexPath.row];
}

-(void) playIndex:(NSUInteger) index{
    NSDictionary * selectedRowAudio = [audioItemList objectAtIndex:index];
    
    trackTitle = [[audioItemList objectAtIndex:index] objectForKey:@"title"];
    NSData * fileData = [self loadFileData:trackTitle];
    if (fileData != nil)
    {
        [self playData:fileData isCachedData:YES];
    }else{
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[Utils kTemplateURL],(NSString*)[selectedRowAudio objectForKey:@"mp3"]]];
        nowPlaying.text = [NSString stringWithFormat:@"Now downloading : %@",trackTitle];
        currentIndex = index;
        [self downloadWithNsurlconnection:url];
    }
}

-(void) togglePlayerControls:(BOOL)makevisible{
    [playerBackground setHidden:!makevisible];
    [next setHidden:!makevisible];
    [playPause setHidden:!makevisible];
    [previouse setHidden:!makevisible];
    [progress setHidden:!makevisible];
    if (!makevisible)
    {
        tableViewBottomSpacingContraint.constant = 0;
    }else{
        tableViewBottomSpacingContraint.constant = 100;
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
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self playData:receivedData isCachedData:NO];
}
-(void) playData:(NSData*)trackData isCachedData:(BOOL)isCachedData{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                             target:self
                                           selector:@selector(updatePlayProgress:)
                                           userInfo:nil
                                            repeats:YES];

    [progress setProgressTintColor:[UIColor blueColor]];
    [progress setProgress:0.0f];
    NSError *err;
    player = [[AVAudioPlayer alloc]initWithData:trackData error:&err];
    [player setDelegate:self];
    nowPlaying.text = [NSString stringWithFormat:@"Now playing : %@",trackTitle];
    [player prepareToPlay];
    [player play];
    [playPause setBackgroundImage:[UIImage imageNamed:@"pauseButton"] forState:UIControlStateNormal];
    
    if (shouldSaveToDisk && !isCachedData)
    {
        [self saveFileToDisk:trackData filename:trackTitle];
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
    
    shouldSaveToDisk = [saveToDisk isOn];
    if (isDownloadingComplete)
    {
        [self saveFileToDisk:receivedData filename:trackTitle];
    }
}

-(NSData *) loadFileData:(NSString*)name{
    bool isFileExist = [Utils isDownloadedAudioFileExist:name];
    if (isFileExist)
    {
        return [[NSFileManager defaultManager] contentsAtPath:[Utils getFileAbsolutePath:name inDir:@"sermons" ofType:@"mp3" ]];
    }
    return nil;
}

-(void) saveFileToDisk:(NSData *)data filename:(NSString *)name
{
    [Utils mkdir:@"sermons"];
    [receivedData writeToFile:[Utils getFileAbsolutePath:name inDir:@"sermons" ofType:@"mp3"] atomically:YES];
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

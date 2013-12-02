//
//  DeshanaListViewController.h
//  Piyagetapela
//
//  Created by Varuna Raghunath Lekamwasam on 11/29/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVPlayer.h>
#import <MediaPlayer/MPMusicPlayerController.h>
#import <MediaPlayer/MPMoviePlayerController.h>

@interface DeshanaListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,AVAudioPlayerDelegate,NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *theroImage;
@property (weak, nonatomic) IBOutlet UILabel *theroName;


@property (retain,nonatomic) NSString * name;
@property (retain,nonatomic) UIImage * image;
@property (retain,nonatomic) NSArray * audioItemList;

@property (weak, nonatomic) IBOutlet UILabel *nowPlaying;
@property (weak, nonatomic) IBOutlet UIButton * previouse;
@property (weak, nonatomic) IBOutlet UIButton * next;
@property (weak, nonatomic) IBOutlet UIButton * playPause;
@property (weak, nonatomic) IBOutlet UIProgressView * progress;
- (IBAction)onPreviousSelected:(id)sender;
- (IBAction)onPlayPauseSelected:(id)sender;
- (IBAction)onNextSelected:(id)sender;
- (IBAction)onSaveToDiskStatusChanged:(id)sender;

@property long long expectedBytes;
@property int currentPercentage;
@property NSString * trackTitle;

@property (retain,nonatomic) AVAudioPlayer * player;

@end

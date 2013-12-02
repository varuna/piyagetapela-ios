//
//  AudioItemCell.h
//  Piyagetapela
//
//  Created by Varuna Raghunath Lekamwasam on 12/2/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"

@interface AudioItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *makeAvailableOfflineSwitch;
- (IBAction)makeAvailableOffline:(id)sender;
@property (weak, nonatomic) IBOutlet UIProgressView *fileDownloadProgress;
-(void) prepare;

@property (nonatomic) NSString * Uri;
@property (nonatomic) NSMutableData * audioData;
@end

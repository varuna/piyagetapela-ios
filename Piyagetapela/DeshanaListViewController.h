//
//  DeshanaListViewController.h
//  Piyagetapela
//
//  Created by Varuna Raghunath Lekamwasam on 11/29/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeshanaListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *theroImage;
@property (weak, nonatomic) IBOutlet UILabel *theroName;

@end

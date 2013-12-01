//
//  TheroItemCell.h
//  Piyagetapela
//
//  Created by Varuna Lekamwasam on 11/28/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TheroItemCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet NSString *key;

@end

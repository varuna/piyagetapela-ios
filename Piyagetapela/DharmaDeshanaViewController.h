//
//  DharmaDeshanaViewController.h
//  Piyagetapela
//
//  Created by Varuna Lekamwasam on 11/28/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheroItemCell.h"
#import "DeshanaListViewController.h"
@interface DharmaDeshanaViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (retain,nonatomic) NSDictionary * data;
@end

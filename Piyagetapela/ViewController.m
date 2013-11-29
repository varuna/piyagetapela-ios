//
//  ViewController.m
//  Piyagetapela
//
//  Created by Varuna Lekamwasam on 11/27/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeMenuItemCell * cell = (HomeMenuItemCell* )[collectionView dequeueReusableCellWithReuseIdentifier:@"home_item" forIndexPath:indexPath];

    NSString * title;
    NSString * imageURI;
    switch (indexPath.row) {
        case 0:
            title = @"ධර්ම දේශනා";
            imageURI = @"sermons.png";
            break;
        case 1:
            title = @"වැඩසටහන්";
            imageURI = @"dharmachakra.png";
            break;
        case 2:
            title = @"සදහම් ලිපි";
            imageURI = @"neluma.png";
            break;
            
        default:
            title = @"";
            imageURI = @"";
            break;

    }
    cell.label.text = title;
    cell.image.image = [UIImage imageNamed:imageURI];
    
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * controller;
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    switch (indexPath.row) {
        case 0:
            controller = [storyboard instantiateViewControllerWithIdentifier:@"dharmadeshana"];
            break;
        case 1:
            controller = [storyboard instantiateViewControllerWithIdentifier:@"programs"];
            break;
        case 2:
            controller = [storyboard instantiateViewControllerWithIdentifier:@"sadahamlipi"];
            break;
            
        default:
            controller = [[DharmaDeshanaViewController alloc]init];
            break;
            
    }
    [self.navigationController pushViewController:controller animated:YES];
}

@end

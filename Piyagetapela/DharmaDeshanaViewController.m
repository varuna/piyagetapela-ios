//
//  DharmaDeshanaViewController.m
//  Piyagetapela
//
//  Created by Varuna Lekamwasam on 11/28/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//

#import "DharmaDeshanaViewController.h"

@interface DharmaDeshanaViewController ()

@end

@implementation DharmaDeshanaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TheroItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"thero" forIndexPath:indexPath];
    NSString * imageURI,*label;
    switch (indexPath.row) {
        case 0:
            imageURI = @"bulathsinghala-sumangala-thero.png";
            label = @"බුලත්සිංහල සුමන ස්වාමීන් වහන්සේ";
            break;
        case 1:
            imageURI = @"dasawatte-sumanaseela-thero.png";
            label = @"දසවත්තේ සුමනසීල​ ස්වාමීන් වහන්සේ";
            break;
        case 2:
            imageURI = @"kadawedduwa-sri-jinawansha-thero.png";
            label = @"කඩවැද්දුව ශ්‍රී ජිනවංශ​ ස්වාමීන් වහන්සේ";
            break;
        case 3:
            imageURI = @"kahagolle-somawansha-thero.png";
            label = @"කහගොල්ලේ සෝමවංශස ස්වාමීන් වහන්සේ";
            break;
        case 4:
            imageURI = @"kehellpannala-sumana-thero.png";
            label = @"කෙහෙල්පන්නල සුමන ස්වාමීන් වහන්සේ";
            break;
        case 5:
            imageURI = @"kelaniye-vipulagana-thero.png";
            label = @"කැළණියේ විපුලඥාන​ ස්වාමීන් වහන්සේ";
            break;
        case 6:
            imageURI = @"laggala-kalyanawansa-thero.png";
            label = @"ලග්ගල කල්‍යාණවංශ​ ස්වාමීන් වහන්සේ";
            break;
        case 7:
            imageURI = @"matara-sri-gnanarama-thero.png";
            label = @"මාතර ශ්‍රී ඥානාරාම​ ස්වාමීන් වහන්සේ";
            break;
        case 8:
            imageURI = @"meethalawe-wineetha-thero.png";
            label = @"මීතලාවේ විනීත​ ස්වාමීන් වහන්සේ";
            break;
        case 9:
            imageURI = @"na-uyane-ariyadhamma-thero.png";
            label = @"නා උයනේ අරියධම්ම​ ස්වාමීන් වහන්සේ";
            break;
        case 10:
            imageURI = @"rahathungoda-bodhirathana-thero.png";
            label = @"රහතුන්ගොඩ බෝධිරතන​ ස්වාමීන් වහන්සේ";
            break;
        default:
            break;
    }
    
    cell.image.image = [UIImage imageNamed:imageURI];
    cell.label.text = label;
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"sermonsOfThero"])
    {
        DeshanaListViewController * viewController = [segue destinationViewController];
        TheroItemCell * sendby = (TheroItemCell *)sender;
        NSLog(@"%@",sendby.label.text);
        viewController.theroImage.image = [UIImage imageWithCGImage:sendby.image.image.CGImage];
        viewController.theroName.text = [NSString stringWithString:sendby.label.text];
    }
}



@end

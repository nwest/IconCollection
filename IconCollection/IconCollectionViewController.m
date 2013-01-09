//
//  IconCollectionViewController.m
//  IconCollection
//
//  Created by Nate West on 1/4/13.
//  Copyright (c) 2013 Nate West. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

#import "IconCollectionViewController.h"
#import "IconCell.h"

@interface IconCollectionViewController ()

@end

@implementation IconCollectionViewController {
    NSArray *_letters;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!_letters) {
        NSString *alpha = @"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
        NSMutableArray *letters = [NSMutableArray arrayWithCapacity:[alpha length]];
        for (NSUInteger i=0; i<[alpha length]; i++) {
            [letters addObject:[alpha substringWithRange:NSMakeRange(i, 1)]];
        }
        _letters = [letters copy];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return [_letters count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IconCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Icon" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[IconCell alloc] init];
    }
    
    cell.iconLabel.text = [_letters objectAtIndex:indexPath.row];
    
    cell.iconLabel.font = [UIFont fontWithName:@"climacons" size:110.0f];
    cell.iconLabel.textColor = [UIColor colorWithHue:0.583 saturation:1.000 brightness:0.502 alpha:1.000];
    
    CFStringRef string = (__bridge CFStringRef)(cell.iconLabel.text);
    CGFontRef graphicsFont = CGFontCreateWithFontName((__bridge CFStringRef)(cell.iconLabel.font.fontName));
    CGGlyph glyph = CGFontGetGlyphWithGlyphName(graphicsFont, string);
    
    CGAffineTransform flip = CGAffineTransformMake(1, 0, 0, -1, 0, 0);
    CTFontRef textFont = CTFontCreateWithGraphicsFont(graphicsFont, cell.iconLabel.font.pointSize, &flip, NULL);
    CGFontRelease(graphicsFont);
    
    CGAffineTransform translation = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0f, cell.iconLabel.font.pointSize);
    
    CGPathRef path = CTFontCreatePathForGlyph(textFont, glyph, &translation);
    CFRelease(textFont);
    
    cell.iconLabel.layer.shadowPath = path;
    CGPathRelease(path);
    
    cell.iconLabel.layer.shadowColor = [[UIColor redColor] CGColor];
    cell.iconLabel.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    cell.iconLabel.layer.shadowRadius = 2.0f;
    cell.iconLabel.layer.shadowOpacity = 1.0f;
    
    cell.iconLabel.layer.shouldRasterize = YES;
    cell.iconLabel.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //CGFloat length = (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * 60) + 60;
    CGFloat length = 150.0f;
    return CGSizeMake(length, length);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

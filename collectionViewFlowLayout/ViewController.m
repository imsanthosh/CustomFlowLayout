//
//  ViewController.m
//  collectionViewFlowLayout
//
//  Created by Santhosh on 15/09/15.
//  Copyright (c) 2015 Santhosh. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d",indexPath.item];
    
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

#pragma mark -  UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(200, 200);
    
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
    NSArray *cellsArray = [_collectionView visibleCells];
    
    CollectionViewCell *nearestCell = nil;
    
    CGFloat center = scrollView.contentOffset.x + CGRectGetWidth(scrollView.bounds)/2;
    
    for (CollectionViewCell *cell in cellsArray) {
        
        if(!nearestCell) {
            nearestCell = cell;
        } else {
            
            if(ABS(nearestCell.center.x -center) > ABS(cell.center.x) - center ) {
                nearestCell = cell;
            }
            
        }
    }
    
    [_collectionView scrollToItemAtIndexPath:[_collectionView indexPathForCell:nearestCell] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
    if(!decelerate) {
        NSArray *cellsArray = [_collectionView visibleCells];
        
        CollectionViewCell *nearestCell = nil;
        
        CGFloat center = scrollView.contentOffset.x + CGRectGetWidth(scrollView.bounds)/2;
        
        for (CollectionViewCell *cell in cellsArray) {
            
            if(!nearestCell) {
                nearestCell = cell;
            } else {
                
                if(ABS(nearestCell.center.x -center) > ABS(cell.center.x) - center ) {
                    nearestCell = cell;
                }
                
            }
        }
        
        [_collectionView scrollToItemAtIndexPath:[_collectionView indexPathForCell:nearestCell] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        

    }
    
}

@end

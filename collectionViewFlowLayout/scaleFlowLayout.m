//
//  scaleFlowLayout.m
//  collectionViewFlowLayout
//
//  Created by Santhosh on 15/09/15.
//  Copyright (c) 2015 Santhosh. All rights reserved.
//

#import "scaleFlowLayout.h"
#define Active_Distance 150

#define Zoom_Factor 0.3

@implementation scaleFlowLayout


- (void)prepareLayout {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 50;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(250*10, 250);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];
    
    
    CGRect visibleRect ;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
        
        if (CGRectIntersectsRect(attributes.frame, visibleRect)) {
            
            CGFloat distance = CGRectGetMidX(visibleRect) - CGRectGetMidX(attributes.frame);
            CGFloat normalizedDistance = distance/Active_Distance;
            
            if(ABS(distance) < Active_Distance) {
                
                CGFloat zoomX = 1 + Zoom_Factor *(1 - ABS(normalizedDistance));
                CGFloat zoomY = zoomX;
                
                
                NSLog(@"normalized distance : %f  and zoom factor  %f", normalizedDistance, zoomX);
                
                
                attributes.transform3D = CATransform3DMakeScale(zoomX, zoomY, 1.1);
                
                attributes.zIndex = ceilf(zoomX);
                
            }
            
        }
    }
    return attributesArray;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
//    CGFloat offsetAdjustment = MAXFLOAT;
//    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds))/2;
//    
//    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, CGRectGetHeight(self.collectionView.bounds));
//    
//    NSArray *array = [super layoutAttributesForElementsInRect:targetRect];
//    
//    for (UICollectionViewLayoutAttributes *attributes in array) {
//        CGFloat itemHorizontalCenter = attributes.center.x;
//        if(ABS(itemHorizontalCenter - horizontalCenter) < offsetAdjustment) {
//            offsetAdjustment = itemHorizontalCenter -horizontalCenter;
//            
//        }
//    }
//    
//    return CGPointMake(proposedContentOffset.x+offsetAdjustment,proposedContentOffset.y);
//    
//}
@end

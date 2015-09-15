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
    self.minimumLineSpacing = 40;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(240*10, 250);
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
@end

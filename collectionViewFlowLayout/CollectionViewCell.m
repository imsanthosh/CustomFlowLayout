//
//  CollectionViewCell.m
//  collectionViewFlowLayout
//
//  Created by Santhosh on 15/09/15.
//  Copyright (c) 2015 Santhosh. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell



- (void)awakeFromNib {
    
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(0, 15);
    self.layer.shadowRadius = 5;

    self.layer.shadowOpacity = 0.3;
    
    
    
    _redView.layer.masksToBounds = NO;
    _redView.layer.shadowOffset = CGSizeMake(-5, 3);
    _redView.layer.shadowRadius = 5;
    
    _redView.layer.shadowOpacity = 0.2;
}
@end

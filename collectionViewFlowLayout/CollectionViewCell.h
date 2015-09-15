//
//  CollectionViewCell.h
//  collectionViewFlowLayout
//
//  Created by Santhosh on 15/09/15.
//  Copyright (c) 2015 Santhosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

//
//  GoodImageView.h
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/16.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "GoodModel.h"
#import "SDPhotoBrowser.h"
#import "ImageCell.h"
@interface GoodImageView : ASDisplayNode<ASCollectionDataSource, ASCollectionDelegate,SDPhotoBrowserDelegate>
@property (nonatomic, strong) GoodModel *goodModel;
@property (nonatomic, strong) ASTextNode *goodTitleNode;
@property (nonatomic, strong) ASCollectionNode *collectionNode;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
- (instancetype)initWithCommentItem:(GoodModel *)goodModel;


@end

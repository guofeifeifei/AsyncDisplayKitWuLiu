//
//  OneCellNode.h
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/15.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "OrderModel.h"
#import "DateView.h"
#import "GoodImageView.h"
@interface OneCellNode : ASCellNode
@property (nonatomic, strong) DateView *dateNode;
@property (nonatomic, strong) ASTextNode *titleNode;
@property (nonatomic, strong) ASTextNode *descNode;
@property (nonatomic, strong) OrderModel *orderNodel;
@property (nonatomic, strong) NSArray *replayNodes;
@property (nonatomic, strong) NSIndexPath *index;
- (instancetype)initWithCommentItem:(OrderModel *)item indexPath:(NSIndexPath *)indexPath;

@end

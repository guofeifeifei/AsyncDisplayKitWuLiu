//
//  ImageCell.h
//  AsyncDiaplayKitWeixinQuan
//
//  Created by ZZCN77 on 2017/8/12.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
@interface ImageCell : ASCellNode
- (instancetype)initWithCommentItem:(NSString *)imageUrl;
// UI
@property (nonatomic, strong) ASImageNode *imageNode;
@end

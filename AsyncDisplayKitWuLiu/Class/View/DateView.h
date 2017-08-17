//
//  DateView.h
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/15.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface DateView : ASDisplayNode
@property (nonatomic, strong) ASDisplayNode *lineNode;
@property (nonatomic, strong) ASTextNode *timeNode;
@property (nonatomic, strong) ASTextNode *dateNode;
@property (nonatomic, strong) ASTextNode *dateNumNode;
@property (nonatomic, strong) ASImageNode *imgNode;
- (instancetype)initWithCommentItem:(NSString *)time date:(NSString *)date dateNum:(NSString *)dateNum;
@end

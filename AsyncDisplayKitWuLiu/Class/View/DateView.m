//
//  DateView.m
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/15.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "DateView.h"
@interface DateView(){
    NSString *_timeStr;
    NSString *_dateStr;
    NSString *_dateNumStr;
}

@end
@implementation DateView
- (instancetype)initWithCommentItem:(NSString *)time date:(NSString *)date dateNum:(NSString *)dateNum{
    if (self = [super init]) {
        _timeStr = time;
        _dateStr = date;
        _dateNumStr = dateNum;
        [self addLineNode];
        [self addTimeNode];
        [self addDateNode];
        [self addDateNumNode];
        [self addImageNode];
    }
    return self;
}
- (void)addLineNode{
    self.lineNode = [[ASDisplayNode alloc] init];
    self.lineNode.backgroundColor = KTColor;
    self.lineNode.layerBacked = YES;

    [self addSubnode:self.lineNode];
    
}
- (void)addTimeNode{
    self.timeNode = [[ASTextNode alloc] init];
    self.timeNode.layerBacked = YES;
    self.timeNode.maximumNumberOfLines = 0;
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15.0f] ,NSForegroundColorAttributeName:UIColorFromRGB(0x444444)};
    self.timeNode.attributedText = [[NSAttributedString alloc]initWithString:_timeStr attributes:attrs];
    [self addSubnode:self.timeNode];
}
- (void)addDateNode{
    self.dateNode = [[ASTextNode alloc] init];
    self.dateNode.layerBacked = YES;
    self.dateNode.maximumNumberOfLines = 0;
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15.0f] ,NSForegroundColorAttributeName:UIColorFromRGB(0x444444)};
    self.dateNode.attributedText = [[NSAttributedString alloc]initWithString:_dateStr attributes:attrs];
    [self addSubnode:self.dateNode];
}


- (void)addDateNumNode{
    self.dateNumNode = [[ASTextNode alloc] init];
    self.dateNumNode.layerBacked = YES;
    self.dateNumNode.maximumNumberOfLines = 0;
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15.0f] ,NSForegroundColorAttributeName:UIColorFromRGB(0x444444)};
    self.dateNumNode.attributedText = [[NSAttributedString alloc]initWithString:_dateNumStr attributes:attrs];
    [self addSubnode:self.dateNumNode];
}
- (void)addImageNode{
    self.imgNode = [[ASImageNode alloc] init];
    self.imgNode.image = [UIImage imageNamed:@"yuan.png"];
    self.imgNode.clipsToBounds = YES;
    self.imgNode.layerBacked = YES;
    [self addSubnode:self.imgNode];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    self.imgNode.style.preferredSize = CGSizeMake(25, 25);
    self.timeNode.style.flexShrink = YES;
    self.dateNode.style.flexShrink = YES;
    self.dateNumNode.style.flexShrink = YES;
 
    self.lineNode.style.preferredSize = CGSizeMake(1,constrainedSize.max.height);
     ASStackLayoutSpec *leftStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[self.timeNode, self.dateNode,self.dateNumNode]];
    leftStackLayout.style.flexGrow = YES;
    leftStackLayout.style.flexShrink  = YES;
    ASStackLayoutSpec *verStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[self.imgNode,self.lineNode]];
    verStackLayout.style.flexGrow = YES;
    verStackLayout.style.flexShrink  = YES;
        ASStackLayoutSpec *horStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[leftStackLayout, verStackLayout]];
    horStackLayout.style.flexGrow = YES;
    horStackLayout.style.flexShrink  = YES;

    return horStackLayout;
}


@end

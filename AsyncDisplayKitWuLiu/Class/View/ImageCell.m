//
//  ImageCell.m
//  AsyncDiaplayKitWeixinQuan
//
//  Created by ZZCN77 on 2017/8/12.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "ImageCell.h"
#define RGB_255(r,g,b) [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:1]
#define GFMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define GFMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define widthScale GFMainScreenWidth / 375.0
#define heightScale GFMainScreenHeight / 667.0
@interface ImageCell ()
// Data
@property (nonatomic, strong) NSString *imageUrl;


@end
@implementation ImageCell
- (instancetype)initWithCommentItem:(NSString *)imageUrl{
    
    if (self = [super init]) {
        _imageUrl = imageUrl;
        [self addImageNode];

    }
    return self;
    
}

- (void)addImageNode
{

    ASNetworkImageNode *imageNode = [[ASNetworkImageNode alloc]init];
    imageNode.placeholderEnabled = YES;
    imageNode.placeholderColor = RGB_255(245, 245, 245);
    imageNode.layerBacked = YES;
    imageNode.contentMode = UIViewContentModeScaleToFill;
    imageNode.defaultImage = [UIImage imageNamed:@"defult_pho"];
    imageNode.URL = [NSURL URLWithString:_imageUrl];
    [self addSubnode:imageNode];
    _imageNode = imageNode;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    _imageNode.style.preferredSize = CGSizeMake(90 *widthScale, 90 *widthScale);
    ASStackLayoutSpec *verStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:8 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[_imageNode]];
    return verStackLayout;
}

@end

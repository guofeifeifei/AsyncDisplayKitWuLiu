//
//  GoodImageView.m
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/16.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "GoodImageView.h"

@implementation GoodImageView
- (instancetype)initWithCommentItem:(GoodModel *)goodModel{
    if (self = [super init]) {
        self.goodModel = goodModel;
        [self addGoodTitleNode];
        [self addCollectionNode];
        
    }
    return self;
    
}
- (void)addGoodTitleNode{
    self.goodTitleNode = [[ASTextNode alloc] init];
    self.goodTitleNode.layerBacked = YES;
    self.goodTitleNode.maximumNumberOfLines = 0;
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15.0f] ,NSForegroundColorAttributeName:UIColorFromRGB(0x444444)};
    self.goodTitleNode.attributedText = [[NSAttributedString alloc]initWithString:self.goodModel.name attributes:attrs];
    [self addSubnode:self.goodTitleNode];

}

- (void)addCollectionNode
{
    _flowLayout     = [[UICollectionViewFlowLayout alloc] init];
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _flowLayout.itemSize = CGSizeMake(50 * widthScale ,50 * widthScale);
    _flowLayout.minimumLineSpacing = 10;
    self.collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:_flowLayout];
    self.collectionNode.backgroundColor = [UIColor whiteColor];
    self.collectionNode.userInteractionEnabled = YES;
    self.collectionNode.delegate = self;
    self.collectionNode.dataSource = self;
    [self addSubnode:self.collectionNode ];
    
}
#pragma mark - ASCollectionNode
- (void)layout{
    [super layout];
    _collectionNode.view.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}
- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section
{
    return self.goodModel.productImageArray.count;
}

- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return ^{
        ImageCell *imageCell = [[ImageCell alloc] initWithCommentItem:self.goodModel.productImageArray[indexPath.row]];
        return imageCell;
    };
}
- (void)collectionNode:(ASCollectionNode *)collectionNode didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击");
    SDPhotoBrowser *photoBrowser = [SDPhotoBrowser new];
    photoBrowser.delegate = self;
    photoBrowser.currentImageIndex = indexPath.row;
    photoBrowser.imageCount = self.goodModel.productImageArray.count;
    photoBrowser.sourceImagesContainerView = self.collectionNode.view;
    [photoBrowser show];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    self.goodTitleNode.style.flexShrink = YES;
    if (self.goodModel.productImageArray.count % 4 == 0) {
        CGSize collectionNodeSize = CGSizeMake(GFMainScreenWidth - 145*widthScale, 50 * widthScale * (self.goodModel.productImageArray.count / 4));
        _collectionNode.style.preferredSize = collectionNodeSize;
    }else{
        CGSize collectionNodeSize = CGSizeMake(GFMainScreenWidth - 145*widthScale, 50 *widthScale * (self.goodModel.productImageArray.count / 4 + 1));
        _collectionNode.style.preferredSize = collectionNodeSize;
    }
    ASStackLayoutSpec *verStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStretch children:@[self.goodTitleNode, _collectionNode]];
    
    return verStackLayout;
}
#pragma mark - SDPhotoBrowserDelegate

- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *urlString = self.goodModel.productImageArray[index];
    return [NSURL URLWithString:urlString];
}
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    ImageCell *imageCell = [self.collectionNode nodeForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    return imageCell.imageNode.image;
}

@end

# AsyncDisplayKitWuLiu
详细内容：http://www.jianshu.com/p/608fffd49bcf
===
![app.gif](/Image/app.gif)
最近学习AsyncDisplayKit的使用，现在将自己这几天的学习的成果记录一下，大家可以看一下，有什么不对的或者更好的方法大家也可以学习交流一下。AsyncDisplayKit的使用好处：在复杂布局的界面流畅丝毫不弱。（原理大家可以去看官方文档 http://texturegroup.org/docs/getting-started.html）

####第一天
AsyncDisplayKit的使用在官网上有相关的技术文档以及demo，自己可以边学习边看（网址：https://github.com/facebookarchive/AsyncDisplayKit）。第一天的第一步就是导入AsyncDisplayKit控件，我用的是cocoapod安装的直接pod 'AsyncDisplayKit' 就可以啦，也可以将我项目中的文件发直接拖过去用（demo在后面）。下面是AsyncDisplayKit的控件以及布局

|UIKit        | 节点容器           |
| :-------------: |:-------------:|
| `UICollectionView `    | [`ASCollectionNode`](http://texturegroup.org/docs/containers-ascollectionnode.html) |
|` UIPageViewController `  | [`ASPagerNode`](http://texturegroup.org/docs/containers-aspagernode.html)      |
| `UITableView`    |[`ASTableNode`](http://texturegroup.org/docs/containers-astablenode.html)   |
| `UIViewController `    |[`ASViewController`](http://texturegroup.org/docs/containers-asviewcontroller.html) |
|`UINavigationController`.|`ASNavigationController`Implements the [`ASVisibility`](http://texturegroup.org/docs/asvisibility.html) protocol.|
|`UITabBarController`|`ASTabBarController` Implements the [`ASVisibility`](http://texturegroup.org/docs/asvisibility.html) protocol|
|`UIView`|[`ASDisplayNode`](http://texturegroup.org/docs/display-node.html)|
|`UITableViewCell & UICollectionViewCell`|[ `ASCellNode`](http://texturegroup.org/docs/cell-node.html)|
|`UIScrollView`| [`ASScrollNode`](http://texturegroup.org/docs/scroll-node.html)|
|`UITextView`|[`ASEditableTextNode`](http://texturegroup.org/docs/editable-text-node.html)|
|`UILabel`|[`ASTextNode`](http://texturegroup.org/docs/text-node.html)|
|`UIImage`|[`ASImageNode`](http://texturegroup.org/docs/image-node.html), [`ASNetworkImageNode`](http://texturegroup.org/docs/network-image-node.html), [`ASMultiplexImageNode`](http://texturegroup.org/docs/multiplex-image-node.html)|
|`AVPlayerLayer`|[`ASVideoNode`](http://texturegroup.org/docs/video-node.html)|
|`UIMoviePlayer`|`ASVideoPlayerNode`|
|`UIButton`|[`ASButtonNode`](http://texturegroup.org/docs/button-node.html)|
|`MKMapView`|[`ASMapNode`](http://texturegroup.org/docs/map-node.html)|

ASLayoutSpec子类布局

|布局       | 作用          |
| :-------------: |:-------------|
|[`ASWrapperLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#aswrapperlayoutspec)| `ASWrapperLayoutSpec是一个简单的ASLayoutSpec子类，可以ASLayoutElement根据布局元素上设置的大小来包装和计算小孩的布局。ASWrapperLayoutSpec是轻松返回单个子节点的理想选择-layoutSpecThatFits:。可选地，该子节点可以设置大小信息。但是，如果您需要设置除了大小的位置，请ASAbsoluteLayoutSpec改用。`|
|[`ASStackLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#asstacklayoutspec-flexbox-container)| `Texture中的所有layoutSpecs中，ASStackLayoutSpec是最有用和最强大的。ASStackLayoutSpec使用flexbox算法来确定其子项的位置和大小。Flexbox旨在为不同的屏幕尺寸提供一致的布局。在堆叠布局中，您可以在垂直或水平堆叠中对齐项目。堆栈布局可以是另一个堆栈布局的子代，这使得可以使用堆栈布局规范创建几乎任何布局。ASStackLayoutSpec除了其<ASLayoutElement>属性，还有8个属性：1.direction:指定孩子被堆叠的方向。如果设置了horizo​​ntalAlignment和verticalAlignment，则它们将被再次解析，从而相应地更新justifyContent和alignItems。2.spacing:每个子节点之间的空间量。3.horizontalAlignment:指定子节点如何水平对齐。取决于堆栈方向，设置对齐将导致justifyContent或alignItems被更新。未来方向改变后，对齐将保持有效。因此，优选这些性质。4.verticalAlignment:指定子节点如何垂直对齐。取决于堆栈方向，设置对齐将导致justifyContentalignItems被更新。未来方向改变后，对齐将保持有效。因此，优选这些性质。5.justifyContent:每个子节点之间的空间量。6.alignItems:子节点内的横贯方向。7.flexWrap:子节点是否被堆叠成单行或多行。默认为单行。8.alignContent:如果有多条线，沿横轴的线的方向。`|
|[`ASInsetLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#asinsetlayoutspec)|`ASInsetLayoutSpec将其传递constrainedSize.max CGSize给其子节点，然后减去其插值。一旦子节点确定它的最终大小，插图规格将其最终大小按照其子节点的大小加上其插入边距。由于插图布局规范的大小基于其子节点的大小，因此子节点必须具有内在大小或明确设置其大小。`|
|[`ASOverlayLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#asoverlaylayoutspec)|`把它的子节点放在另一个组件上，作为叠加,覆盖规格的大小是根据子节点的大小计算的,子节点必须具有固有的大小或设置的大小(子节点在下面)`|
|[`ASBackgroundLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#asbackgroundlayoutspec)|`放置一个组件，将其后面的另一个组件作为背景展开。背景规格的大小根据子节点的大小计算,重要的是子节点必须具有固有的大小或设置的大小(子节点在上面)`|
|[`ASCenterLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#ascenterlayoutspec)|`ASCenterLayoutSpec其中心内最大的子节点constrainedSize，ASCenterLayoutSpec 有两个属性：centeringOptions：确定子节点在中心规格中居中的方式。选项包括：None，X​​，Y，XY。sizingOptions：确定中心规格将占用多少空间。选项包括：Default，最小X，最小Y，最小XY。`|
|[`ASRatioLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#asratiolayoutspec)|`可以扩展的固定长宽比布置组件。该规范必须有一个宽度或高度传递给它作为约束尺寸，因为它使用此值来缩放自身。`|
|[`ASRelativeLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#asrelativelayoutspec)|`根据垂直和水平位置说明符，放置组件并将其放置在布局边界内。类似于“9部分”图像区域，子节点可以位于四个角中的任何一个，也可以位于四个边中的任何一个以及中心。`|
|[`ASAbsoluteLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#asabsolutelayoutspec)|`在ASAbsoluteLayoutSpec您可以指定确切位置设定自己的（X / Y坐标）其子节点的layoutPosition`|
|[`ASLayoutSpec`](http://texturegroup.org/docs/layout2-layoutspec-types.html#asstacklayoutspec-flexbox-container)|`所有布局规范的子类的主类。主要工作是处理所有的子节点管理，但也可以用来创建自定义的布局规范。`|
####第二天
今天我大概分析一下我的页面布局，下图就是我的页面布局示意图，整体是ASTableNode搭建，里面一条一条内容我使用的是for循环创建ASDisPlayNode(绿色方框内的)，ASDisPlayNode中的图片是ASCollectionNode创建的。绿色部分我刚开始用的是ASTableNode,开始使用ASTableView控件但是在后面的ASCollectionNode点击事件不响应（具体原因我还不知道，大家如果有知道可以告诉我一下啊）
![1.png](http://upload-images.jianshu.io/upload_images/6694822-a8dc88e1ff92c5c0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####第三天
今天主要将页面搭建完成，以及数据加载，里面涉及到布局以及控件使用大家可以查考AsyncDisplayKit官方文档或者官方示例demo(如果官方示例demo不能运行记得将工程pod install 一下就行了)。下面是我的布局代码：
```-object-c

#import "OneCellNode.h"

@implementation OneCellNode
- (instancetype)initWithCommentItem:(OrderModel *)item indexPath:(NSIndexPath *)indexPath{
    if (self = [super init]) {
        self.index = indexPath;
        self.orderNodel = item;
        [self addDateNode];
        [self addTitleNode];
        [self addDescNode];
        [self addGoodNode];
    }
    return self;

}
- (void)addDateNode{
    self.dateNode = [[DateView alloc] initWithCommentItem:self.orderNodel.time date:self.orderNodel.date dateNum:self.orderNodel.dayCount];
    self.dateNode.backgroundColor = [UIColor whiteColor];
    [self addSubnode:self.dateNode];
}
- (void)addTitleNode{
    self.titleNode = [[ASTextNode alloc] init];
    self.titleNode.layerBacked = YES;
    self.titleNode.maximumNumberOfLines = 0;
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15.0f] ,NSForegroundColorAttributeName:UIColorFromRGB(0x444444)};
    self.titleNode.attributedText = [[NSAttributedString alloc]initWithString:self.orderNodel.title attributes:attrs];
    [self addSubnode:self.titleNode]; 
}
- (void)addDescNode{
    self.descNode = [[ASTextNode alloc] init];
    self.descNode.layerBacked = YES;
    self.descNode.maximumNumberOfLines = 0;
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15.0f] ,NSForegroundColorAttributeName:UIColorFromRGB(0x444444)};
    self.descNode.attributedText = [[NSAttributedString alloc]initWithString:self.orderNodel.desc attributes:attrs];
    [self addSubnode:self.descNode];  
}

- (void)addGoodNode{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.orderNodel.goodArray.count];
   //遍历循环创建每个商品条目
    for (int i = 0; i<self.orderNodel.goodArray.count; i++) {
                GoodImageView *node = [[GoodImageView alloc]initWithCommentItem:self.orderNodel.goodArray[i]];
                [self addSubnode:node];
                [array addObject:node];
            }
      _replayNodes = [array copy];
}
- (void)layout{
    [super layout];
    self.dateNode.frame = CGRectMake(0, 0, 130, self.frame.size.height);
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    NSMutableArray *rightArray =[[NSMutableArray alloc] initWithObjects:_titleNode, _descNode,nil];
    [rightArray addObjectsFromArray:_replayNodes];
    ASStackLayoutSpec *rightStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:8 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:rightArray];
    rightStackLayout.style.flexGrow = YES;
    rightStackLayout.style.flexShrink  = YES;
 //给dateNode节点一个宽度，高度可以随意
    self.dateNode.style.preferredSize =  CGSizeMake(130 ,100);
    self.dateNode.style.flexShrink = YES;
    ASStackLayoutSpec *horStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[self.dateNode,rightStackLayout]];
    horStackLayout.style.flexShrink = YES;
    return horStackLayout;
}

```
####第四天
项目已经完成了，功能也能实现了，但是关于纵向的紫色线条高度我一直没有搞定，紫色线条是一个ASDisplayNode控件，在页面中要设置他的高度否则不显示,最后找了一个方法在layout方法中固定其宽高，代码方法如下
```object-c
- (void)layout{
    [super layout];
    self.dateNode.frame = CGRectMake(0, 0, 130, self.frame.size.height);
}
```
####第五天
项目基本完成，将自己这几天的开发过程记录下来，来看一下效果

![app.gif](http://upload-images.jianshu.io/upload_images/6694822-19bef2989a6e7711.gif?imageMogr2/auto-orient/strip)

demo:https://github.com/guofeifeifei/AsyncDisplayKitWuLiu
如果大家有好的方法也可以告诉我，我也会持续更新、时时在线

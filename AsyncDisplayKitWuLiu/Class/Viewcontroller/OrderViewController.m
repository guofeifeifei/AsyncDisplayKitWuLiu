//
//  OrderViewController.m
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/15.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderModel.h"
#import "OneCellNode.h"
#import "GoodModel.h"
@interface OrderViewController ()<ASTableDataSource, ASTableDelegate>
@property (nonatomic, strong) ASTableNode *tableNode;
@property (nonatomic, strong) NSMutableArray *titleName;
@property (nonatomic, strong) NSString *order_Num;
@property (nonatomic, strong) NSString *order_Stu;
@property (nonatomic, strong) NSString *order_time;
@property (nonatomic, strong) NSString  *wc_time;
@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation OrderViewController
- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        self.dataSource = [NSMutableArray new];
    }
    return _dataSource;
}
- (NSMutableArray *)titleName{
    if (_titleName == nil) {
        self.titleName = [NSMutableArray new];
    }
    return _titleName;
}
- (instancetype)init
{
    if (self = [super initWithNode:[ASDisplayNode new]]) {
        
        [self addTableNode];
    }
    return self;
}
- (void)addTableNode
{
    _tableNode = [[ASTableNode alloc] init];
    _tableNode.backgroundColor = [UIColor whiteColor];
    _tableNode.userInteractionEnabled = YES;
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    [self.node addSubnode:_tableNode];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = KTColor;
    self.titleName = [[NSMutableArray alloc] initWithObjects:@"Place the order", @"Start the production",@"Complete the production & Installation test", @"Packing", @"Loading the container", @"Custom release : Yes", @"ETD:2017-0.7-13\nETA:2017-0.7-18", @"Custom documents have been sent out", nil];
    [self.view layoutIfNeeded];
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableNode.view.tableFooterView = [[UIView alloc]init];
    _tableNode.view.tableHeaderView = [[UIView alloc]init];
    [self dealData];
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _tableNode.frame = self.node.bounds;
}

-(void)dealData{
    self.dataSource = [[NSMutableArray alloc]init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    NSDictionary *resDic = dic[@"res"];
    self.order_Num = resDic[@"order_num"];
    self.order_Stu = resDic[@"stu"];
    self.order_time = resDic[@"add_time"];
    self.wc_time = resDic[@"wc_time"];
    
    NSArray *orderCurrentImageArray = @[@"shengchan2", @"shengchanwancheng2",@"baozhuang2",@"zhuanggui2",@"haiguan2",@"haiyun2",@"wenjian2"];
    //商品图片
    NSArray *orderDesArray = resDic[@"good"];
    for (NSUInteger i = 0; i < orderDesArray.count; ++i) {
        
        NSDictionary *dic = orderDesArray[i];
        OrderModel *orderModel = [[OrderModel alloc] init];
        orderModel.kd_company = resDic[@"kd_name"];
        orderModel.kd_number = resDic[@"kd_num"];
        orderModel.title = self.titleName[i];
        if (i == 5) {
            NSString *dgtime = orderDesArray[5][@"add_time"];
            
            if (![dgtime isEqual:[NSNull null]]) {
                orderModel.etdStr =[TimeTool shijianchuodate:dgtime];
            }
            if (![resDic[@"dg_time"] isEqual:[NSNull null]]) {
                orderModel.etaStr = [TimeTool shijianchuodate:resDic[@"dg_time"]];
            }
            
        }
        //时间
        orderModel.time = [TimeTool shijianchuodate:dic[@"add_time"] staus:@"HH:mm"];
        orderModel.date = [TimeTool shijianchuodate:dic[@"add_time"] staus:@"yyyy-MM-dd"];
        NSString *daystr =[TimeTool dayCount:dic[@"add_time"] beginStr:self.order_time];
        if ([daystr integerValue] == 0) {
            daystr = [NSString stringWithFormat:@"The day"];
            
        }else if ([daystr integerValue] > 1) {
            daystr = [NSString stringWithFormat:@"The %@th day", daystr];
        }else{
            daystr = [NSString stringWithFormat:@"The %@st day", daystr];
            
        }
        orderModel.dayCount = daystr;
        if (![dic[@"shuoming"] isEqual:[NSNull null]]) {
            orderModel.desc = dic[@"shuoming"];
        }
        orderModel.orderImage = orderCurrentImageArray[i];
        NSArray *itemArray = dic[@"item"];
        
        for (NSUInteger j = 0; j < itemArray.count; ++j) {
            NSDictionary *dic = itemArray[j];
            GoodModel *model = [[GoodModel alloc] init];
            if (! [dic[@"title"] isEqual:[NSNull null]]) {
                model.name = dic[@"title"];
            }
            if (![dic[@"img"] isEqual:[NSNull null]]) {
                NSArray *imageArray = dic[@"img"];
                NSMutableArray *imgUrlArray = [NSMutableArray new];
                for (NSString *imgUrl in imageArray) {
                    [imgUrlArray addObject:[NSString stringWithFormat:@"%@", imgUrl] ];
                }
                NSLog(@"%@", imageArray);
                model.productImageArray = [imgUrlArray mutableCopy];
            }
            [orderModel.goodArray addObject:model];
        }
        
        [self.dataSource addObject:orderModel];
    }

    [_tableNode reloadData];

}

#pragma mark - ASTableDataSource

- (BOOL)shouldBatchFetchForTableView:(ASTableView *)tableView
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
}

- (ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASCellNode *(^commentCellNodeBlock)() = ^ASCellNode *() {
        OneCellNode *cellNode = [[OneCellNode alloc] initWithCommentItem:self.dataSource[indexPath.row] indexPath:indexPath];
        cellNode.selectionStyle = UITableViewCellSelectionStyleNone;
        return cellNode;
    };
    return commentCellNodeBlock;
}

#pragma mark---- 上拉刷新
//- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(nonnull ASBatchContext *)context
//{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"刷新");
//        // populate a new array of random-sized kittens
//        NSArray *moarKittens = [NSArray arrayWithArray:self.dataSource];
//        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
//        
//        // find number of kittens in the data source and create their indexPaths
//        NSInteger existingRows = _dataSource.count;
//        
//        for (NSInteger i = 0; i < moarKittens.count; i++) {
//            [indexPaths addObject:[NSIndexPath indexPathForRow:existingRows + i inSection:0]];
//        }
//        
//        // add new kittens to the data source & notify table of new indexpaths
//        [self.dataSource addObjectsFromArray:moarKittens];
//        [tableNode insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
//        
//        [context completeBatchFetching:YES];
//    });
//}


@end

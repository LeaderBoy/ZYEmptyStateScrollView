//
//  RootTableViewController.m
//  ZYEmptyStateView
//
//  Created by 杨志远 on 2017/10/20.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "RootTableViewController.h"
#import "UIScrollView+ZYEmptyState.h"
#import "ZYEmptyDataSource.h"

#import <objc/runtime.h>
@interface RootTableViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIActivityIndicatorView *indicator;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSArray <NSDictionary *>*emptyDataArray;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self.view addSubview:self.indicator];
}

- (IBAction)loading:(UIBarButtonItem *)sender {
    [self excute:ZYScrollViewStateLoading];
}
- (IBAction)noNetwork:(UIBarButtonItem *)sender {
    [self excute:ZYScrollViewStateNetworkUnReachable];
}
- (IBAction)noData:(UIBarButtonItem *)sender {
    [self excute:ZYScrollViewStateNoData];
}
- (IBAction)fail:(UIBarButtonItem *)sender {
    [self excute:ZYScrollViewStateLoadFailed];
}
- (IBAction)success:(UIBarButtonItem *)sender {
    [self excute:ZYScrollViewStateLoadSuccess];
}

-(void)excute:(ZYScrollViewState)emptyDataState {
    [self.indicator stopAnimating];
    if (self.dataSource.count) {
        [self.dataSource removeAllObjects];
    }    
    switch (emptyDataState) {
        case ZYScrollViewStateNetworkUnReachable:
            self.tableView.emptyDataSource.emptyCustomView = nil;
            self.tableView.emptyDataSource.emptyImageAnimation = nil;
            break;
        case ZYScrollViewStateNoData:
            self.tableView.emptyDataSource.emptyCustomView = nil;
            self.tableView.emptyDataSource.emptyImageAnimation = nil;
            break;
        case ZYScrollViewStateLoadFailed:
            self.tableView.emptyDataSource.emptyCustomView = nil;
            self.tableView.emptyDataSource.emptyImageAnimation = [self makeAnimation];
            break;
        case ZYScrollViewStateLoading:
        {
            self.tableView.emptyDataSource.emptyImageAnimation = nil;
//            self.tableView.emptyDataSource.emptyCustomView = [self customView];
            [self.indicator startAnimating];
        }
            break;
        case ZYScrollViewStateLoadSuccess:
        {
            self.tableView.emptyDataSource.emptyImageAnimation = nil;
            self.tableView.emptyDataSource.emptyImageAnimation = nil;
            self.tableView.emptyDataSource.emptyCustomView = nil;
            self.dataSource = [@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"] mutableCopy];
        }
            break;
        default:
            break;
    }
    self.tableView.emptyDataState = emptyDataState;
    [self.tableView reloadEmptyDataSet];
    [self.tableView reloadData];
}

-(void)setUpTableView {
//    [self.tableView loadEmptyDataFromArray:self.emptyDataArray];
    [self.tableView loadEmptyDataFromPlist:@"ZYEmptyScrollViewDataSource"];
    
    self.tableView.dataSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [UIView new];
}

-(UIView *)customView {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    label.text = @"自定义视图";
    return label;
}

// 需要遵循 代理 DZNEmptyDataSetDelegate 返回YES才可以执行animation
-(CABasicAnimation *)makeAnimation {
    CASpringAnimation *scale = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = [NSNumber numberWithFloat:1];
    scale.toValue = [NSNumber numberWithFloat:1.3];
    scale.duration = 0.3;
    scale.initialVelocity = 3;
    scale.autoreverses = YES;
    return scale;
}
#pragma mark - DZNEmptyDataSetDelegate
-(BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView {
    return YES;
}

#pragma mark - DZNEmptyDataSetSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}
#pragma mark - DZNEmptyDataSetDelegate

-(void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    
    NSLog(@"点击了按钮");
}



#pragma mark - Getter

-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:100];
    }
    return _dataSource;
}

-(UIActivityIndicatorView *)indicator {
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicator.center = self.view.center;
    }
    return _indicator;
}



-(NSArray<NSDictionary *> *)emptyDataArray {
    if (!_emptyDataArray) {
        
        _emptyDataArray = @[
                            
                            @{ZYEmptyDataSourceTitleKey:@"无网络链接",ZYEmptyDataSourceTitleColorKey:[[UIColor redColor] zy_colorToString],ZYEmptyDataSourceDescriptionTitleKey:@"请到设置 - 通用 打开网络",ZYEmptyDataSourceButtonTitleKey:@"按钮",ZYEmptyDataSourceImageKey:@"noNetwork_empty"},
  @{ZYEmptyDataSourceTitleKey:@" ",ZYEmptyDataSourceDescriptionTitleKey:@" ",ZYEmptyDataSourceButtonTitleKey:@" ",ZYEmptyDataSourceImageKey:@" "},
  @{ZYEmptyDataSourceTitleKey:@"沙发",ZYEmptyDataSourceDescriptionTitleKey:@"抢先评论",ZYEmptyDataSourceButtonTitleKey:@"按钮",ZYEmptyDataSourceImageKey:@"empty_my_comment3"},
  @{ZYEmptyDataSourceTitleKey:@"加载失败",ZYEmptyDataSourceDescriptionTitleKey:@"请检查设置",ZYEmptyDataSourceButtonTitleKey:@"重试",ZYEmptyDataSourceImageKey:@"empty_my_publish3"},
  @{ZYEmptyDataSourceTitleKey:@" ",ZYEmptyDataSourceDescriptionTitleKey:@" ",ZYEmptyDataSourceButtonTitleKey:@" ",ZYEmptyDataSourceImageKey:@" "}];
    }
    return _emptyDataArray;
}




@end

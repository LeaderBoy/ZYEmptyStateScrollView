# ZYEmptyStateScrollView
让UIScrollView/UITableView/UICollectionView 在加载不同的时期显示不同的视图,比如加载成功,加载中,加载无数据,无网络连接,加载失败几种情况显示不同的视图,避免空白页面体验差,只需三行代码.
#### 效果图
![enter image description here](http://p13zzx9gf.bkt.clouddn.com/ZYEmptyStateScrollView.gif)

#### 安装
在 podfile 中
```
pod 'ZYEmptyStateScrollView' 
```
在终端执行
```
pod install
```

#### 视图的几种状态
```
/**
 UIScrollView 视图为空的各种状态

 - ZYScrollViewStateNetworkUnReachable: 无网络链接
 - ZYScrollViewStateLoading: 加载中
 - ZYScrollViewStateNoData: 加载无数据
 - ZYScrollViewStateLoadFailed: 加载失败
 - ZYScrollViewStateLoadSuccess: 加载成功
 */
```
#### 使用方法
\#import "UIScrollView+ZYEmptyState.h"
加载空视图数据方式1 : 使用数组加载 (只需加载一次即可)
``` 
[self.tableView loadEmptyDataFromArray:self.emptyDataArray];
```
数组的样子 : 
1.此处注意的点 ZYScrollViewStateNetworkUnReachable为数组的第0个  依次类推
2.颜色请使用如下方式赋值  [[UIColor redColor] zy_colorToString]
```
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
```
方式2: 使用plist文件加载 下载地址 : [Plist文件](http://p13zzx9gf.bkt.clouddn.com/ZYEmptyScrollViewDataSource.plist)(只需加载一次即可)
``` 
[self.tableView loadEmptyDataFromPlist:@"ZYEmptyScrollViewDataSource"];
```

#### 使用 以ZYScrollViewStateLoading为例子
```
//刷新空视图的数据
self.tableView.emptyDataState = ZYScrollViewStateLoading;
[self.tableView reloadEmptyDataSet];
// 刷新界面数据的时候使用: 一般为success的时候使用 其余情况一般无需使用
[self.tableView reloadData];
```
##### 使用自定义视图的情况
```
// customView为伪代码
self.tableView.emptyDataSource.emptyCustomView = [self customView];
```
**注意:** 当只有一种状态需要自定义视图其他状态无需使用自定义视图的时候需要使用self.tableView.emptyDataSource.emptyCustomView = nil 置空处理

#### 使用自定义动画的情况
```
// 遵循DZNEmptyDataSetDelegate 代理方法
self.tableView.emptyDataSetDelegate = self;
// 实现协议方法
-(BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView {
    return YES;
}

// 自定义动画 :  makeAnimation为伪代码
self.tableView.emptyDataSource.emptyImageAnimation = [self makeAnimation];
```
**注意:**当只有一种状态需要自定义动画其他状态无需使用自定义视图的时候需要使用self.tableView.emptyDataSource.emptyImageAnimation = nil 置空处理



//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by yingying on 15/7/20.
//  Copyright (c) 2015年 yingying. All rights reserved.
//  代码原始转载链接 : http://blog.csdn.net/zhenggaoxing/article/details/44488851

#import "ViewController.h"

#define WEIGHT [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


/**
 纯代码创建collectionView
 */

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark- setup
-(void)setup{
    
    
    /**
     collectionView的FlowLayout创建
     */
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc ]init];
    
    /**
     collectionView的创建
     */
    UICollectionView *first=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,WEIGHT ,HEIGHT) collectionViewLayout:flowLayout];
    /*
     *  注册cell
     *  collectionView中, 要为每一个Cell类型进行注册, 注册之后, 通过Identifier即可立即调用相应的cell类.
     *  具体注册方式请参考 API
     *  当前为代码创建cell类型
     */
    
    [first registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:@"cell"];
    
    //delegate & dataSource
    first.dataSource=self;
    first.delegate=self;
    
    
    [self.view addSubview:first];

}


#pragma mark- Source Delegate

//section数量
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

//cell数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

//cell的数据源
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"cell";
    //    UICollectionViewCell *cell=[[UICollectionViewCell alloc] init];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.contentView.backgroundColor=[UIColor whiteColor];
    
    return cell;
}

#pragma mark- FlowDelegate

//cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(WEIGHT/3, WEIGHT/3);
}

/*
 //设定全局的行间距，如果想要设定指定区内Cell的最小行距，可以使用下面方法：
 //个人理解为 : 同一个分组中, cell的纵向距离
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
 return 0;
 }
 */

//设定全局的Cell间距，如果想要设定指定区内Cell的最小间距，可以使用下面方法
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return WEIGHT/9;
}

//cell的margin间距. : UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(WEIGHT/18, WEIGHT/9, WEIGHT/18, WEIGHT/9);
}



@end

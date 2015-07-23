//
//  NIBViewController.m
//  CollectionViewDemo
//
//  Created by 卫家劲 on 15/7/23.
//  Copyright (c) 2015年 yingying. All rights reserved.
//

#import "NIBViewController.h"
#import "NIBCollectionViewCell.h"

#define WEIGHT [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface NIBViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@end

@implementation NIBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    // Do any additional setup after loading the view.
}


-(void)setup{
    /*
     *  注册cell
     *  collectionView中, 要为每一个Cell类型进行注册, 注册之后, 通过Identifier即可立即调用相应的cell类.
     *  具体注册方式请参考 API
     *  当前为代码创建cell类型
     */
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"NIBCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NIBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
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

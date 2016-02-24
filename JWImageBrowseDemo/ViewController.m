//
//  ViewController.m
//  JWImageBrowseDemo
//
//  Created by jiangtd on 16/2/24.
//  Copyright © 2016年 jiangtd. All rights reserved.
//

#import "ViewController.h"
#import "JWCollectionViewFlowLayout.h"
#import "CustumCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,weak)UICollectionView *imgBrowseView;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setDataSource];
    [self setupUI];
}

-(void)setDataSource
{
    for (NSInteger i = 1; i <= 14; i++) {
        [self.dataSource addObject:[NSString stringWithFormat:@"%ld.jpg",i]];
    }
}

-(void)setupUI
{
    
    JWCollectionViewFlowLayout *flowLayout = [[JWCollectionViewFlowLayout alloc] init];
    UICollectionView *imgBrowseView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    imgBrowseView.dataSource = self;
    imgBrowseView.delegate = self;
    imgBrowseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imgBrowseView];
    _imgBrowseView = imgBrowseView;
    
    [self.imgBrowseView registerNib:[UINib nibWithNibName:@"CustumCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark =================delegate=============


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
    
    return cell;
}


#pragma mark ===========GetMethod=============

-(NSMutableArray*)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}




@end





















//
//  ViewController.m
//  test
//
//  Created by CSX on 2017/1/20.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *imageVirw;
}
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ViewController


- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:tableView];
    
    UIImage *image = [UIImage imageNamed:@"1484096562631.jpg"];
    imageVirw = [[UIImageView alloc]init];
    imageVirw.frame = CGRectMake(0, 0, self.view.frame.size.width, 270);
    imageVirw.image = image;

    /*
     注意这里不能让imageview为tableview的区头，那样的话，区头是宽度怎么设都不会影响的，都是table表的宽度
    */
    tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 270)];
    [tableView.tableHeaderView addSubview:imageVirw];
    
    
    
    for (int i = 0; i<16; i++) {
        [self.dataArr addObject:[NSString stringWithFormat:@"第%d个",i]];
    }
    [tableView reloadData];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    NSLog(@"%f",offsetY/2);
    
    //核心
    if (offsetY < 0) {
        
        imageVirw.frame = CGRectMake(offsetY/2, offsetY, self.view.frame.size.width - offsetY, 270 - offsetY);  // 修改头部的frame值就行了
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

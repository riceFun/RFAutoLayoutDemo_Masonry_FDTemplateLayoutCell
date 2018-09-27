//
//  ViewController.m
//  RFAutoLayoutDemo_Masonry_FDTemplateLayoutCell
//
//  Created by riceFun on 2018/9/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "ViewController.h"
#import "RFMonentCell.h"
#import "YYFPSLabel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) YYFPSLabel *fpsLabel;
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,strong) NSMutableArray *sourceDataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self buildDataBlock:^{
        self.sourceDataArray = @[].mutableCopy;
        [self.sourceDataArray addObject:self.dataArray.mutableCopy];
        [self.tableView reloadData];
    }];
}

-(void)setupUI{
    self.title = @"Masonry_FDTemplateLayoutCell";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.fd_debugLogEnabled = YES;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.fpsLabel];
}

-(void)buildDataBlock:(void(^)(void))buildDataOverblock{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //data from “data.json”
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *feedDicts = rootDict[@"feed"];
        
        // Convert to `MonentModel`
        NSMutableArray *entities = @[].mutableCopy;
        [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [entities addObject:[[MonentModel alloc] initWithDictionary:obj]];
        }];
        self.dataArray = entities;
        
        
        // Callback
        dispatch_async(dispatch_get_main_queue(), ^{
            !buildDataOverblock ?: buildDataOverblock();
        });
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark delegate&&dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sourceDataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.sourceDataArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RFMonentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"riceFun" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

-(void)configureCell:(RFMonentCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.fd_enforceFrameLayout = NO;
    cell.model = self.sourceDataArray[indexPath.section][indexPath.row];
    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}


//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    CGFloat Height = [tableView fd_heightForCellWithIdentifier:@"riceFun" configuration:^(id cell) {
//        [self configureCell:cell atIndexPath:indexPath];
//    }];
//    return Height;
//}

#pragma mark getter&setter
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:(UITableViewStylePlain)];
        _tableView.estimatedRowHeight = KAUTOSCALE(100);
        _tableView.showsVerticalScrollIndicator = YES;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[RFMonentCell class] forCellReuseIdentifier:@"riceFun"];
    }
    return _tableView;
}

-(YYFPSLabel *)fpsLabel{
    if (!_fpsLabel) {
        _fpsLabel  = [YYFPSLabel new];
        _fpsLabel.center = self.view.center;
    }
    return _fpsLabel;
}

-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSArray alloc]init];
    }
    return _dataArray;
}


@end

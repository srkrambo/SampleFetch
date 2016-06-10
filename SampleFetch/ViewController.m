//
//  ViewController.m
//  SampleFetch
//
//  Created by Rajkumar S on 6/6/16.
//  Copyright © 2016 Eezy. All rights reserved.
//

#import "ViewController.h"
#import "SFCompanyTableViewCell.h"
#import "HttpManager.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *companyArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[HttpManager sharedInstance]fetchCompaniesWithCompletion:^(id responseObj, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.companyArray = responseObj;
        [self.tableView reloadData];
        
    }];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.companyArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SFCompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    SFCompany *company = [self.companyArray objectAtIndex:indexPath.row];
    [cell setCellWithData:company];
    return cell;
    
}

@end

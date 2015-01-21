//
//  VTDListViewController.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDListViewController.h"
#import "VTDListUpcomingItem.h"

@interface VTDListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *noContentView;

@property (nonatomic, readonly) NSDictionary *data;

@end

@implementation VTDListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.eventHandler updateView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - No Content OR TableView

- (void)showNoContents {
    [self.noContentView setHidden:NO];
    [self.tableView setHidden:YES];
}

- (void)showTableView {
    [self.noContentView setHidden:YES];
    [self.tableView setHidden:NO];
}

- (void)reloadTableView {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSDictionary *)data {
    return [self.eventHandler.listInteractor.listData copy];
}

- (NSArray *)sortedKeys {
    return [[self.data allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 integerValue] == [obj2 integerValue]) {
            return 0;
        }
        else {
            return [obj1 integerValue] > [obj2 integerValue] ? 1 : -1;
        }
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id interactorObject;
    NSArray *sortedKeys = [self sortedKeys];
    if (indexPath.section < [sortedKeys count]) {
        NSString *numberKey = [NSString stringWithFormat:@"%@", sortedKeys[indexPath.section]];
        NSArray *upcomingItems = [self.data valueForKey:numberKey];
        if (indexPath.row < [upcomingItems count]) {
            interactorObject = upcomingItems[indexPath.row];
        }
    }
    return [VTD[@protocol(VTDListWireFrame)] configureCellForListTableView:tableView
                                                          interactorObject:interactorObject];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sortedKeys = [self sortedKeys];
    if (section < [sortedKeys count]) {
        NSString *numberKey = [NSString stringWithFormat:@"%@", sortedKeys[section]];
        if ([self.data valueForKey:numberKey] != nil) {
            return [[self.data valueForKey:numberKey] count];
        }
    }
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *sortedKeys = [self sortedKeys];
    if (section < [sortedKeys count]) {
        NSInteger enumInteger = [sortedKeys[section] integerValue];
        switch (enumInteger) {
            case VTDListUpcomingItemDateRelationToday:
                return @"Today";
                break;
            case VTDListUpcomingItemDateRelationTomorrow:
                return @"Tomorrow";
                break;
            case VTDListUpcomingItemDateRelationLaterThisWeek:
                return @"This Week";
                break;
            case VTDListUpcomingItemDateRelationNextWeek:
                return @"Next Week";
                break;
            case VTDListUpcomingItemDateRelationOutOfRange:
                return @"Others";
                break;
            default:
                break;
        }
    }
    return nil;
}

#pragma mark - Handle Events

- (IBAction)handleAddButtonTapped:(id)sender {
    [self.eventHandler addNewEntry];
}


@end

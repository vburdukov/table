//
//  MainViewController.m
//  TableViewIOS5Demo
//
//  Created by Uppal'z on 19/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MenuSupportViewController.h"

@implementation MainViewController
@synthesize mainTableView, contentArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            menuSupportViewController = [[MenuSupportViewController alloc] initWithNibName:@"MenuSupportViewController" bundle:nil];
            menuSupportViewController.title = [contentArray objectAtIndex:indexPath.row];
            [super.navigationController pushViewController:menuSupportViewController animated:YES];
            break;
        }
        case 1:
        {
            reuseCellViewController = [[ReuseCellWithNibViewController alloc] init];
            reuseCellViewController.title = [contentArray objectAtIndex:indexPath.row];
            [super.navigationController pushViewController:reuseCellViewController animated:YES];
            break;
        }
        case 2:
        {
            multipleSelectionViewController = [[MultipleSelectionViewController alloc] init];
            multipleSelectionViewController.title = [contentArray objectAtIndex:indexPath.row];
            [super.navigationController pushViewController:multipleSelectionViewController animated:YES];
            break;
        }
        case 3:
        {
            multiEditViewController = [[MultiEditViewController alloc] init];
            multiEditViewController.title = [contentArray objectAtIndex:indexPath.row];
            [super.navigationController pushViewController:multiEditViewController animated:YES];
            break;
        }            
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myIdentifier = @"myIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myIdentifier];
    }
    cell.textLabel.text = [self.contentArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    contentArray = [[NSMutableArray alloc] init];
    [self.contentArray addObject: @"Menu Support Demo"];
    [self.contentArray addObject: @"Reuse Nibs Demo"];
    [self.contentArray addObject: @"Multi Selection Demo"];
    [self.contentArray addObject: @"Multi Edit Demo"];
}

- (void)viewDidUnload
{
    self.mainTableView = nil;
    self.contentArray = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning
{    
    [super didReceiveMemoryWarning];
}

@end

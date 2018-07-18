//
//  DiscoverTableViewController.m
//  MentorMe
//
//  Created by Nico Salinas on 7/12/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import "DiscoverTableViewController.h"
#import "DiscoverCell.h"
#import "Parse.h"
@interface DiscoverTableViewController () <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UISegmentedControl *mentorMenteeSegControl;
@property (strong, nonatomic) IBOutlet UIButton *filterButton;
@property (strong, nonatomic) NSArray *filteredUsers;
@end

@implementation DiscoverTableViewController
- (IBAction)logoutButtonAction:(UIButton *)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if(error == nil){
            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"hey we did it");
        } else{
            NSLog(@"error in logging out");
        }
    }];
}
- (IBAction)logoutAction:(UIBarButtonItem *)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if(error == nil){
            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"hey we did it");
        } else{
            NSLog(@"error in logging out");
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.discoverTableView.delegate = self;
    self.discoverTableView.dataSource = self;
    // Do any additional setup after loading the view.
    
    [self fetchFilteredUsers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiscoverCell" forIndexPath:indexPath];
    [cell layoutCell:self.filteredUsers[indexPath.row]];
    
    
    return cell;
}
-(void)fetchFilteredUsers{
    PFQuery *usersQuery = [PFQuery queryWithClassName:@"User"];
    [usersQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable users, NSError * _Nullable error) {
        if(users){
            self.filteredUsers = users;
            NSLog(@"WE GOT THE USERS 😇");
        } else{
            NSLog(@"didn't get the users 🙃");
        }
        [self.discoverTableView reloadData];
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

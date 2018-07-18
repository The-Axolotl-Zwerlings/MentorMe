//
//  CreateAppViewController.m
//  MentorMe
//
//  Created by Taylor Murray on 7/18/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import "CreateAppViewController.h"
#import "ParseUI.h"
#import "Parse.h"
#import "DateTools.h"
@interface CreateAppViewController ()
@property (strong, nonatomic) IBOutlet PFImageView *mentorProfileView;
@property (strong, nonatomic) IBOutlet PFImageView *menteeProfileView;

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UITextView *messageTextView;

//buttons
@property (strong, nonatomic) IBOutlet UIButton *coffeeButton;
@property (strong, nonatomic) IBOutlet UIButton *lunchButton;
@property (strong, nonatomic) IBOutlet UIButton *VCbutton;

//details
@property (strong, nonatomic) IBOutlet UILabel *typeMeetingLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;

@end

@implementation CreateAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self setUILayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUILayout{
    self.locationLabel.text = self.appointment.meetingLocation;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    
    self.timeLabel.text = [formatter stringFromDate:self.appointment.meetingDate];
    NSString *completeMeetingType = [@"Meeting for " stringByAppendingString:self.appointment.meetingType];
    self.typeMeetingLabel.text = completeMeetingType;
    self.mentorProfileView.file = self.appointment.mentor.profilePic;
    [self.mentorProfileView loadInBackground];
    
    self.menteeProfileView.file = PFUser.currentUser.profilePic;
    [self.menteeProfileView loadInBackground];
    
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

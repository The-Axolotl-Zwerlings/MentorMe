//
//  AppointmentCell.m
//  MentorMe
//
//  Created by Nico Salinas on 7/18/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import "AppointmentCell.h"
#import "AppointmentsViewController.h"
#import "PFUser+ExtendedUser.h"
#import "Parse/Parse.h"
#import "DateTools.h"



@implementation AppointmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setAppointment:(AppointmentModel *)appointment {
    
    PFUser *myUser = [PFUser currentUser];
    PFUser *mentor = self.appointment.mentor;
    self.mentorName.text = mentor.username;
    self.mentorProfilePic.file = mentor.profilePic;
    
    _appointment = appointment;
    
    self.meetingDate.text = [self.appointment.meetingDate timeAgoSinceNow];
    self.meetingType.text = self.appointment.meetingType;
    self.meetingLocation.text = self.appointment.meetingLocation;
    
    
}

@end

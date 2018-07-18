//
//  AppointmentModel.h
//  MentorMe
//
//  Created by Taylor Murray on 7/18/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import "PFObject.h"
#import "PFUser+ExtendedUser.h"
#import "Parse/Parse.h"
#import "ParseUI.h"

@interface AppointmentModel : PFObject <PFSubclassing>

@property (nonatomic, strong ) PFUser *mentor;
@property( nonatomic, strong ) NSDate *meetingDate;
@property( nonatomic, strong ) NSString *meetingType;
@property( nonatomic, strong ) NSString *meetingLocation;



@end

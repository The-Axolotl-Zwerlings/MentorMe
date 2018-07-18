//
//  AppointmentModel.m
//  MentorMe
//
//  Created by Taylor Murray on 7/18/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import "AppointmentModel.h"

@implementation AppointmentModel
@dynamic meetingDate;
@dynamic meetingType;
@dynamic mentor;
@dynamic meetingLocation;

+(nonnull NSString *)parseClassName{
    return @"AppointmentModel";
}

@end

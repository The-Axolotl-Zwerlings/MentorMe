//
//  PFUser+ExtendedUser.m
//  MentorMe
//
//  Created by Taylor Murray on 7/18/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import "PFUser+ExtendedUser.h"
#import "Parse/Parse.h"


@implementation PFUser (ExtendedUser)

-(void)setProfilePic:(PFFile *)profilePic{
    self[@"profilePic"] = profilePic;
}
-(PFFile *)profilePic{
    return self[@"profilePic"];
}
-(void)setBio:(NSString *)bio{
    self[@"bio"] = bio;
}
-(NSString *)bio{
    return self[@"bio"];
}
@end

//
//  PFUser+ExtendedUser.h
//  MentorMe
//
//  Created by Taylor Murray on 7/18/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import "PFUser.h"
#import "Parse/Parse.h"

@interface PFUser (ExtendedUser)
@property (strong,nonatomic) PFFile *profilePic;
@property (strong, nonatomic) NSString *bio;
@end

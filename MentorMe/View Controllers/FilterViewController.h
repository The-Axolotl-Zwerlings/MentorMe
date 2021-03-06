//
//  FilterViewController.h
//  MentorMe
//
//  Created by Taylor Murray on 7/19/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FilterDelegate
-(void)didChangeSchool:(NSNumber *)school withCompany:(NSNumber *)company andLocation:(NSNumber *)location;
@end
@interface FilterViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *interestsTableView;
@property (strong, nonatomic) NSString *giveOrGet;
@property (weak, nonatomic) id<FilterDelegate> delegate;
@end

//
//  SignUpViewController.m
//  MentorMe
//
//  Created by Nico Salinas on 7/12/18.
//  Copyright © 2018 Taylor Murray. All rights reserved.
//

#import "SignUpViewController.h"
#import "Parse/Parse.h"
#import "PFUser+ExtendedUser.h"
#import "DiscoverTableViewController.h"

@interface SignUpViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *bioField;
@property (weak, nonatomic) IBOutlet UITextField *JobTitleField;
@property (weak, nonatomic) IBOutlet UITextField *companyField;
@property (weak, nonatomic) IBOutlet UITextField *institutionField;
@property (weak, nonatomic) IBOutlet UITextField *majorField;



@property (weak, nonatomic) IBOutlet UIButton *addProfilePictureButton;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;


@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerUser  {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    newUser.email = self.emailField.text;
    newUser.password = self.passwordField.text;
    newUser.bio = self.bioField.text;
    newUser.jobTitle = self.JobTitleField.text;
    newUser.company = self.companyField.text;
    newUser.school = self.institutionField.text;
    newUser.major = self.majorField.text;
    
    newUser.name = @"Jones";
    newUser.jobTitle = @"idk";
    newUser.school = @"a school";
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            
            // manually segue to logged in view
        }
    }];
}

-(void)addProfilePicture {
    UIImagePickerController* imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else{
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (IBAction)onTapRegister:(id)sender {
    
    [self registerUser];
    
}

- (IBAction)onTapAddProfilePicture:(id)sender {
    [self addProfilePicture];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ( [segue.identifier isEqualToString:@"segueToTabBarViewController"] ){
        NSLog( @"Test" );
        
        UINavigationController *navigationController = [segue destinationViewController];
        DiscoverTableViewController *discoverTableViewController = (DiscoverTableViewController*) navigationController.topViewController;
        //feedTableViewController.delegate = self;
    }
}


@end

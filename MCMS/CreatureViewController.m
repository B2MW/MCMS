//
//  CreatureViewController.m
//  MCMS
//
//  Created by Bradley Walker on 10/7/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()
@property (strong, nonatomic) IBOutlet UIButton *editDoneButton;

@property BOOL editDoneButtonState;
@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.creature.name;
    self.editDoneButtonState = NO;
}
- (IBAction)onEditDoneButtonPressed:(id)sender {
    if (self.editDoneButtonState == NO) {
        self.editDoneButtonState = YES;
    } else self.editDoneButtonState = NO;
}
@end

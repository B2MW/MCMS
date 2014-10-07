//
//  ViewController.m
//  MCMS
//
//  Created by Bradley Walker on 10/7/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *creaturesUITextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *creatureTableCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *creature1 = [[MagicalCreature alloc] init];
    creature1.name = @"Hodor";
    MagicalCreature *creature2 = [[MagicalCreature alloc] init];
    creature2.name = @"Table Monster";
    MagicalCreature *creature3 = [[MagicalCreature alloc] init];
    creature3.name = @"Hawkeye";
    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"creatureCell" forIndexPath:indexPath];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    NSString *creatureName = creature.name;
    cell.textLabel.text = creatureName;
    return cell;
}
- (IBAction)createDragonOnButtonPressed:(id)sender {
    MagicalCreature *creature = [[MagicalCreature alloc] init];
    [self.creatures addObject:creature];
    creature.name = self.creaturesUITextField.text;
    [self.tableView reloadData];
    self.creaturesUITextField.text = @"";
    [self.creaturesUITextField resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell
{
    CreatureViewController *creatureValues = [segue destinationViewController];
//    creatureValues.name = cell.textLabel.text;
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    creatureValues.creature = [self.creatures objectAtIndex:path.row];
}
@end

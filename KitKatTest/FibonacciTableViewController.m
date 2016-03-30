//
//  FibonacciTableViewController.m
//  KitKatTest
//
//  Created by Abid Rana on 29/03/2016.
//  Copyright © 2016 . All rights reserved.
//

#import "FibonacciTableViewController.h"

@interface FibonacciTableViewController ()
{
    NSMutableArray *fibonacciArray;
}
@end

@implementation FibonacciTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    fibonacciArray = [[NSMutableArray alloc] init];
    
    [self performSelectorInBackground:@selector(createFibonacciNumbers) withObject:nil];
}

- (void) createFibonacciNumbers
{

    NSUInteger previousNumber2 = 0;
    NSUInteger previousNumber1 = 1;
    
    NSUInteger maxNumber = NSUIntegerMax;
    
    
    for( NSUInteger currentNumber = 1; currentNumber < maxNumber; currentNumber++ )
    {
        // first time this would be manual calculation
        NSUInteger currentFibonacciNumber = previousNumber1 + previousNumber2;
        
        // create NSNumber so we can add to the array!
        NSNumber *fibNumberObject = [NSNumber numberWithUnsignedInteger:currentFibonacciNumber];
        
        [fibonacciArray addObject:fibNumberObject];
        
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        
        NSLog(@"%@, ",fibNumberObject);
        
        previousNumber1 = previousNumber2;
        previousNumber2 = currentFibonacciNumber;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [fibonacciArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[fibonacciArray objectAtIndex:indexPath.row]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

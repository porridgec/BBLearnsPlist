//
//  BBMainViewController.m
//  BBLearnsPlist
//
//  Created by Hahn.Chan on 7/21/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import "BBMainViewController.h"

@interface BBMainViewController () <UITextFieldDelegate>
{
    NSString *text;
}

@end

@implementation BBMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setupSelf];
        [self loadData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 *  setup the viewController
 */
- (void) setupSelf
{
    self.view.backgroundColor = [UIColor redColor];
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 100  , 20)];
    UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    aLabel.text = @"sda";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.backgroundColor = [UIColor yellowColor];
    textField.delegate = self;
    [self.view addSubview:aLabel];
    [self.view addSubview:textField];
    
}


/**
 *  prepare the data for the program
 */
- (void)loadData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BB" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    NSLog(@"%@\n",filePath);
    NSLog(@"plist is \n%@\n",data);
    
    [data setObject:@"hwfc" forKey:@"team"];
    //NSLog(@"plist is \n%@\n",data);
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    
    NSString *plistFileName = [plistPath stringByAppendingString:@"/bbcreated.plist"];
    
    [data writeToFile:plistFileName atomically:YES];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    text = textField.text;
    NSLog(@"%@\n",text);
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    
    NSString *plistFileName = [plistPath stringByAppendingString:@"/bbcreated.plist"];
    
    NSLog(@"%@\n",plistFileName);
    
    [data setObject:text forKey:@"team"];
    [data writeToFile:plistFileName atomically:YES];
    
    NSMutableDictionary *localPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:plistFileName];
    NSLog(@"%@\n",localPlist);
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end

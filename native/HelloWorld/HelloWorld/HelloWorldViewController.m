//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Christoph Ehlen on 5/12/13.
//  Copyright (c) 2013 Christoph Ehlen. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)sendData:(id)sender;
@end

@implementation HelloWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendData:(id)sender {
    UIApplication *ourApplication = [UIApplication sharedApplication];
    NSString *URLEncodedText = [self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *ourPath = [NSString stringWithFormat:@"%@://?data=%@&r=%@", @"liveandgov", URLEncodedText, @"helloWorld"];
    NSURL *ourUrl = [NSURL URLWithString:ourPath];
    if([ourApplication canOpenURL:ourUrl]) {
        [ourApplication openURL:ourUrl];
    }
    else {
        // Display error
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reciever Not Found" message:@"The Reciever App is not installed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}
@end

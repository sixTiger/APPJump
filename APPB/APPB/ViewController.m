//
//  ViewController.m
//  APPB
//
//  Created by xiaobing on 15/10/28.
//  Copyright © 2015年 xiaobing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)openA:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"APPA://touchesBegan"];
    [[UIApplication sharedApplication] openURL:url];
}
- (IBAction)openC:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"APPC://touchesBegan"];
    [[UIApplication sharedApplication] openURL:url];
}
@end

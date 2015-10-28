//
//  ViewController.m
//  APPA
//
//  Created by xiaobing on 15/10/28.
//  Copyright © 2015年 xiaobing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)button1Click:(id)sender {
    NSURL *url = [NSURL URLWithString:@"APPB://button1Click"];
    [[UIApplication sharedApplication] openURL:url];
}
- (IBAction)button2Click:(id)sender {
    NSURL *url = [NSURL URLWithString:@"APPC://button2Click"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

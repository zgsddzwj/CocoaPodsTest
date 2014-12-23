//
//  ViewController.m
//  CocoaPodsTest
//
//  Created by Adward on 14/11/26.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import "ViewController.h"
#import "EMAdPost.h"
#import "EMURLManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self p_setupRequest];
}

- (void)p_setupRequest {

    [EMAdPost requestWithUrl:requestURLWithType(ParamURLTpye_ad) paramers:Paramer_ad(@"0101") block:^(NSArray *posts, NSError *error) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@",posts);
        });
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

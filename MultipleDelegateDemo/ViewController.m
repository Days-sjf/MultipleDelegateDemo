//
//  ViewController.m
//  MultipleDelegateDemo
//
//  Created by slyao on 15/12/9.
//  Copyright © 2015年 slyao. All rights reserved.
//

#import "ViewController.h"
#import "MultipleDelegate.h"
#import "ScrollviewDelegate.h"
#import "TableViewDelegate.h"

@interface ViewController ()

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)MultipleDelegate *delegateManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 300)];
    self.scrollView.contentSize = CGSizeMake(1000, 300);
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.scrollView];

    ScrollviewDelegate *delegateOne = [[ScrollviewDelegate alloc] init];
    TableViewDelegate *delegateTwo = [[TableViewDelegate alloc] init];

    self.delegateManager = [[MultipleDelegate alloc] init];
    [self.delegateManager.delegates addObject:delegateOne];
    [self.delegateManager.delegates addObject:delegateTwo];
    
    self.scrollView.delegate = self.delegateManager;

    UIButton *bbb = [UIButton buttonWithType:UIButtonTypeCustom];
    bbb.frame = CGRectMake(20, 400, 100, 50);
    bbb.backgroundColor = [UIColor redColor];
    [bbb addTarget:self action:@selector(AAAA) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bbb];

}

- (void)AAAA
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"prefs:root=MUSIC"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=MUSIC"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

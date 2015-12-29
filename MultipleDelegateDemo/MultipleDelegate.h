//
//  MultipleDelegate.h
//  MultipleDelegateDemo
//
//  Created by slyao on 15/12/9.
//  Copyright © 2015年 slyao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MultipleDelegate : NSObject<UIScrollViewDelegate>

@property (nonatomic, strong)NSMutableArray *delegates;

@end

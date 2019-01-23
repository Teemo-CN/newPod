//
//  ViewController.m
//  KVO1
//
//  Created by 赵亮 on 2018/11/20.
//  Copyright © 2018年 赵亮. All rights reserved.
//

#import "ViewController.h"
#import "ZLPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic , strong) ZLPerson * person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.person = [[ZLPerson alloc]init];
    self.person.age = @"12";
    
    NSLog(@"前%@",object_getClass(self.person));
    
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.person.age = @"20";
    
    [self.person removeObserver:self forKeyPath:@"age"];
    
    NSLog(@"销毁了");
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"改变了");
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

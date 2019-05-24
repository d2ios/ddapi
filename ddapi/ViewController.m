//
//  ViewController.m
//  ddapi
//
//  Created by lcb on 2019/5/24.
//  Copyright © 2019 lcb. All rights reserved.
//

#import "ViewController.h"
#import "ddapi/DDApi.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
}

-(void)test
{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    [parameters setValue:@"1" forKey:@"aid"];
    NSString *Urlstr = [NSString stringWithFormat:@"%@%@",@"http://news.zrart.net.cn/newsapp",@"/article/getArticleDetail"];
//    __weak __typeof(self)weakSelf = self;
//    
    [DDApi GETWithURL:Urlstr parameters:parameters cachePolicy:ApiCachePolicyIgnoreCache callback:^(id  _Nonnull responseObject, BOOL isCache, NSError * _Nonnull error) {
        NSLog(@"-------%@",responseObject);
    }];
    
}
@end

//
//  ViewController.m
//  Runtime
//
//  Created by whf on 15/7/5.
//  Copyright (c) 2015年 whf. All rights reserved.
//

#import "ViewController.h"
@interface CustomOperation: NSOperation
@end

@implementation CustomOperation



- (void)main
{
    NSLog(@"begin sleep !! thread: %@",[[NSThread currentThread] isMainThread]?@"YES":@"NO");
    sleep(10);
    NSLog(@"end sleep !! thread: %@",[[NSThread currentThread] isMainThread]?@"YES":@"NO");

}
@end

@interface ViewController ()
@property (nonatomic,strong)NSOperationQueue * queue ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // NSRunLoop
    
//
//    self.queue = [[NSOperationQueue alloc] init];
//    
//    CustomOperation * operation = [[CustomOperation alloc] init];
////    [self.queue addOperation:operation];
//    [operation start];
//    NSLog(@"added to queue");
//    
//    dispatch_group_t group = dispatch_group_create() ;
//    dispatch_group_async(group, dispatch_get_main_queue(), ^{
//        
//    });
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-1");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-2");
    });
    dispatch_barrier_async(concurrentQueue, ^(){
        NSLog(@"dispatch-barrier");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-3");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-4");
    });
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

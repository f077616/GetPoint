//
//  ScrollViewController.m
//  GetPoint
//
//  Created by f077616 on 2016/1/28.
//  Copyright © 2016年 f077616. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    // Get the specific point that was touched
    
    CGPoint point = [touch locationInView:self.view];
    if ([self.imageVIew pointInside:point withEvent:nil]) {
        CGPoint point2 =[self.view convertPoint:point toView:self.imageVIew];
        CGPoint point3 = [touch locationInView:self.imageVIew];
        NSLog(@"X:%f,Y:%f", point.x,point.y);
        NSLog(@"X2:%f,Y2:%f",point2.x,point2.y);
        NSLog(@"X3:%f,Y3:%f",point3.x,point3.y);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

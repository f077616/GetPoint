//
//  ViewController.m
//  GetPoint
//
//  Created by f077616 on 2016/1/25.
//  Copyright © 2016年 f077616. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic)NSMutableArray *buttonArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonArray =[[NSMutableArray alloc]init];
    [self.imageView setUserInteractionEnabled:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    // Get the specific point that was touched
    CGPoint point = [touch locationInView:self.imageView];
    
    
    //判斷是否點到的是imageView上面
    if ([self.imageView pointInside:point withEvent:nil]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"請輸入品牌名稱" message:@"請確實輸入" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder=@"品牌名稱";
        }];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *userEnterTextField = alertController.textFields.firstObject;
            
            UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [addButton setTitle:userEnterTextField.text forState:UIControlStateNormal];
            [addButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
            [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [addButton setBackgroundImage:[UIImage imageNamed:@"tag"] forState:UIControlStateNormal];
            [addButton setFrame:CGRectMake([touch locationInView:self.imageView].x, [touch locationInView:self.imageView].y-20,10,10)];
            [addButton sizeToFit];
            
            
            //按鈕增加長按事件！！
            
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
            [addButton addGestureRecognizer:longPress];
            
            [self.buttonArray addObject:addButton];
            
            [self.imageView addSubview:addButton];
            
            
            //設tag!!!
            if (self.buttonArray.count==0) {
                [addButton setTag:0];
            }else if(self.buttonArray.count!=0){
                [addButton setTag:self.buttonArray.count];
            }
            [self.imageView addSubview:addButton];
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
    
}

//長按按鈕事件

- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"確定要刪除按鈕嗎" message:@"刪除當前按鈕" preferredStyle: UIAlertControllerStyleActionSheet];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"刪除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        NSLog(@"Long Press");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

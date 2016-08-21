//
//  ViewController.m
//  DevAnimation
//
//  Created by Artem on 20.08.16.
//  Copyright © 2016 Artem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)viewDidLayoutSubviews {
    self.progress.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    self.progress.progressColor = [[UIColor redColor] colorWithAlphaComponent:0.4];
    self.progress.minimumValue = 0;
    self.progress.maximumValue = 100;
    self.progress.progressBorderRadius = 2;
    self.progress.borderRadius = 4;
    self.progress.animated = YES;
    self.progress.animationSpringDamping = 0.6;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)increase:(id)sender {
    self.progress.value += 10;
    
}
- (IBAction)decrease:(id)sender {
    self.progress.value -= 10;
    
}

@end

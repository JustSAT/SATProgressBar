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
    self.progress.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    self.progress.progressColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    self.progress.minimumValue = 0;
    self.progress.maximumValue = 150;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)increase:(id)sender {
    self.progress.value += 13;
    
}
- (IBAction)decrease:(id)sender {
    self.progress.value -= 11;
    
}

@end

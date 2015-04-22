//
//  ViewController.m
//  BluetoothTester
//
//  Created by Jon Vogel on 4/22/15.
//  Copyright (c) 2015 Jon Vogel. All rights reserved.
//

#import "ViewController.h"
#import "BluetoothController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *scanButton;



@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
  
  
  return Cell;
  
  
}

- (IBAction)scanPressed:(id)sender {
  
  [[BluetoothController sharedService] scanForDevices:^(NSArray *arraydeviceNames) {
    
    
  }];
  
  
}



@end

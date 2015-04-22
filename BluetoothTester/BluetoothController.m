//
//  BluetoothController.m
//  BluetoothTester
//
//  Created by Jon Vogel on 4/22/15.
//  Copyright (c) 2015 Jon Vogel. All rights reserved.
//

#import "BluetoothController.h"

@interface BluetoothController()

@property (nonatomic) CBCentralManager *myCBManager;

@end



@implementation BluetoothController

+(id)sharedService{
  static BluetoothController *myBluetoothController;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    myBluetoothController = [[BluetoothController alloc] init];
  });
  return myBluetoothController;
}


-(void)scanForDevices: (void (^)(NSArray *arraydeviceNames)) completion{
  
   self.myCBManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
 
  
  
}


//MARK: Central Manager Delegate

-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
  
}


-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI{
  
  
  
  NSData *manufacturingKey = advertisementData[@"kCBAdvDataManufacturerData"];
  
  NSString *key = [NSString stringWithUTF8String:[manufacturingKey bytes]];
  NSLog(@"%@", key);
  
  
  
}


-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
  
  if (central.state == CBCentralManagerStatePoweredOn) {
     [self.myCBManager scanForPeripheralsWithServices:nil options:@{ CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
    NSLog(@"Started Scanning");
  }
  
  
}


//MARK: Perphial Delegate
-(void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
  
}

-(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
  
}

-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error  {
  
}




@end

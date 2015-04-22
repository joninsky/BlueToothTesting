//
//  BluetoothController.h
//  BluetoothTester
//
//  Created by Jon Vogel on 4/22/15.
//  Copyright (c) 2015 Jon Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreBluetooth;
@import QuartzCore;

@interface BluetoothController : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate>



+(id)sharedService;
-(void)scanForDevices: (void (^)(NSArray *arraydeviceNames)) completion;


@end

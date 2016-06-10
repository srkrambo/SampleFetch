//
//  SFAddress.h
//  SampleFetch
//
//  Created by Rajkumar S on 6/6/16.
//  Copyright © 2016 Eezy. All rights reserved.
//

#import "SFBaseModel.h"

@interface SFAddress : SFBaseModel

@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *city;

@end

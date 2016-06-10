//
//  SFCompany.h
//  SampleFetch
//
//  Created by Rajkumar S on 6/6/16.
//  Copyright © 2016 Eezy. All rights reserved.
//

#import "SFBaseModel.h"
#import "SFAddress.h"

@interface SFCompany : SFBaseModel

@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *modelID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) SFAddress *address;

@end

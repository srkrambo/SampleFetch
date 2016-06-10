//
//  HttpManager.h
//  SampleFetch
//
//  Created by Rajkumar S on 6/6/16.
//  Copyright © 2016 Eezy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^DataCompletion)(id responseObj, NSError *error);

@interface HttpManager : NSObject

+ (id)sharedInstance;
- (void)fetchCompaniesWithCompletion:(DataCompletion)completion;

@end

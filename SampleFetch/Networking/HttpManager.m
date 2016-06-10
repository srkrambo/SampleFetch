//
//  HttpManager.m
//  SampleFetch
//
//  Created by Rajkumar S on 6/6/16.
//  Copyright © 2016 Eezy. All rights reserved.
//

#import "HttpManager.h"
#define kBaseURL @"https://eezy.apispark.net/v1"
#import "SFCompany.h"

@interface HttpManager()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation HttpManager

+ (id)sharedInstance{
    static dispatch_once_t onceToken;
    static HttpManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [HttpManager new];
        [sharedInstance initialize];
    });
    return sharedInstance;
}

-(void) initialize {
    self.manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [self.manager.requestSerializer setValue:@"Basic YjJjMTg0YzktYzM5Mi00NmQ5LWIyZmUtZjU0OTkzZmQyYjFiOjAyYzU5OTllLTUwZjktNGQwMC1iYmEyLTFkNzA4ZDEyZTBmNA==" forHTTPHeaderField:@"Authorization"];

}


- (void)fetchCompaniesWithCompletion:(DataCompletion)completion {
    [self.manager GET:@"companies" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSError *error;

       // Our parsing
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        for (int index = 0; index < [responseObject count]; index++) {
            NSDictionary *companyDict = [responseObject objectAtIndex:index];
            SFCompany *company = [[SFCompany alloc]initWithDictionary:companyDict error:&error];
            NSLog(@"Error %@",error);
            [resultArray addObject:company];
        }
        completion(resultArray, error);
        //
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        completion(nil, error);
    }];
    
}

@end

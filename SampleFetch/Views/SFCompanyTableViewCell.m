//
//  SFCompanyTableViewCell.m
//  SampleFetch
//
//  Created by Rajkumar S on 6/6/16.
//  Copyright © 2016 Eezy. All rights reserved.
//

#import "SFCompanyTableViewCell.h"

@implementation SFCompanyTableViewCell

- (void)setCellWithData:(SFCompany *)company {
    self.titleLabel.text = company.name;
    self.addressLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@", company.address.street, company.address.city, company.address.zipcode];
}

@end

//
//  SFCompanyTableViewCell.h
//  SampleFetch
//
//  Created by Rajkumar S on 6/6/16.
//  Copyright © 2016 Eezy. All rights reserved.
//

#import "SFBaseTableViewCell.h"
#import "SFCompany.h"

@interface SFCompanyTableViewCell : SFBaseTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

- (void)setCellWithData:(SFCompany *)company;

@end

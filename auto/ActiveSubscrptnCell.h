//
//  ActiveSubscrptnCell.h
// aditya
//
//  Created by // aditya on 11/27/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActiveSubscrptnCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTransactionNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblSeperator;
@property (strong, nonatomic) IBOutlet UILabel *lblPackageName;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblCancelled;
@end


//
//  NotificationCell.h
// aditya
//
//  Created by // aditya on 11/23/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *viewCell;
@property (strong, nonatomic) IBOutlet UIImageView *imgBgEmail;

@property (strong, nonatomic) IBOutlet UILabel *lblNotificationTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;


@end

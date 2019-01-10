//
//  MainViewController.h
//  LGSideMenuControllerDemo
//

#import "LGSideMenuController.h"
#import "LeftMenuVC.h"
#import "Macros.h"
#import "Constant.h"


@interface MainViewController : LGSideMenuController<LGSideMenuDelegate>
- (void)setupWithType:(NSUInteger)type;
@end

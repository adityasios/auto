//
//  SupportVC.m
//  AutoAtlas
//
//  Created by WebMazix Pro1 on 23/02/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "SupportVC.h"

@interface SupportVC ()

@end

@implementation SupportVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self  viewSetUp];
}


#pragma mark - INIT METHOD
-(void)initMethod{
}



#pragma mark - VIEW SET UP
-(void)viewSetUp{
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    self.tblv.backgroundColor = UIColorFromRGB(kBackground);
    [self setNavBar];
}


-(void)setNavBar {
    [self customNavTitle:@"Support"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(kAutoAtlasGreen);
}


-(void)customNavTitle:(NSString *)str{
    
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            kQuicksand_Bold14, NSFontAttributeName,
                                            [UIColor whiteColor], NSForegroundColorAttributeName,
                                            nil]
                                  forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.barBtnClear,titleBarButton];
}




#pragma mark - TABLE VIEW DATA SOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SupportCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SupportCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
       
        cell.lblTitle.text = @"Email";
        
        NSMutableAttributedString * astr = [[NSMutableAttributedString alloc] initWithString:@"support@theautoatlas.com.au"];
        [astr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:(NSRange){0,[astr length]}];
        [astr  addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(kfbBlue) range:(NSRange){0,[astr length]}];
        cell.lblTxt.attributedText = astr;
        
        cell.imgVIcon.image = [UIImage  imageNamed:@"mail"];
        return cell;
        
    }else {
        
        cell.lblTitle.text = @"Phone No";
        
        NSMutableAttributedString * astr = [[NSMutableAttributedString alloc] initWithString:@"+61 491 570 158"];
        [astr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:(NSRange){0,[astr length]}];
        [astr  addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(kfbBlue) range:(NSRange){0,[astr length]}];
        cell.lblTxt.attributedText = astr;
        
        cell.imgVIcon.image = [UIImage  imageNamed:@"phone"];
        return cell;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        if ([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] initWithNibName:nil bundle:nil];
            [composeViewController setMailComposeDelegate:self];
            [composeViewController setToRecipients:@[@"support@theautoatlas.com.au"]];
            [composeViewController setSubject:@"Auto Atlas Support"];
            [self presentViewController:composeViewController animated:YES completion:nil];
        }
        
    }else if (indexPath.row == 1){
        NSString * phoneNumber = [@"tel://" stringByAppendingString:@"+61491570158"];
        [[UIApplication  sharedApplication]  openURL:[NSURL URLWithString:phoneNumber] options:@{} completionHandler:nil];
    }
}




- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
if (result == 0) {
}else if (result == 1){
}else if (result == 2){
}else if (result == 3){
}
MFMailComposeResultCancelled,
MFMailComposeResultSaved,
MFMailComposeResultSent,
MFMailComposeResultFailed
*/





#pragma mark - SHOW ALERT
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        } else{
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end


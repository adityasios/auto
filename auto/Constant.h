//
//  Constant.h
//  EnVOLO
//
//  Created by  on 08/09/16.
//  
//

#ifndef Constant_h
#define Constant_h
#import "Macros.h"


//APP STORE ID
#define YOUR_APP_STORE_ID 13


//SOCIAL CONSTANTS
#define  kGoogle_API_KEY      @"AIzaSyBkK3wszt9RaPWCpR3NXKJ9CD4d1u0FTzw"
#define  kGoogle_CLIENT_ID    @"555065761974-jukt00cppd03qvj2i13j7cpf5q2jbsjl.apps.googleusercontent.com"
#define  kAPNSNotification    @"PushNotification"
#define  kfb146329546061636   @"fb146329546061636"






#pragma mark - COLOR CODES
//COLOR CODES

/*
 #define   colorTopNavBar    0x2E98CE
 #define   colorPrimary      0x6ec2ed
 #define   colorPrimary       0x008DC9
 #define   colorWhite      0xffffff
 #define   colorBrown     0x393838
 #define   colorTopNavBar     0x008DC9
 #define   colorRed    0xEC451C
 #define   colorDarkGray    0xA9A9A9
 
 #define   colorlighGrey    0xdbdbdb
 #define   groupedTblvBg    0xEBEAF1
 #define   colorYellow    0xFDAE09
 #define   colorforestgreen    0x228B22
 #define   colortomato    0xFF6347
 #define   colorredlightsalmon    0xFFA07A
 #define   KColorFlatRed  [UIColor colorWithRed:0.910 green:0.329 blue:0.271 alpha:1.000];
 #define   kVoloColorSilver    0xCCCCCC
 #define   kVoloColorPrimaryDarkGray       0x484747
 #define   kVoloColorPrimaryGray       0x646464
 #define   kVoloColorPrimaryGrayTrans       0x60646464
 #define   kVoloColorPrimaryBlackDark       0x181818
 #define   kVoloColorPrimaryBlackLight       0x222222
 #define   kVoloColorRed       0xf84241
 #define   kVoloColorWhite       0xffffff
 #define   kVoloColorWhiteLight       0x80ffffff
 #define   kVoloColorfb       0x803b5998
 #define   kVoloColorAccentRedTrans       0x20ff2318
 #define   kVoloColorBlackTrans       0x80000000
 #define   kVoloColorBlack       0x000000
 #define   kVoloColorYellow      0xf2a33c
 #define   kVoloColorPurple      0x07c3b4
 #define   kVoloColorforestgreen    0x228B22
 #define   kVoloColortomato    0xFF6347
 #define   kVoloColorBgTintColor    0x000000
 #define   kVoloColorYellow2    0xE29E11
 #define   kVoloColorTextDull    UIColorFromRGBWithAlpha(kVoloColorPrimaryGray, 0.8);
 #define   kFunshoPurple    0x42196f
 #define   kFunshoGreen    0x9fab24
 #define   kFunshoDarkGrey    0x333333
 #define   kFunshoLightGrey    0x999999
 #define   kFunshoBgLightGrey    0xEAEAEA
 #define   kFunshoPink       0xB83B8F
 #define   kFunshoBlue       0x417EC2
 #define   kFunshoOrnage       0xF18620
 #define   kFunshoOffWhite       0xFDFBFD
 #define   kFunshoBlack    0x000000
 #define   kFunshoRed    0xFF6347
 #define   kFunshoWhite      0xffffff
*/



#define kAutoAtlasGreen      0x3AB34A
#define kBackground          0xF1F1F1
#define kBlue                0x2547B5
#define kYellow     0xf2a33c




#define kappleDarkGrey     0x555555
#define kappleLightGrey    0xAAAAAA
#define kappleGrey         0x999999
#define kbgLightGrey       0xEAEAEA
#define kappleWhite        0xffffff
#define kappleBlack        0x000000
#define kappleWhite        0xffffff
#define kfbBlue            0x3B5998
#define kgoogleRed         0xd34836




#pragma mark -  FONTS


//FONT NAME
#define kQuicksandDash_Reg @"QuicksandDash-Regular"
#define kQuicksand_Bold @"Quicksand-Bold"
#define kQuicksand_BoldItalic @"Quicksand-BoldItalic"
#define kQuicksand_Italic @"Quicksand-Italic"
#define kQuicksand_Light @"Quicksand-Light"
#define kQuicksand_LightItalic @"Quicksand-LightItalic"
#define kQuicksand_Regular @"Quicksand-Regular"





#define   kQuicksand_Dash10  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksandDash_Reg size:10] : [UIFont fontWithName:kQuicksandDash_Reg size:11]
#define   kQuicksand_Dash11  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksandDash_Reg size:11] : [UIFont fontWithName:kQuicksandDash_Reg size:12]
#define   kQuicksand_Dash12  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksandDash_Reg size:12] : [UIFont fontWithName:kQuicksandDash_Reg size:13]
#define   kQuicksand_Dash13  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksandDash_Reg size:13] : [UIFont fontWithName:kQuicksandDash_Reg size:14]
#define   kQuicksand_Dash14  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksandDash_Reg size:14] : [UIFont fontWithName:kQuicksandDash_Reg size:15]
#define   kQuicksand_Dash15  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksandDash_Reg size:15] : [UIFont fontWithName:kQuicksandDash_Reg size:16]


#define   kQuicksand_Bold10  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:10] : [UIFont fontWithName:kQuicksand_Bold size:11]
#define   kQuicksand_Bold11  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:11] : [UIFont fontWithName:kQuicksand_Bold size:12]
#define   kQuicksand_Bold12  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:12] : [UIFont fontWithName:kQuicksand_Bold size:13]
#define   kQuicksand_Bold13  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:13] : [UIFont fontWithName:kQuicksand_Bold size:14]
#define   kQuicksand_Bold14  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:14] : [UIFont fontWithName:kQuicksand_Bold size:15]
#define   kQuicksand_Bold15  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:15] : [UIFont fontWithName:kQuicksand_Bold size:16]
#define   kQuicksand_Bold16  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:16] : [UIFont fontWithName:kQuicksand_Bold size:17]
#define   kQuicksand_Bold17  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:17] : [UIFont fontWithName:kQuicksand_Bold size:18]
#define   kQuicksand_Bold18  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:18] : [UIFont fontWithName:kQuicksand_Bold size:19]
#define   kQuicksand_Bold19  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:19] : [UIFont fontWithName:kQuicksand_Bold size:20]
#define   kQuicksand_Bold20  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:20] : [UIFont fontWithName:kQuicksand_Bold size:21]
#define   kQuicksand_Bold21  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:21] : [UIFont fontWithName:kQuicksand_Bold size:22]
#define   kQuicksand_Bold22  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:22] : [UIFont fontWithName:kQuicksand_Bold size:23]
#define   kQuicksand_Bold23  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:23] : [UIFont fontWithName:kQuicksand_Bold size:24]
#define   kQuicksand_Bold24  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Bold size:24] : [UIFont fontWithName:kQuicksand_Bold size:25]



#define   kQuicksand_Regular10  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Regular size:10] : [UIFont fontWithName:kQuicksand_Regular size:11]
#define   kQuicksand_Regular11  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Regular size:11] : [UIFont fontWithName:kQuicksand_Regular size:12]
#define   kQuicksand_Regular12  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Regular size:12] : [UIFont fontWithName:kQuicksand_Regular size:13]
#define   kQuicksand_Regular13  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Regular size:13] : [UIFont fontWithName:kQuicksand_Regular size:14]
#define   kQuicksand_Regular14  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Regular size:14] : [UIFont fontWithName:kQuicksand_Regular size:15]
#define   kQuicksand_Regular15  (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) ? [UIFont fontWithName:kQuicksand_Regular size:15] : [UIFont fontWithName:kQuicksand_Regular size:16]






#pragma mark - IMAGES

//IMAGE
#define kPlaceHolder_M ([UIImage  imageNamed:@"image_place_m"])
#define kPlaceHolder_S ([UIImage  imageNamed:@"image_place_s"])
#define kPlaceHolderUser_S ([UIImage  imageNamed:@"user_place"])
#define kPlaceHolderUser_M ([UIImage  imageNamed:@"user_place_m"])
#define kPlaceHolderUser_L ([UIImage  imageNamed:@"user_place_l"])
#define kFavImg ([UIImage  imageNamed:@"fav"])
#define kUnFavImg ([UIImage  imageNamed:@"unfav"])
#define kServiceImg ([UIImage  imageNamed:@"mech"])
#define kBackBtn @"arrow_left"

#define kgclose ([UIImage  imageNamed:@"closer"])
#define kfbclose ([UIImage  imageNamed:@"closeb"])




//USER DEFAULT
#pragma mark - USER DEFAULT
#define kVehicleType   @"kVehicleType"
#define kServiceType   @"kServiceType"


#pragma mark - MISCALLANEOUS

//keychain store device id
#define kHeader_Bearer @"Bearer"
#define ktoken @"ktoken"

//custom not action
#define kremind @"remind"
#define kcancel @"cancel"
#define kcatfcm @"pusher"



#define kRemindLater @"Remind Me Later"
#define kCancel @"Cancel"





#pragma mark - ALERT CONSTANTS
//ALERT CONSTANTS

#define kIndexMaxValue 10000
#define kIndex10 10
#define kAlert_ok @"OK"

#endif /* Constant_h */

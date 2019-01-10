//
//  WebServiceConstant.h
// aditya
//
//  Created by // aditya on 1/8/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#ifndef WebServiceConstant_h
#define WebServiceConstant_h



#define kkeyValue @"8dfafb41e9b4c0b3decd875e7a231049"
#define KBaseURL @"chnage for privacy"


#define KTermsURL @""
#define KPrivacyURL @""





#pragma mark - WEBSERVICE CONSTANT

//WEBSERVICE CONSTANT
#define kPostSignUp @"user/register"
#define kPostSignIn @"user/authenticate"
#define kPostGetVendorListByLatLog @"vendor/get_vendors_by_latlong"
#define kPostGetVehiclesGetBrand @"vehicles/get_brand"
#define kPostGetVehiclesGetTypes @"vehicles/get_vehicle_type_by_model"
#define kPostGetVehiclesTypes @"vehicles/get_vehicle_type"





#define kPostGetVehiclesGetModel @"vehicles/get_vehicle_model"
#define kPostMarkFav @"vendor/mark_favorite_vendor"
#define kPostMarkUnFav @"vendor/remove_favorite_vendor"
#define kPostServiceList @"settings/service_lists"
#define kPostVendorDetail @"vendor/vendor-details"
#define kPostVendorFavList @"vendor/get_favourite_vendor_list"
#define kPostNotificationList @"settings/notification_lists"
#define kPostGetVehicleList @"vehicles/user_vehicle_info"
#define kPostGetReview @"vendor/user_all_reviews"
#define kPostGetSubscriptionList @"subscription_plan/get_plans"
#define kPostAddNewVehicle @"vehicles/add_vehicle"
#define kPostPrivacyPolicy @"settings/privacy_poilcy"
#define kPostPTermsConditions @"settings/term_condition"
#define kPostForgotPassword @"user/forgot_password"
#define kPostSocialSignin @"user/social_signin"
#define kPostSubscriptionPlans @"subscription_plan/get_user_active_plan"
#define kPostTransHistory @"user/user_all_transaction"
#define kPostUpdatePaymentStatus @"subscription_plan/updatePaymentStatus"
#define kPostAddUserReview @"vendor/add_user_review"
#define kPostUpdateProfileImg @"user/update_profile_image"
#define kPostUpdateProfile @"user/update_profile"
#define kRegister_user_device @"user/register_user_device"
#define kPostUserLogOut @"user/user_logout"
#define kPostGetVendorReview @"vendor/get_vendor_reviews"
#define kPostSocialSignIn @"user/social_signin"
#define kPostSocialProfileUpdate @"user/social_profile_completed"
#define kPostEditVehicle @"vehicles/edit_vehicle_info"
#define kPostChnangePass @"user/change_password"











#pragma mark - REQUEST

//REQUEST
#define kfirst_name @"first_name"
#define klast_name @"last_name"
#define kemail @"email"
#define kpassword_hash @"password"
#define kre_password @"re_password"
#define klatitude @"latitude"
#define klongitude @"longitude"
#define kkey @"key"
#define kprofile_photo @"profile_photo"
#define kmobile @"mobile"



#pragma mark - PARAMETERS

//PARAMETERS
#define kbrand_id @"brand_id"
#define kvehicle_type_id @"vehicle_type_id"
#define kvendor_id @"vendor_id"
#define korder_by @"order_by"
#define kratings @"ratings"
#define kradius @"radius"
#define kregistration_date @"registration_date"
#define kcreated_at @"created_at"
#define kpage @"page"
#define ksubscription_plan_id @"subscription_plan_id"
#define kplan_type @"plan_type"
#define ktxn_id @"txn_id"
#define kpayment_status @"payment_status"
#define kproduct_id @"product_id"
#define kpaid_amount @"paid_amount"
#define kdevice_type @"device_type"
#define kservicetype @"servicetype[]"
#define kvehicletype @"vehicletype"
#define kservice_id @"service_id[]"
#define kreview @"review"
#define krate_star @"rate_star"
#define ktype_id @"type_id"
#define kmodel_id @"model_id"
#define kvehicle_reg_number @"vehicle_reg_number"
#define kvehicle_reg_year @"vehicle_reg_year"
#define kregistration_due_date @"registration_due_date"
#define kservice_date @"service_date"
#define ktyre_fitment_date @"tyre_fitment_date"
#define kbattery_installation_date @"battery_installation_date"
#define kinsurance_date @"insurance_date"
#define kaverage_running_per_day @"average_running_per_day"
#define kdevice_id @"device_id"
#define kfcm_id @"fcm_id"
#define kpage_no @"page_no"
#define koauth_provider @"oauth_provider"
#define koauth_uid @"oauth_uid"
#define kvehicle_id @"vehicle_id"
#define kold_password @"old_password"
#define knew_password @"new_password"
#define kremember_me @"remember_me"



#pragma mark - RESPONSE

//RESPONSE
#define kstatus @"status"
#define kmessage @"message"
#define kdata @"data"
#define kuser_id @"user_id"
#define kphone_no @"phone_no"
#define kprofile_photo @"profile_photo"
#define kcurrent_user_plan @"current_user_plan"
#define ksubscription_name @"subscription_name"
#define kvehicle_allowed @"vehicle_allowed"
#define kall_plans @"all_plans"
#define ksubscription_id @"subscription_id"
#define ktotal_vehicles @"total_vehicles"
#define kdescription @"description"
#define kreviews @"reviews"
#define ktotal_count @"total_count"
#define kfirst_name @"first_name"
#define klast_name @"last_name"
#define kid @"id"
#define ksocial_profile_updated @"social_profile_updated"
#define koauth_provider @"oauth_provider"
#define koauth_uid @"oauth_uid"









//IN APP PURCHASE CONSTANT
#pragma mark - IN APP PURCHASE CONSTANT

#define kIndividualPlus @"20"
#define kFamily @"30"
#define kBusiness @"40"
#define kBusinessFleet @"50"



//MISCALLANEOUS CONSTANT
#define kFav 1
#define kUnFav 0
#define kRemember @"1"





/*
Individual Plus
apple id   200
google id  200
1.99 AUD
one time/no expiry



Family
apple id  300
google id 300
3.99 AUD
3-4 vehicles
monthly



Business
apple id  400
google id 400
7.99 AUD
5-10 vehicles
monthly


Business Fleet
apple id  500
google id 500
12.99 AUD
11-15 vehicles
monthly













/*
Individual Plus
apple id  200
1.99 AUD

Family
apple id 300
3.99 AUD
3-4 vehicles


Business
apple id 400
7.99
5-10 vehicles

Business Fleet
apple id 500
11.99
11-15 vehicles
*/




























//MISCELLANEOUS CONSTANT
#pragma mark - MISCELLANEOUS CONSTANT
#define koneTimePlan @"1"
#define kmonthlyPlan @"2"
#define kIOS @"IOS"
#define kfacebook @"facebook"
#define kgoogle @"google"


#endif /* WebServiceConstant_h */


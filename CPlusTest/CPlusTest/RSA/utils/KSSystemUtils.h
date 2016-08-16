//
//  KSSystemUtils.h
//  KZSDK
//
//  Created by lanya on 14-9-4.
//  Copyright (c) 2014年 Kongzhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSSystemUtils : NSObject

//获取手机型号
+(NSString *) getPhoneType;

//获取手机OS
+(NSString *) getPhoneOS;

//获取当前手机唯一标识号
+(NSString *) getPhoneSerial;

//获取当前毫秒级时间字符串
+(NSString *) getCurrentMillSecTime;

//手机号是否合法
+(Boolean) validMobileNumber:(NSString *) mobileNumber;
//检查用户名是否合法
+(Boolean) validRegUserName:(NSString *) userName;
//
+(Boolean) validEmail:(NSString *)email;
//
+ (NSData *)base64DecodedData:(NSString *) string;

+ (NSString *)base64EncodedString:(NSData *)data;

//
+(NSString *) DicToJson: (NSDictionary *) dic;

//
+(NSDictionary *) Json2Dic:(NSData *) jsonData;
@end

//
//  KSResource.h
//  KZSDK
//
//  Created by lanya on 14-9-4.
//  Copyright (c) 2014年 Kongzhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSResource : NSObject

+(NSString *) getErrorByCode:(NSString *)code;
+(NSString *) getResourceById:(NSString *)id;
@end

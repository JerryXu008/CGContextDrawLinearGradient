//
//  KSResource.m
//  KZSDK
//
//  Created by lanya on 14-9-4.
//  Copyright (c) 2014年 Kongzhong. All rights reserved.
//

#import "KSResource.h"

@implementation KSResource

+(NSString *) getErrorByCode:(NSString *)code
{
    NSDictionary *ERROR_TABLE_DIC = [[NSDictionary alloc] initWithObjectsAndKeys:@"非法的请求",@"100000",
                                            @"操作失败，请稍后再试", @"100001",
                                            @"操作频繁，请稍后再试", @"100002",
                                            @"URL已失效",          @"100003",
                                            @"设备ID为空",          @"100101",
                                            @"游戏ID为空",          @"100102",
                                            @"设备ID错误",          @"100110",
                                            @"Session为空",        @"100201",
                                            @"Session无效",        @"100202",
                                            @"Token为空",          @"100301",
                                            @"Token无效",          @"100302",
                                            @"临时账号为空",        @"100401",
                                            @"临时账号密码为空",     @"100402",
                                            @"临时密码或临时账号错误", @"100410",
                                            @"已经绑定正式用户，不能使用临时账号登录", @"100411",
                                            @"用户账号为空",    @"100501",
                                            @"用户账号密码为空", @"100502",
                                            @"用户账号临时密码为空", @"100503",
                                            @"账号密码为空", @"100504",
                                            @"密码类型为空", @"100505",
                                            @"用户账号类型为空", @"100506",
                                            @"正式账号密码或账号错误", @"100510",
                                            @"账号或密码错误", @"100511",
                                            @"该账号已经被绑定", @"100514",
                                            @"账号已经存在", @"100520",
                                            @"账号格式不正确", @"100521",
                                            @"验证码为空", @"100601",
                                            @"验证码错误",        @"100610",
                                            @"手机号码为空", @"100701",
                                            @"短信验证码为空", @"100702",
                                            @"短信验证码错误", @"100712",
                                            @"手机号不可用", @"100721",
                                            @"手机号已经注册", @"100722",
                                     
                                            @"bili UID 为空", @"100801",
                                            @"bili UID 无效", @"100810",
                                            nil, nil];
    NSString *str = [ERROR_TABLE_DIC valueForKey:code];
    if (str == nil)
    {
        str = @"未知错误";
        return str;
    }
    return str;
}

+(NSString *) getResourceById:(NSString *)id
{
    return nil;
}
@end

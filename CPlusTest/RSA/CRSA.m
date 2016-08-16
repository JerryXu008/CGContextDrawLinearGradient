#import "CRSA.h"

#import "KSSystemUtils.h"

#define BUFFSIZE  1024


#define PADDING RSA_PADDING_TYPE_PKCS1
@implementation CRSA

+ (id)shareInstance
{
    static CRSA *_crsa = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _crsa = [[self alloc] init];
    });
    return _crsa;
}
- (BOOL)importRSAKeyWithType:(KeyType)type
{
    FILE *file;
   // NSString *keyName = type == KeyTypePublic ? @"public_key" : @"private_key";
    
    //    NSString *keyPath = [[NSBundle mainBundle] pathForResource:keyName ofType:@"pem"];
    
   // NSString *keyPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.pem",keyName]];
        
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"Librarybundle.bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
     NSString *   keyPath = [bundle pathForResource:@"rsa_publickey" ofType:@"pem"];

    
    file = fopen([keyPath UTF8String], "rb");
    
    if (NULL != file)
    {
        if (type == KeyTypePublic)
        {
            _rsa = PEM_read_RSA_PUBKEY(file, NULL, NULL, NULL);
            assert(_rsa != NULL);
        }
        else
        {
            _rsa = PEM_read_RSAPrivateKey(file, NULL, NULL, NULL);
            assert(_rsa != NULL);
        }
        
        fclose(file);
        
        return (_rsa != NULL) ? YES : NO;
    }
    
    return NO;
}
- (NSString *) encryptByRsa:(NSString*)content withKeyType:(KeyType)keyType
{
   
    if(content.length<=60){
      return  [self privateEncryptByRsa:content withKeyType:keyType];
    }
    else{
        NSMutableArray *arr=[NSMutableArray new];
        int num=  content.length/60;
        for(int i=0;i<num;i++){
            NSString *seprateContent=[content substringWithRange:NSMakeRange(i*60,60)];
            seprateContent=[self privateEncryptByRsa:seprateContent withKeyType:keyType];
            [arr addObject:seprateContent];
            
        }
        if(content.length>num*60){
            NSString *seprateContent=[content substringWithRange:NSMakeRange(num*60,content.length-num*60)];
            seprateContent=[self privateEncryptByRsa:seprateContent withKeyType:keyType];
            [arr addObject:seprateContent];
            
        }
        NSString *totalStr=@"";
        for(NSString *str in arr)
        {
            totalStr=[[totalStr stringByAppendingString:str] stringByAppendingString:@","];
        
        }
       totalStr= [totalStr substringWithRange:NSMakeRange(0, totalStr.length-1)];
      return totalStr;
    }
    
}
- (NSString *) privateEncryptByRsa:(NSString*)content withKeyType:(KeyType)keyType
{
    if (![self importRSAKeyWithType:keyType])
        return nil;
    
    int status;
    int length  = (int)[content length];
    
    unsigned char input[length + 1];
    bzero(input, length + 1);
    int i = 0;
    for (; i < length; i++)
    {
        input[i] = [content characterAtIndex:i];
    }
    
    NSInteger  flen = [self getBlockSizeWithRSA_PADDING_TYPE:PADDING];
    
   char *encData = (char*)malloc(flen);
   
    bzero(encData, flen);
    
    switch (keyType) {
        case KeyTypePublic:
            status = RSA_public_encrypt(length, (unsigned char*)input, (unsigned char*)encData, _rsa, PADDING);
            break;
            
        default:
            status = RSA_private_encrypt(length, (unsigned char*)input, (unsigned char*)encData, _rsa, PADDING);
            break;
    }
    
    if (status)
    {
        NSData *returnData = [NSData dataWithBytes:encData length:status];
        free(encData);
        encData = NULL;
        
        NSString *ret = [KSSystemUtils base64EncodedString: returnData];
      
        return ret;
    }
    
    free(encData);
    encData = NULL;
    
    return nil;
}
- (NSString *) decryptByRsa:(NSString*)content withKeyType:(KeyType)keyType
{
    if([content rangeOfString:@","].location==NSNotFound){
       return  [self privateDecryptByRsa:content withKeyType:keyType];
    
    }
    else{
        NSArray *arr = [content componentsSeparatedByString:@","];
        NSMutableArray *mutArr=[NSMutableArray new];
        NSString *finalStr=@"";
        for(int i=0;i<arr.count;i++){
            NSString *tempStr=[self privateDecryptByRsa:arr[i] withKeyType:keyType];
            if(tempStr){
                [mutArr addObject:tempStr];
            }
        }
        for(int j=0;j<mutArr.count;j++){
            finalStr=[finalStr stringByAppendingString:mutArr[j]];
        }
        return finalStr;
    
    }

}

- (NSString *) privateDecryptByRsa:(NSString*)content withKeyType:(KeyType)keyType
{
    if (![self importRSAKeyWithType:keyType])
        return nil;
    
    int status;
    
    NSData *data = [KSSystemUtils base64DecodedData:content];
    int length = (int)[data length];
    
    NSInteger flen = [self getBlockSizeWithRSA_PADDING_TYPE:PADDING];
    char *decData = (char*)malloc(flen);
    bzero(decData, flen);
    
    switch (keyType) {
        case KeyTypePublic:
            status = RSA_public_decrypt(length, (unsigned char*)[data bytes], (unsigned char*)decData, _rsa, PADDING);
            break;
            
        default:
            status = RSA_private_decrypt(length, (unsigned char*)[data bytes], (unsigned char*)decData, _rsa, PADDING);
            break;
    }
    
    if (status)
    {
        NSMutableString *decryptString = [[NSMutableString alloc] initWithBytes:decData length:strlen(decData) encoding:NSUTF8StringEncoding];
        free(decData);
        decData = NULL;
        
        return decryptString;
    }
    
    free(decData);
    decData = NULL;
    
    return nil;
}

- (int)getBlockSizeWithRSA_PADDING_TYPE:(RSA_PADDING_TYPE)padding_type
{
    int len = RSA_size(_rsa);
    
    if (padding_type == RSA_PADDING_TYPE_PKCS1 || padding_type == RSA_PADDING_TYPE_SSLV23) {
        len -= 11;
    }
    
    return len;
}
@end

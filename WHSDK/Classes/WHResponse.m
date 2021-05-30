//
//  WHResponse.m
//  WHSDK
//
//  Created by zero on 2021/5/30.
//

#import "WHResponse.h"

@implementation WHResponse

+(instancetype)serializer
{
    return [self new];
}

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    }
    return self;
}

#pragma mark - AFURLResponseSerialization
-(id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    if(![self validateResponse:(NSHTTPURLResponse *)response data:data error:error])
    {
        return nil;
    }
    
    return data;
}

#pragma mark - NSSecureCoding
-(instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if(self)
    {
//        self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain" nil];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
}

#pragma mark - NSCopying
-(instancetype)copyWithZone:(NSZone *)zone
{
    WHResponse *serializer = [super copyWithZone:zone];
    return serializer;
}

@end

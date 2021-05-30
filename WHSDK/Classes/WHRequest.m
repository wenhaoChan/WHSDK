//
//  WHRequest.m
//  WHSDK
//
//  Created by zero on 2021/5/30.
//

#import "WHRequest.h"

#import "AFSecurityPolicy.h"
#import "AFHTTPSessionManager.h"

#import "AFURLResponseSerialization.h"

@implementation WHRequest

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest*)request
                               withParameters:(id)parameters
                                        error:(NSError *__autoreleasing *)error
{
    NSParameterAssert(request);
    
    if([self.HTTPMethodsEncodingParametersInURI containsObject:[[request HTTPMethod] uppercaseString]])
    {
        return [super requestBySerializingRequest:request withParameters:parameters error:error];
    }
    
    NSMutableURLRequest* mutableRequest = [request mutableCopy];
    [self.HTTPRequestHeaders enumerateKeysAndObjectsUsingBlock:^(id field, id value, BOOL * __unused stop)
    {
        if (![request valueForHTTPHeaderField:field]) {
            [mutableRequest setValue:value forHTTPHeaderField:field];
        }
    }];
    
    if(parameters)
    {
        [mutableRequest setHTTPBody:parameters];
    }
    
    return mutableRequest;
}

#pragma mark - NSSecureCoding
- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if(self)
    {
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
}

#pragma mark - NSCopying

-(instancetype)copyWithZone:(NSZone *)zone
{
    WHRequest* serializer = [super copyWithZone:zone];
    return serializer;
}

@end

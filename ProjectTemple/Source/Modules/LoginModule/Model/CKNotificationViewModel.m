//
//  CKNotificationViewModel.m
//  ProjectTemple
//
//  Created by mac on 15/9/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CKNotificationViewModel.h"

@implementation CKNotificationViewModel

-(NSDictionary *) requestParameters
{
    return @{
             @"json" : @"2W4W2gCj1CWn5%2BUvcsRI2qFSorFWVDnRAYl3oiBq4VbEELh/%2BJ8EMrvn5213/jGLdc22lepHY%2BKGtKLd1PAcZUnNQ%2BejzUp428fYoq12z4vb3Do/J1bwUFl6n%2B5sZc/RDeJfE/OhIBokIf1DgSYRyrXcri6%2B%2BnV3Hp46rMZGFObeZIHAsiOYti%2BjKrM/fHsAsFZyOtm2AkBwbYIqCGUUrQ==",
             };
}

-(NSString *) requestURLPath
{
   return @"gift_msgs.action";
}

-(void) configRequestManagerBeforeSend
{
    [self.requestManager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
        return [NSString stringWithFormat:@"json=%@",[[parameters objectForKey:@"json"] stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"]];
    }];
    self.requestManager.responseSerializer.acceptableContentTypes = [self.requestManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
}
@end

//
//  NSObject+AssociatedDictionary.m
//
//  Created by Vikram Kriplaney on 28/03/14.
//  Copyright (c) 2014 iPhonso GmbH. All rights reserved.
//

#import "NSObject+AssociatedDictionary.h"
#import <objc/runtime.h>

@implementation NSObject (AssociatedDictionary)
@dynamic extraProperties;

static const void *kAssociatedDictionaryKey = &kAssociatedDictionaryKey;

- (NSMutableDictionary *)extraProperties
{
    NSMutableDictionary *extraProperties = objc_getAssociatedObject(self, kAssociatedDictionaryKey);
    if (!extraProperties) {
        extraProperties = [NSMutableDictionary dictionaryWithCapacity:4];
        objc_setAssociatedObject(self, kAssociatedDictionaryKey, extraProperties, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return extraProperties;
}
@end

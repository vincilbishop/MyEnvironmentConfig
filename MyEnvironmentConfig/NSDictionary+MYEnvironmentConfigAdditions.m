//
//  NSDictionary+MYEnvironmentConfigAdditions.m
//  
//
//  Created by Vincil Bishop on 12/6/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "NSDictionary+MYEnvironmentConfigAdditions.h"

@implementation NSDictionary (MYEnvironmentConfigAdditions)

+ (NSDictionary *) MYEC_dictionaryByMerging: (NSDictionary *) dict1 with: (NSDictionary *) dict2 {
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary * resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    
    [resultTemp addEntriesFromDictionary:dict2];
    
    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if ([dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict1 objectForKey: key] MYEC_dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
        else if([dict2 objectForKey:key])
        {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict2 objectForKey: key] MYEC_dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
    }];
    
    return (NSDictionary *) [result mutableCopy];
}

- (NSDictionary *) MYEC_dictionaryByMergingWith: (NSDictionary *) dict {
    return [[self class] MYEC_dictionaryByMerging: self with: dict];
}

@end

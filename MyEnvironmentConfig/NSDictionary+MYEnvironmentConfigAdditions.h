//
//  NSDictionary+PSEnvironmentConfigAdditions.h
//  
//
//  Created by Vincil Bishop on 12/6/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MYEnvironmentConfigAdditions)

+ (NSDictionary *) MY_dictionaryByMerging: (NSDictionary *) dict1 with: (NSDictionary *) dict2;
- (NSDictionary *) MY_dictionaryByMergingWith: (NSDictionary *) dict;

@end

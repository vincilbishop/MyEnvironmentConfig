//
//  MYEnvironmentConfig+EXAdditions.m
//  Example
//
//  Created by Vincil Bishop on 3/14/14.
//  Copyright (c) 2014 Premier Mobile Systems. All rights reserved.
//

#import "MYEnvironmentConfig+EXAdditions.h"

@implementation MYEnvironmentConfig (EXAdditions)

- (NSString*) host
{
    return [self configValueForKey:@"host"];
}

- (NSURL*) httpURL
{
    NSString *httpURLString = [NSString stringWithFormat:[self configValueForKey:@"httpURLFormat"],[self host]];
    return [NSURL URLWithString:httpURLString];
}

@end

//
//  MYEnvironmentConfig.m
//  
//
//  Created by Vincil Bishop on 9/11/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "MYEnvironmentConfig.h"
#import "NSDictionary+MYEnvironmentConfigAdditions.h"

@interface MYEnvironmentConfig ()

@property (nonatomic,strong) NSBundle *resourceBundle;
@property (nonatomic,strong) NSString *infoPListEnvironmentKey;
@property (nonatomic,strong) NSString *environmentPList;
@property (nonatomic,strong) NSString *defaultConfigurationKey;

@end

@implementation MYEnvironmentConfig

static MYEnvironmentConfig *_sharedConfig;

+ (MYEnvironmentConfig*) sharedConfig
{
    NSAssert(_sharedConfig,@"Must set sharedConfig before using!");
    return _sharedConfig;
}

+ (void) setSharedConfig:(MYEnvironmentConfig*)sharedConfig
{
    _sharedConfig = sharedConfig;
}

+ (void) initSharedConfigWithPList:(NSString*)environmentPList
{
    MYEnvironmentConfig *config = [[MYEnvironmentConfig alloc] initWithPList:environmentPList];
    [self setSharedConfig:config];
}

- (id)initWithPList:(NSString*)environmentPList environmentKey:(NSString*)infoPListEnvironmentKey defaultConfigKey:(NSString*)defaultConfigurationKey resourceBundle:(NSBundle*)resourceBundle
{
    self = [super init];
    
    if (self) {
        _resourceBundle = resourceBundle;
        _infoPListEnvironmentKey = infoPListEnvironmentKey;
        _defaultConfigurationKey = defaultConfigurationKey;
        _environmentPList = environmentPList;
        [self loadEnvironmentConfig];
    }
    
    return self;
}

- (id)initWithPList:(NSString*)environmentPList
{
    self = [self initWithPList:environmentPList environmentKey:nil defaultConfigKey:nil resourceBundle:nil];
    
    if (self) {
        
    }
    
    return self;
}

#pragma mark - Environment Config -

- (void) loadEnvironmentConfig
{
    if (!self.resourceBundle) {
        self.resourceBundle = [NSBundle mainBundle];
    }
    
    if (!self.defaultConfigurationKey) {
        self.defaultConfigurationKey = @"Defaults";
    }
    
    if (!self.infoPListEnvironmentKey) {
        self.infoPListEnvironmentKey = @"Environment";
    }
    
    NSString* configurationDict = [[self.resourceBundle infoDictionary] objectForKey:self.infoPListEnvironmentKey];
    NSBundle* bundle = self.resourceBundle;
    NSString* envsPListPath = [bundle pathForResource:self.environmentPList ofType:nil];
    NSDictionary* environments = [[NSDictionary alloc] initWithContentsOfFile:envsPListPath];
    NSDictionary* environment = [environments objectForKey:configurationDict];
    
    // Let's coimbine values with the default config
    NSDictionary *defaultValues = [environments valueForKeyPath:self.defaultConfigurationKey];
    
    NSDictionary *combinedValues = [defaultValues MY_dictionaryByMergingWith:environment];
    
    _configValues = combinedValues;

}

#pragma mark - Helper Methods -

- (id) configValueForKey:(NSString*)key
{
    id value = [self.configValues valueForKey:key];
    
    if (!value) {
#ifdef DDLogError
        // It can be hard to find when a value is missing, let's give oursleves a hint...
        NSString *errorMessage = [NSString stringWithFormat:@"Config Key [%@] not found in environment configuration!!!",key];
        DDLogError(@"%@",errorMessage);
#endif
    }

    return value;
}

@end

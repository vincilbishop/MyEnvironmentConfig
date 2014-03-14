//
//  MYEnvironmentConfig.h
//  
//
//  Created by Vincil Bishop on 9/11/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
	A utility class that provides configuration values from a .plist based on build configuration.
    @discussion Consider subclassing and implementing as a singleton.
 */
@interface MYEnvironmentConfig : NSObject


@property (nonatomic,readonly) NSDictionary *configValues;

/**
 A shared instance for convenience.
 @returns An initialized static shared instance.
 */
+ (MYEnvironmentConfig*) sharedConfig;

/**
 Sets the shared instance.
 */
+ (void) setSharedConfig:(MYEnvironmentConfig*)sharedConfig;

/**
 Iniitilizes the shared instance with the environmentPList file and default values.
 */
+ (void) initSharedConfigWithPList:(NSString*)environmentPList;

/**
	Initializes the instance with property values.
	@param environmentPList The PList filename to load build configuration specific values from. A value must be supplied for this parameter.
	@param infoPListEnvironmentKey The key in the info.plist file that will convey the current build configuration. Passing nil will use the default value of "Environment".
	@param defaultConfigurationKey The top level key in the environmentPList that will be used for default values. Passing nil will use the default value of "Defaults".
	@param resourceBundle The resource bundle containing the environmentPList. Passing nil will use the default value of [NSBundle mainBundle].
	@returns An initialized instance.
 */
- (id)initWithPList:(NSString*)environmentPList environmentKey:(NSString*)infoPListEnvironmentKey defaultConfigKey:(NSString*)defaultConfigurationKey resourceBundle:(NSBundle*)resourceBundle
;

/**
	Initializes the instance with property values.
	@param environmentPList The PList filename to load build configuration specific values from. A value must be supplied for this parameter.
	@returns An initialized instance.
 */
- (id)initWithPList:(NSString*)environmentPList
;

/**
	Retrieves a confuration value from the configValues dictionary, based on the current build configuration of course.
	@param key The key from the environmentPList to
	@returns The value associated with the current build configuration.
 */
- (id) configValueForKey:(NSString*)key
;

@end

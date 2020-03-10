//
//  NSObject+SHAdd.h
//  LotteryPlay
//
//  Created by wangsh on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SHAdd)

#pragma  mark - NSUserDefaults存取操作
+(void)saveBoolValueInUD:(BOOL)value forKey:(NSString *)key;
+(void)saveDataValueInUD:(NSData *)data forKey:(NSString *)key;
+(void)saveValueInUD:(id)value forKey:(NSString *)key;
+(void)saveStrValueInUD:(NSString *)str forKey:(NSString *)key;
+(void)saveDicValueInUD:(NSDictionary *)dic forKey:(NSString *)key;
+(void)saveArrValueInUD:(NSArray *)arr forKey:(NSString *)key;
+(void)saveDateValueInUD:(NSDate *)date forKey:(NSString *)key;
+(void)saveIntValueInUD:(NSInteger)value forKey:(NSString *)key;
+(void)removeValueInUDWithKey:(NSString *)key;
+(id)getValueInUDWithKey:(NSString *)key;
+(NSDate *)getDateValueInUDWithKey:(NSString *)key;
+(NSString *)getStrValueInUDWithKey:(NSString *)key;
+(NSInteger )getIntValueInUDWithKey:(NSString *)key;
+(NSDictionary *)getDicValueInUDWithKey:(NSString *)key;
+(NSArray *)getArrValueInUDWithKey:(NSString *)key;
+(NSData *)getdataValueInUDWithKey:(NSString *)key;
+(BOOL)getBoolValueInUDWithKey:(NSString *)key;

#pragma mark - 归档和反归档
+ (void) keyedArchiverObject:(id)object ForKey:(NSString *)key ToFile:(NSString *)path;
+ (NSArray *) keyedUnArchiverForKey:(NSString *)key FromFile:(NSString *)path;

#pragma mark - About Class
///=============================================================================
/// @name About Class
///=============================================================================
//类名
- (NSString *)className;
+ (NSString *)className;
//父类名称
- (NSString *)superClassName;
+ (NSString *)superClassName;

//实例属性字典
-(NSDictionary *)propertyDictionary;

//属性名称列表
- (NSArray *)propertyKeys;
+ (NSArray *)propertyKeys;

//属性详细信息列表
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;

//格式化后的属性列表
+ (NSArray *)propertiesWithCodeFormat;

//方法列表
-(NSArray*)methodList;
+(NSArray*)methodList;

-(NSArray*)methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)registedClassList;
//实例变量
+ (NSArray *)instanceVariable;

//协议列表
-(NSDictionary *)protocolList;
+ (NSDictionary *)protocolList;


- (BOOL)hasPropertyForKey:(NSString*)key;
- (BOOL)hasIvarForKey:(NSString*)key;

#pragma mark - Swap method (Swizzling)
///=============================================================================
/// @name Swap method (Swizzling)
///=============================================================================

/**
 * 交换两个实例方法的实现.
 
 * @param originalSel   Selector 1.
 * @param newSel        Selector 2.
 * @return              YES if swizzling succeed; otherwise, NO.
 */
+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;

/**
 * 交换类方法的实现
 
 * @param originalSel   Selector 1.
 * @param newSel        Selector 2.
 * @return              YES if swizzling succeed; otherwise, NO.
 */
+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;


/**
获取当前控制器
*/
- (UIViewController *)getCurrentViewController;

@end
NS_ASSUME_NONNULL_END

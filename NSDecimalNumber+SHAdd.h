//
//  NSDecimalNumber+SHAdd.h
//  Pods-SHCommonElement_Example
//
//  Created by wangsh on 2019/4/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (SHAdd)
#pragma mark - RoundPlain
///=============================================================================
/// @name RoundPlain
///=============================================================================
/**
 *  @brief  四舍五入 NSRoundPlain
 *
 *  @param scale 限制位数
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)roundToScale:(NSUInteger)scale;
/**
 *  @brief  四舍五入
 *
 *  @param scale        限制位数
 *  @param roundingMode NSRoundingMode
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)roundToScale:(NSUInteger)scale mode:(NSRoundingMode)roundingMode;
@end

NS_ASSUME_NONNULL_END

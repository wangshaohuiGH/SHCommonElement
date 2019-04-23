//
//  UIView+SHBadgeView.h
//  Pods-SHCommonElement_Example
//
//  Created by wangsh on 2019/4/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SHBadgePosition) {
    SHBadgePositionRight    = 0 << 1,   // default 0
    SHBadgePositionLeft     = 1 << 1,   // 2
    
    SHBadgePositionTop      = 0 << 3,   // default 0
    SHBadgePositionBottom   = 1 << 3,   // 8
    
    SHBadgePositionIn       = 0 << 5,   // default 0
    SHBadgePositionHalf     = 1 << 5,   // 32
    SHBadgePositionOut      = 3 << 5    // 96
};

@interface SHBadgeView : UIView

@property (nonatomic, assign) SHBadgePosition position;

@property (nonatomic, assign) NSInteger badgeValue;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *badgeColor;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIColor *outlineColor;

@property (nonatomic, assign) float outlineWidth;

@property (nonatomic, assign) CGPoint contentOffset;

@property (nonatomic, assign) BOOL displayIfZero;

@property (nonatomic, assign) float horizontalOffset;

@property (nonatomic, assign) float verticalOffset;

@property (nonatomic, assign) CGPoint positionOffset;

@end

@interface UIView (SHBadgeView)

@property(nonatomic, strong, readonly) SHBadgeView *sh_badgeView;

@end

NS_ASSUME_NONNULL_END

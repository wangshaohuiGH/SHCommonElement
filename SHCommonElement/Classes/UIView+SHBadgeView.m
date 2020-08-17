//
//  UIView+SHBadgeView.m
//  Pods-SHCommonElement_Example
//
//  Created by wangsh on 2019/4/23.
//

#import "UIView+SHBadgeView.h"
#import <objc/runtime.h>

@interface SHBadgeView ()

@property (nonatomic, strong) NSArray *positionContrains;

@property (nonatomic, strong) NSLayoutConstraint *widthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *heightConstraint;

@end

@implementation SHBadgeView
- (instancetype)initWithSuperView:(UIView *)superView
{
    self = [super init];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.userInteractionEnabled = NO;
        
        _font = [UIFont boldSystemFontOfSize:11.0];
        _badgeColor = [UIColor blueColor];
        _textColor = [UIColor whiteColor];
        _outlineColor = [UIColor whiteColor];
        _outlineWidth = 1.0;
        _contentOffset = CGPointMake(5, 2);
        _displayIfZero = NO;
        _horizontalOffset = 0.0;
        _verticalOffset = 0.0;
        _position = SHBadgePositionRight | SHBadgePositionTop | SHBadgePositionIn;
        
        self.backgroundColor = [UIColor clearColor];
        self.opaque = YES;
        
        [superView addSubview:self];
        [self updateBadgeViewPosition];
        [self addConstraint:self.widthConstraint];
        [self addConstraint:self.heightConstraint];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if(_badgeValue != 0 || _displayIfZero) {
        
        NSString *stringToDraw  = nil;
        if (_badgeValue > 99) {
            stringToDraw = @"99+";
        }else {
            stringToDraw = [NSString stringWithFormat:@"%ld", (long)_badgeValue];
        }
        
        
        CGRect pathRect = CGRectInset(rect, _outlineWidth/2.f, _outlineWidth/2.f);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:pathRect cornerRadius:pathRect.size.height/2];
        path.lineWidth = _outlineWidth;
        [_badgeColor setFill];
        [_outlineColor setStroke];
        [path fill];
        [path stroke];
        
        CGSize numberSize = [stringToDraw sizeWithAttributes:@{NSFontAttributeName: _font}];
        
        [_textColor set];
        NSMutableParagraphStyle *paragrapStyle = [NSMutableParagraphStyle new];
        paragrapStyle.lineBreakMode = NSLineBreakByClipping;
        paragrapStyle.alignment = NSTextAlignmentCenter;
        
        CGRect lblRect = CGRectMake(rect.origin.x, (rect.size.height / 2.0) - (numberSize.height / 2.0), rect.size.width, numberSize.height);
        
        [stringToDraw drawInRect:lblRect withAttributes:@{
                                                          NSFontAttributeName : _font,
                                                          NSParagraphStyleAttributeName : paragrapStyle,
                                                          NSForegroundColorAttributeName : _textColor
                                                          }];
        
    }
}

#pragma mark - Setter

- (void)setBadgeValue:(NSInteger)badgeValue
{
    if(_badgeValue != badgeValue) {
        _badgeValue = badgeValue;
        [self updateBadgeViewSize];
        [self setNeedsDisplay];
    }
}

- (void)setPosition:(SHBadgePosition)position
{
    if(_position != position) {
        _position = position;
        [self updateBadgeViewPosition];
    }
}

- (void)setContentOffset:(CGPoint)contentOffset
{
    if (_contentOffset.x != contentOffset.x || _contentOffset.y != contentOffset.y) {
        _contentOffset = contentOffset;
        [self updateBadgeViewSize];
    }
}

- (void)setBadgeColor:(UIColor *)badgeColor
{
    if(_badgeColor != badgeColor) {
        _badgeColor = badgeColor;
        [self setNeedsDisplay];
    }
}

- (void)setTextColor:(UIColor *)textColor {
    if(_textColor != textColor) {
        _textColor = textColor;
        [self setNeedsDisplay];
    }
}

- (void)setOutlineColor:(UIColor *)outlineColor
{
    if(_outlineColor != outlineColor) {
        _outlineColor = outlineColor;
        [self setNeedsDisplay];
    }
}

- (void)setOutlineWidth:(float)outlineWidth
{
    if(_outlineWidth != outlineWidth) {
        _outlineWidth = outlineWidth;
        [self setNeedsDisplay];
    }
}

- (void)setFont:(UIFont *)font
{
    if(_font != font) {
        _font = font;
        [self updateBadgeViewSize];
        [self setNeedsDisplay];
    }
}

- (void)setDisplayIfZero:(BOOL)displayIfZero
{
    if(_displayIfZero != displayIfZero) {
        _displayIfZero = displayIfZero;
        if(_badgeValue == 0) {
            [self updateBadgeViewSize];
        }
    }
}

- (void)setVerticalOffset:(float)verticalOffset
{
    _verticalOffset = verticalOffset;
    [self updateBadgeViewPosition];
}

- (void)setHorizontalOffset:(float)horizontalOffset
{
    _horizontalOffset = horizontalOffset;
    [self updateBadgeViewPosition];
}

- (void)setPositionOffset:(CGPoint)positionOffset
{
    _positionOffset = positionOffset;
    _verticalOffset = positionOffset.y;
    _horizontalOffset = positionOffset.x;
    [self updateBadgeViewPosition];
}

#pragma mark - Private Methods

- (void)updateBadgeViewSize
{
    //Calculate badge bounds
    float badgeHeight = 0.f;
    float badgeWidth = 0.f;
    if(_badgeValue != 0 || _displayIfZero) {
        CGSize numberSize = [[NSString stringWithFormat:@"%ld", (long)_badgeValue] sizeWithAttributes:@{NSFontAttributeName: _font}];
        badgeHeight = 2*(_contentOffset.y+_outlineWidth) + numberSize.height;
        badgeWidth = 2*(_contentOffset.x+_outlineWidth) + numberSize.width;
        if(badgeWidth < badgeHeight) {
            badgeWidth = badgeHeight;
        }
    }
    self.widthConstraint.constant = badgeWidth;
    self.heightConstraint.constant = badgeHeight;
    
}


- (void)updateBadgeViewPosition
{
    if (self.positionContrains) {
        [self.superview removeConstraints:self.positionContrains];
        self.positionContrains = nil;
    }
    NSLayoutConstraint *horizontal;
    NSLayoutConstraint *vertical;
    NSInteger positionNumber = _position;
    switch (positionNumber) {
        case 0: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeRight superAttribut:NSLayoutAttributeRight constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeTop superAttribut:NSLayoutAttributeTop constant:_verticalOffset];
        }
            break;
        case 32: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeCenterX superAttribut:NSLayoutAttributeRight constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeCenterY superAttribut:NSLayoutAttributeTop constant:_verticalOffset];
        }
            break;
        case 96: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeLeft superAttribut:NSLayoutAttributeRight constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeBottom superAttribut:NSLayoutAttributeTop constant:_verticalOffset];
        }
            break;
        case 8: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeRight superAttribut:NSLayoutAttributeRight constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeBottom superAttribut:NSLayoutAttributeBottom constant:_verticalOffset];
        }
            break;
        case 40: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeCenterX superAttribut:NSLayoutAttributeRight constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeCenterY superAttribut:NSLayoutAttributeBottom constant:_verticalOffset];
        }
            break;
        case 104: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeLeft superAttribut:NSLayoutAttributeRight constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeBottom superAttribut:NSLayoutAttributeBottom constant:_verticalOffset];
        }
            break;
        case 2: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeLeft superAttribut:NSLayoutAttributeLeft constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeTop superAttribut:NSLayoutAttributeTop constant:_verticalOffset];
        }
            break;
        case 34: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeCenterX superAttribut:NSLayoutAttributeLeft constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeCenterY superAttribut:NSLayoutAttributeTop constant:_verticalOffset];
        }
            break;
        case 98: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeRight superAttribut:NSLayoutAttributeLeft constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeBottom superAttribut:NSLayoutAttributeTop constant:_verticalOffset];
        }
            break;
        case 10: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeLeft superAttribut:NSLayoutAttributeLeft constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeBottom superAttribut:NSLayoutAttributeBottom constant:_verticalOffset];
        }
            break;
        case 42: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeCenterX superAttribut:NSLayoutAttributeLeft constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeCenterY superAttribut:NSLayoutAttributeBottom constant:_verticalOffset];
        }
            break;
        case 106: {
            horizontal = [self makeContraintWithSelfAttribut:NSLayoutAttributeRight superAttribut:NSLayoutAttributeLeft constant:_horizontalOffset];
            vertical = [self makeContraintWithSelfAttribut:NSLayoutAttributeTop superAttribut:NSLayoutAttributeBottom constant:_verticalOffset];
        }
            break;
        default:
            break;
    }
    self.positionContrains = @[horizontal, vertical];
    [self.superview addConstraints:self.positionContrains];
}

- (NSLayoutConstraint *)makeContraintWithSelfAttribut:(NSLayoutAttribute)selfAttribute superAttribut:(NSLayoutAttribute)superAttribute constant:(CGFloat)constant
{
    return [NSLayoutConstraint
            constraintWithItem:self
            attribute:selfAttribute
            relatedBy:NSLayoutRelationEqual
            toItem:self.superview
            attribute:superAttribute
            multiplier:1.0
            constant:constant];
}

#pragma mark - Getter

- (NSLayoutConstraint *)widthConstraint
{
    if (_widthConstraint == nil) {
        _widthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0];
    }
    return _widthConstraint;
}

- (NSLayoutConstraint *)heightConstraint
{
    if (_heightConstraint == nil) {
        _heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0];
    }
    return _heightConstraint;
}

@end


@implementation UIView (SHBadgeView)


- (void)setMs_badgeView:(SHBadgeView *)sh_badgeView
{
    objc_setAssociatedObject(self, @selector(sh_badgeView), sh_badgeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SHBadgeView *)sh_badgeView
{
    SHBadgeView *badgeView = objc_getAssociatedObject(self, _cmd);
    if (badgeView == nil) {
        badgeView = [[SHBadgeView alloc] initWithSuperView:self];
        
        objc_setAssociatedObject(self, _cmd, badgeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return badgeView;
}
@end

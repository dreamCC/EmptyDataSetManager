//
//  EmptyDataSetManager.m
//  CJModule
//
//  Created by 仁和Mac on 2017/10/26.
//  Copyright © 2017年 zhucj. All rights reserved.
//

#import "EmptyDataSetManager.h"

static EmptyDataSetManager *manager = nil;

@implementation EmptyDataSetManager

+(instancetype)emptyDataSetWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle {
    EmptyDataSetManager *manager = [[EmptyDataSetManager alloc] init];
    [manager updateEmptyDataSetImage:image title:title message:message buttonTitle:buttonTitle];
    return manager;
}

-(void)updateEmptyDataSetImage:(UIImage *)image title:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle {
    self.image = image;
    self.title = title;
    self.message = message;
    self.buttonTitle = buttonTitle;
}


-(instancetype)init {
    self = [super init];
    if (self && manager) {
        [self initializes];
    }
    return self;
}

-(void)initializes {
    self.image = [EmptyDataSetManager appearance].image;
    self.imageTintColor = [EmptyDataSetManager appearance].imageTintColor;
    self.imageAnimation = [EmptyDataSetManager appearance].imageAnimation;
    
    self.title       = [EmptyDataSetManager appearance].title;
    self.message     = [EmptyDataSetManager appearance].message;
    self.buttonTitle = [EmptyDataSetManager appearance].buttonTitle;
    self.titleAttibutes        = [EmptyDataSetManager appearance].titleAttibutes;
    self.messageAttributes     = [EmptyDataSetManager appearance].messageAttributes;
    self.buttonTitleAttributes = [EmptyDataSetManager appearance].buttonTitleAttributes;
    
    self.buttonImage = [EmptyDataSetManager appearance].buttonImage;
    self.buttonBackgroudImage = [EmptyDataSetManager appearance].buttonBackgroudImage;
    
    self.spaceHeight     = [EmptyDataSetManager appearance].spaceHeight;
    self.verticalOffset  = [EmptyDataSetManager appearance].verticalOffset;
    self.backgroundColor = [EmptyDataSetManager appearance].backgroundColor;
    
    
    self.shouldDisplay = [EmptyDataSetManager appearance].shouldDisplay;
    self.shouldAllowScroll  = [EmptyDataSetManager appearance].shouldAllowScroll;
    self.shouldAllowTouch   = [EmptyDataSetManager appearance].shouldAllowTouch;
    self.shouldFadeIn       = [EmptyDataSetManager appearance].shouldFadeIn;
    self.shouldAnimateImage = [EmptyDataSetManager appearance].shouldAnimateImage;
    self.shouldBeForcedToDisplay = [EmptyDataSetManager appearance].shouldBeForcedToDisplay;
    
    self.customView     = [EmptyDataSetManager appearance].customView;
    self.showCustomView = [EmptyDataSetManager appearance].showCustomView;
}

#pragma mark --- DZNEmptyDataSetDelegate & DZNEmptyDataSetSource
// image
-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.image;
}

-(UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.imageTintColor;
}

-(CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
    return self.imageAnimation;
}

// title
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.title.length > 0) {
        return [[NSAttributedString alloc] initWithString:self.title attributes:self.titleAttibutes];
    }
    return nil;}

// description
-(NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.message.length > 0) {
        return [[NSAttributedString alloc] initWithString:self.message attributes:self.messageAttributes];
    }
    return nil;}

// button
-(UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return self.buttonImage;
}

-(UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return self.buttonBackgroudImage;
}

-(NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (self.buttonTitle.length > 0) {
        return [[NSAttributedString alloc] initWithString:self.buttonTitle attributes:self.buttonTitleAttributes];
    }
    return nil;}

// contents
-(CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return self.spaceHeight;
}

-(CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return self.verticalOffset;
}

-(UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.backgroundColor;
}

-(UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.showCustomView) {
        return self.customView;
    }
    return nil;
}

/// delegate
-(BOOL)emptyDataSetShouldFadeIn:(UIScrollView *)scrollView {
    return self.shouldFadeIn;
}

-(BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return self.shouldDisplay;
}

-(BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return self.shouldAllowTouch;
}

-(BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return self.shouldAllowScroll;
}

-(BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView {
    return self.shouldAnimateImage;
}

-(BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView {
    return self.shouldBeForcedToDisplay;
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    !self.emptyDataSetTapView?:self.emptyDataSetTapView(scrollView, view, self);
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    !self.emptyDataSetTapButton?:self.emptyDataSetTapButton(scrollView, button, self);
}


@end


@implementation EmptyDataSetManager (Appearance)

+(void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self appearance];
    });
}

+(instancetype)appearance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[EmptyDataSetManager alloc] init];
            
            manager.titleAttibutes        = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                           NSForegroundColorAttributeName:[UIColor lightGrayColor]};
            manager.messageAttributes     = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                           NSForegroundColorAttributeName:[UIColor lightGrayColor]};
            manager.buttonTitleAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                           NSForegroundColorAttributeName:[UIColor lightGrayColor]};
            
            manager.spaceHeight     = 11;
            manager.verticalOffset  = 0;
            manager.backgroundColor = [UIColor whiteColor];
            
            
            manager.shouldDisplay = YES;
            manager.shouldAllowScroll  = NO;
            manager.shouldAllowTouch   = YES;
            manager.shouldFadeIn       = YES;
            manager.shouldAnimateImage = NO;
            manager.shouldBeForcedToDisplay = NO;
            
            manager.showCustomView = YES;
        }
    });
    return manager;
}

@end

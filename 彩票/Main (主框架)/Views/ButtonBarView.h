//
//  ButtonBarView.h
//  彩票
//
//  Created by Jusive on 15/11/30.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ButtonBarView;
@protocol ButtonBarViewDeletage <NSObject>

-(void)ButtonBarView:(ButtonBarView *)buttomBarView didClickuttomWhitIndex:(int)idx;

@end

@interface ButtonBarView : UIView

-(void)addBottonBarButtonWithImageName:(NSString *)normal Selected:(NSString *)selected;
@property (nonatomic,weak) id<ButtonBarViewDeletage>delegate;
@end

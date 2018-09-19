//
//  MMScanView.h
//  MMScanDemo
//
//  Created by xuyangbo on 2018/9/10.
//  Copyright © 2018年 tjsk. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MMScanTypeQrCode,
    MMScanTypeBarCode,
    MMScanTypeAll,
} MMScanType;

@interface MMScanView : UIView

-(id)initWithFrame:(CGRect)frame style:(NSString *)style;

- (void)stopAnimating;

@property (nonatomic, assign) MMScanType scanType;

@end

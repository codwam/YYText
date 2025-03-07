//
//  YYTextRubyExample.m
//  YYKitExample
//
//  Created by ibireme on 15/9/9.
//  Copyright (C) 2015 ibireme. All rights reserved.
//

#import "YYTextRubyExample.h"
#import "YYText.h"
#import "YYImage.h"
#import "UIImage+YYWebImage.h"
#import "UIView+YYAdd.h"
#import "NSBundle+YYAdd.h"
#import "NSString+YYAdd.h"
#import "YYTextExampleHelper.h"

/*
 Ruby Annotation
 See: http://www.w3.org/TR/ruby/
 */
@implementation YYTextRubyExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    
    if (kSystemVersion < 8) {
        [text yy_appendString:@"Only support iOS8 Later"];
        text.yy_font = [UIFont systemFontOfSize:30];
        
    } else {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"这是用汉语写的一段文字。"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        
        YYTextRubyAnnotation *ruby;
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"hàn yŭ";
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"汉语"]];
        
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"wén";
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"文"]];
        
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"zì";
        ruby.alignment = kCTRubyAlignmentCenter;
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"字"]];
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
        

        
        one = [[NSMutableAttributedString alloc] initWithString:@"日本語で書いた作文です。"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"に";
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"日"]];
        
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"ほん";
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"本"]];
        
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"ご";
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"語"]];
        
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"か";
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"書"]];
        
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"さく";
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"作"]];
        
        ruby = [YYTextRubyAnnotation new];
        ruby.textBefore = @"ぶん";
        [one yy_setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"文"]];
        
        [text appendAttributedString:one];
    }
    
    
    YYLabel *label = [YYLabel new];
    label.attributedText = text;
    label.width = self.view.width - 60;
    label.centerX = self.view.width / 2;
    label.height = self.view.height - (kiOS7Later ? 64 : 44) - 60;
    label.top = iOSNavigationHeight() + 30;
    label.textAlignment = NSTextAlignmentCenter;
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    [self.view addSubview:label];
    
}


- (NSAttributedString *)padding {
    NSMutableAttributedString *pad = [[NSMutableAttributedString alloc] initWithString:@"\n\n"];
    pad.yy_font = [UIFont systemFontOfSize:30];
    return pad;
}

@end

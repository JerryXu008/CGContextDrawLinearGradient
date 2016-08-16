//
//  TestView.m
//  CPlusTest
//
//  Created by song on 15/3/9.
//  Copyright (c) 2015年 song. All rights reserved.
//

#import "TestView.h"
@interface MyLayerDelegate : NSObject

@end
@implementation MyLayerDelegate

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx {
    
    UIGraphicsPushContext(ctx);
    
    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
    
    UIGraphicsPopContext();
    
} 

@end

CGImageRef flip(CGImageRef im){
    CGSize sz=CGSizeMake(CGImageGetWidth(im), CGImageGetHeight(im));
    UIGraphicsBeginImageContextWithOptions(sz, NO, 0);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, sz.width, sz.height), im);
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    
    UIGraphicsEndImageContext();
    
    return result;
}
void drawStripes (void *info, CGContextRef con) {
    
    // assume 4 x 4 cell
    
    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
    
    CGContextFillRect(con, CGRectMake(0,0,4,4));
    
    CGContextSetFillColorWithColor(con, [[UIColor blueColor] CGColor]);
    
    CGContextFillRect(con, CGRectMake(0,0,4,2));
    
}

@interface TestView(){
MyLayerDelegate* _layerDeleagete;

}

@end


@implementation TestView

-(void)awakeFromNib{
    
  //绘制背景渐变
    CGColorSpaceRef rgb= CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        151.0 / 255.0, 160.0 / 255.0, 0.0 / 255.0, 1.00,
        68.0 / 255.0, 198.0 / 255.0, 16 / 255.0, 1.00,
        
    };
  
    int f=sizeof(colors);
    int ff=sizeof(colors[0]);
    
    
    /*
     
     CGCradientCreateWithColorComponents函数需要四个参数：
     
     色彩空间：（Color Space）这是一个色彩范围的容器，类型必须是CGColorSpaceRef.对于这个参数，我们可以传入CGColorSpaceCreateDeviceRGB函数的返回值，它将给我们一个RGB色彩空间。
     
     颜色分量的数组：这个数组必须包含CGFloat类型的红、绿、蓝和alpha值。数组中元素的数量和接下来两个参数密切。从本质来讲，你必须让这个数组包含足够的值，用来指定第四个参数中位置的数量。所以如果你需要两个位置位置（起点和终点），那么你必须为数组提供两种颜色
     
     位置数组，颜色数组中各个颜色的位置：此参数控制该渐变从一种颜色过渡到另一种颜色的速度有多快。
     
     位置的数量：这个参数指明了我们需要多少颜色和位置。
     
     */

    
    CGGradientRef myGradient=CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    
    
      CGContextRef bitmapContext = CGBitmapContextCreate(NULL, 320, 480, 8, 4 * 320, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaNoneSkipFirst);
    
    /*
     
     创建好线性渐变后，我们将使用CGContextDrawLinearGradient过程在图形上下文中绘制，此过程需要五个参数：
     
     Graphics context 指定用于绘制线性渐变的图形上下文。
     
     Axial gradient 我们使用CGGradientCreateWithColorComponents函数创建的线性渐变对象的句柄
     
     start point 图形上下文中的一个CGPoint类型的点，表示渐变的起点。
     
     End Point表示渐变的终点。
     
     Gradient drawing options 当你的起点或者终点不在图形上下文的边缘内时，指定该如何处理。你可以使用你的开始或结束颜色来填充渐变以外的空间。此参数为以下值之一：KCGGradientDrawsAfterEndLocation扩展整个渐变到渐变的终点之后的所有点 KCGGradientDrawsBeforeStartLocation扩展整个渐变到渐变的起点之前的所有点。0不扩展该渐变。
     
     */

    CGContextDrawLinearGradient(bitmapContext, myGradient, CGPointMake(160.0f, 0.0f),CGPointMake(160.0f, 480),  kCGGradientDrawsBeforeStartLocation);
    
    CGImageRef cgImage = CGBitmapContextCreateImage(bitmapContext);
    
    // Create a UIImage from CGImage
    
    UIImage *uiImage = [UIImage imageWithCGImage:cgImage];
    
    // Release the CGImage
    
    CGImageRelease(cgImage);
    
    // Release the bitmap context
    
    CGContextRelease(bitmapContext);
    
    [self  setBackgroundColor:[UIColor colorWithPatternImage:uiImage]];
    
//    
//    UIImage *mars=[UIImage imageNamed:@"Mars.png"];
//    CGImageRef marsCG = [mars CGImage];
//    CGSize sz=[mars size];
//    
//    
//    CGSize szCG = CGSizeMake(CGImageGetWidth(marsCG), CGImageGetHeight(marsCG));
//   
//    CGImageRef marsLeft = CGImageCreateWithImageInRect([mars CGImage],CGRectMake(0,0,szCG.width/2.0,szCG.height));
//    
//    CGImageRef marsRight = CGImageCreateWithImageInRect([mars CGImage],CGRectMake(szCG.width/2.0,0,szCG.width/2.0,szCG.height));
//    
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*1.5, sz.height), NO, 0);
//    
//  
//    
//    
//    
//    
//    CGContextRef con = UIGraphicsGetCurrentContext();
//    
//    CGContextDrawImage(con, CGRectMake(0,0,sz.width/2.0,sz.height), flip(marsLeft));
//    
//    CGContextDrawImage(con, CGRectMake(sz.width,0,sz.width/2.0,sz.height),flip(marsRight));
//    
//    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    // 记得释放内存，ARC在这里无效
//    
//    CGImageRelease(marsLeft);
//    
//    CGImageRelease(marsRight);
//    
//    
//    
//    
//    UIImageView *iv=[[UIImageView alloc] initWithImage:im];
//    [self addSubview:iv];
//    iv.center=self.center;
    
    
}



//-(void)layoutSubviews{
//
//  
//    
//    CALayer *myLayer = [CALayer layer];
//    
//    _layerDeleagete = [[MyLayerDelegate alloc] init];
//    
//    myLayer.delegate = _layerDeleagete;
//    
//    [self.layer addSublayer:myLayer];
//    
//    [self setNeedsDisplay]; // 调用此方法，drawLayer: inContext:方法才会被调用。
//
//}





- (void) drawRect: (CGRect) rect {
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40,100), NO, 0.0);
//    
//    CGContextRef con = UIGraphicsGetCurrentContext();
//    
//    CGContextSaveGState(con);
//    
//    CGContextMoveToPoint(con, 90 - 80, 100);
//    
//    CGContextAddLineToPoint(con, 100 - 80, 90);
//    
//    CGContextAddLineToPoint(con, 110 - 80, 100);
//    
//    CGContextMoveToPoint(con, 110 - 80, 100);
//    
//    CGContextAddLineToPoint(con, 100 - 80, 90);
//    
//    CGContextAddLineToPoint(con, 90 - 80, 100);
//    
//    CGContextClosePath(con);
//    
//    CGContextAddRect(con, CGContextGetClipBoundingBox(con));
//    
//    CGContextEOClip(con);
//    
//    CGContextMoveToPoint(con, 100 - 80, 100);
//    
//    CGContextAddLineToPoint(con, 100 - 80, 19);
//    
//    CGContextSetLineWidth(con, 1);
//    
//    CGContextReplacePathWithStrokedPath(con);
//    
//    CGContextClip(con);
//    
//    CGFloat locs[3] = { 0.0, 0.5, 1.0 };
//    
//    CGFloat colors[12] = {
//        
//        0.3,0.3,0.3,0.8,
//        
//        0.0,0.0,0.0,1.0,
//        
//        0.3,0.3,0.3,0.8
//        
//    };
//    
//    CGColorSpaceRef sp = CGColorSpaceCreateDeviceGray();
//    
//    CGGradientRef grad = CGGradientCreateWithColorComponents (sp, colors, locs, 3);
//    
//    CGContextDrawLinearGradient (con, grad, CGPointMake(89 - 80,0), CGPointMake(111 - 80,0), 0);
//    
//    CGColorSpaceRelease(sp);
//    
//    CGGradientRelease(grad);
//    
//    CGContextRestoreGState(con);
//    
//   
//    
////    
////    CGColorSpaceRef sp2 = CGColorSpaceCreatePattern(NULL);
////    
////    CGContextSetFillColorSpace (con, sp2);
////    
////    CGColorSpaceRelease (sp2);
////    
////    CGPatternCallbacks callback = {0, &drawStripes, NULL };
////    
////    CGAffineTransform tr = CGAffineTransformIdentity;
////    
////    CGPatternRef patt = CGPatternCreate(NULL,CGRectMake(0,0,4,4),tr,4,4,kCGPatternTilingConstantSpacingMinimalDistortion,true, &callback);
////    
////    CGFloat alph = 1.0;
////    
////    CGContextSetFillPattern(con, patt, &alph);
////    
////    CGPatternRelease(patt);
//    
//   
//    
//    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
//    
//    CGContextMoveToPoint(con, 80 - 80, 25);
//    
//    CGContextAddLineToPoint(con, 100 - 80, 0);
//    
//    CGContextAddLineToPoint(con, 120 - 80, 25);
//    
//    CGContextFillPath(con);
//    
//  
//    
//    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext(); 
//    
//    
//    
//    
//    
//    
//    con = UIGraphicsGetCurrentContext();
//    
//    [im drawAtPoint:CGPointMake(0,0)]; 
//    
//    for (int i=0; i<1; i++) {
//        CGContextRotateCTM(con, 30 * M_PI/180.0);
//        CGContextTranslateCTM(con, 20, 100);
//        
//       
////        
//       CGContextTranslateCTM(con, -20, -100);
//        
//        [im drawAtPoint:CGPointMake(0,0)]; 
//        
//    }
    
    
    
    
    
    
    
    
//    CGContextRef con = UIGraphicsGetCurrentContext();
//    
//    // 绘制一个黑色的垂直黑色线，作为箭头的杆子
//    
//    CGContextMoveToPoint(con, 100, 100);
//    
//    CGContextAddLineToPoint(con, 100, 19);
//    
//    CGContextSetLineWidth(con, 20);
//    
//    CGContextStrokePath(con);
//    
//    // 绘制一个红色三角形箭头
//    
//    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
//    
//    CGContextMoveToPoint(con, 80, 25);
//    
//    CGContextAddLineToPoint(con, 100, 0);
//    
//    CGContextAddLineToPoint(con, 120, 25);
//    
//    CGContextFillPath(con);
//    
//    // 从箭头杆子上裁掉一个三角形，使用清除混合模式
//    
//    CGContextMoveToPoint(con, 90, 101);
//    
//    CGContextAddLineToPoint(con, 100, 90);
//    
//    CGContextAddLineToPoint(con, 110, 101);
//    
//    CGContextSetBlendMode(con, kCGBlendModeClear); 
//    
//    CGContextFillPath(con);

    
    
    
//    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
//    
//    [[UIColor blueColor] setFill];
//    
//    [p fill]; 
//    CGContextRef con=UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(con, CGRectMake(0, 0, 100, 100));
//    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
//    CGContextFillPath(con);
}
@end

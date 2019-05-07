//
//  UIColor+SCColorConvert.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIColor+SCColorConvert.h"

@implementation UIColor (SCColorConvert)

/**
 *  比较颜色value值, 若在0-1之间返回value，若大于1返回1, 小于0返回0
 */
#define SC_CLAMP_COLOR_VALUE(v) (v) = (v) < 0 ? 0 : (v) > 1 ? 1 : (v)

#pragma mark - Convert
void SCRGB2HSL(CGFloat red, CGFloat green, CGFloat blue,
               CGFloat *hue, CGFloat *saturation, CGFloat *lightness) {
    /* RGB -> HSL算法
     1.把RGB值转成[0,1]中数值;
     2.找出R,G和B中的最大值<maxColor>和最小值<minColor>;
     3.计算亮度:L=(maxColor + minColor)/2
     4.如果最大和最小的颜色值相同, 即表示灰色, 那么S定义为0, 而H未定义并在程序中通常写成0
     5.否则，根据明度L计算饱和度S:
     If L<0.5, S=(maxColor-minColor)/(maxColor+minColor)
     If L>=0.5, S=(maxColor-mincolor)/(2.0-maxColor-minColor)
     6.计算色相H[0°, 360°]/[0,1]:
     If R=maxColor, H=(G-B)/(maxColor-minColor)
     If G=maxColor, H=2.0+(B-R)/(maxColor-minColor)
     If B=maxColor, H=4.0+(R-G)/(maxColor-minColor)
     H=H*60°(H=H/6),如果H为负值，则加360°(1)
     
     说明:
     1.由步骤3的式子可以看出亮度仅与图像的最多颜色成分和最少的颜色成分的总量有关。亮度越低, 图像越趋于黑色。亮度越高图像越趋于明亮的白色
     2.由步骤5的式子可以看出饱和度与图像的最多颜色成分和最少的颜色成分的差量有关。饱和度越小, 图像越趋于灰度图像。饱和度越大, 图像越鲜艳, 给人的感觉是彩色的, 而不是黑白灰的图像。
     3.由第6步的计算看，H分成0～6区域(360°/0°红<Red>、60°黄(Yellow)、120°绿<Green>、180°青<Cyan>、240°蓝<Blue>、300°品红<Magenta>)。RGB颜色空间是一个立方体而HSL颜色空间是两个六角形锥体，其中的L是RGB立方体的主对角线。因此, RGB立方体的顶点:红、黄、绿、青、蓝和品红就成为HSL六角形的顶点，而数值0~6就告诉我们H在哪个部分
     */
    SC_CLAMP_COLOR_VALUE(red); // [0,1]
    SC_CLAMP_COLOR_VALUE(green);
    SC_CLAMP_COLOR_VALUE(blue);
    
    CGFloat max, min, delta, sum;
    max = fmaxf(red, fmaxf(green, blue)); // fmaxf -> 返回两个float参数最大值
    min = fminf(red, fminf(green, blue)); // fminf -> 返回两个float参数最小值
    delta = max - min; //  差值[0,1]
    sum = max + min; // [0,2]
    
    *lightness = sum / 2;           // Lightness -> 亮度[0,1] HLS -> L
    if (delta == 0) { // No Saturation, so Hue is undefined (achromatic) 无饱和度, 色相未定义(单色)
        *hue = *saturation = 0;
        return;
    }
    *saturation = delta / (sum < 1 ? sum : 2 - sum); // Saturation (sum < 1 ? sum : 2 - sum) -> [0,1]
    if (red == max) *hue = (green - blue) / delta / 6; // color between m & y 颜色在品与黄色红间[300°,60°]
    else if (green == max) *hue = (2 + (blue - red) / delta) / 6; // color between y & c 颜色在黄色与青色间[60°,180°]
    else *hue = (4 + (red - green) / delta) / 6; // color between c & m 颜色在青色与品红间[180°,300°]
    if (*hue < 0) *hue += 1;
}

void SCHSL2RGB(CGFloat hue, CGFloat saturation, CGFloat lightness,
               CGFloat *red, CGFloat *green, CGFloat *blue) {
    /* HSL -> RGB算法
     1.If S=0, 表示灰, 定义R,G和B都为L
     2.否则, 测试L:
     If L<=0.5, temp2=L*(1.0+S)
     If L>0.5, temp2=L+S-L*S
     3.temp1=2.0*L-temp2
     4.把H转换到[0,1]
     5.对于R,G,B, 计算另外的临时值temp3, 方法如下:
     for R, temp3=H+1.0/3.0
     for G, temp3=H
     for B, temp3=H-1.0/3.0
     If temp3<0, temp3=temp3+1.0
     If temp3>1, temp3=temp3-1.0
     6.对于R,G,B做如下测试:
     If 6.0*temp3<1, color=temp1+(temp2-temp1)*6.0*temp3
     Else If 2.0*temp3<1,color=temp2
     Else If 3.0*temp3<2
     color=temp1+(temp2-temp1)*((2.0/3.0)-temp3)*6.0
     Else color=temp1
     */
    SC_CLAMP_COLOR_VALUE(hue); // [0,1]
    SC_CLAMP_COLOR_VALUE(saturation);
    SC_CLAMP_COLOR_VALUE(lightness);
    
    if (saturation == 0) { // No Saturation, Hue is undefined (achromatic) 无饱和度, 色相未定义(单色)
        *red = *green = *blue = lightness;
        return;
    }
    
    CGFloat q;
    q = (lightness <= 0.5) ? (lightness * (1 + saturation)) : (lightness + saturation - (lightness * saturation));
    if (q <= 0) {
        *red = *green = *blue = 0.0;
    } else {
        *red = *green = *blue = 0;
        int sextant;
        CGFloat m, sv, fract, vsf, mid1, mid2;
        m = lightness + lightness - q;
        sv = (q - m) / q;
        if (hue == 1) hue = 0;
        hue *= 6.0;
        sextant = hue;
        fract = hue - sextant;
        vsf = q * sv * fract;
        mid1 = m + vsf;
        mid2 = q - vsf;
        switch (sextant)
        {
            case 0: *red = q; *green = mid1; *blue = m; break;
            case 1: *red = mid2; *green = q; *blue = m; break;
            case 2: *red = m; *green = q; *blue = mid1; break;
            case 3: *red = m; *green = mid2; *blue = q; break;
            case 4: *red = mid1; *green = m; *blue = q; break;
            case 5: *red = q; *green = m; *blue = mid2; break;
        }
    }
}

void SCRGB2HSB(CGFloat red, CGFloat green, CGFloat blue,
               CGFloat *hue, CGFloat *saturation, CGFloat *value) {
    SC_CLAMP_COLOR_VALUE(red);
    SC_CLAMP_COLOR_VALUE(green);
    SC_CLAMP_COLOR_VALUE(blue);
    
    CGFloat max, min, delta;
    max = fmax(red, fmax(green, blue));
    min = fmin(red, fmin(green, blue));
    delta = max - min;
    
    *value = max;               // Brightness
    if (delta == 0) { // No Saturation, so Hue is undefined (achromatic)
        *hue = *saturation = 0;
        return;
    }
    *saturation = delta / max;       // Saturation
    
    if (red == max) *hue = (green - blue) / delta / 6;             // color between y & m
    else if (green == max) *hue = (2 + (blue - red) / delta) / 6;  // color between c & y
    else *hue = (4 + (red - green) / delta) / 6;                // color between m & c
    if (*hue < 0) *hue += 1;
}

void SCHSB2RGB(CGFloat hue, CGFloat saturation, CGFloat value,
               CGFloat *red, CGFloat *green, CGFloat *blue) {
    SC_CLAMP_COLOR_VALUE(hue);
    SC_CLAMP_COLOR_VALUE(saturation);
    SC_CLAMP_COLOR_VALUE(value);
    
    if (saturation == 0) {
        *red = *green = *blue = value; // No Saturation, so Hue is undefined (Achromatic)
    } else {
        int sextant;
        CGFloat f, p, q, t;
        if (hue == 1) hue = 0;
        hue *= 6;
        sextant = floor(hue);
        f = hue - sextant;
        p = value * (1 - saturation);
        q = value * (1 - saturation * f);
        t = value * (1 - saturation * (1 - f));
        switch (sextant)
        {
            case 0: *red = value; *green = t; *blue = p; break;
            case 1: *red = q; *green = value; *blue = p; break;
            case 2: *red = p; *green = value; *blue = t; break;
            case 3: *red = p; *green = q; *blue = value; break;
            case 4: *red = t; *green = p; *blue = value; break;
            case 5: *red = value; *green = p; *blue = q; break;
        }
    }
}

void SCRGB2CMYK(CGFloat red, CGFloat green, CGFloat blue,
                CGFloat *cyan, CGFloat *magenta, CGFloat *yellow, CGFloat *key) {
    SC_CLAMP_COLOR_VALUE(red);
    SC_CLAMP_COLOR_VALUE(green);
    SC_CLAMP_COLOR_VALUE(blue);
    
    *cyan = 1 - red;
    *magenta = 1 - green;
    *yellow = 1 - blue;
    *key = fmin(*cyan, fmin(*magenta, *yellow));
    
    if (*key == 1) {
        *cyan = *magenta = *yellow = 0;   // Pure black
    } else {
        *cyan = (*cyan - *key) / (1 - *key);
        *magenta = (*magenta - *key) / (1 - *key);
        *yellow = (*yellow - *key) / (1 - *key);
    }
}

void SCCMYK2RGB(CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat key,
                CGFloat *red, CGFloat *green, CGFloat *blue) {
    SC_CLAMP_COLOR_VALUE(cyan);
    SC_CLAMP_COLOR_VALUE(magenta);
    SC_CLAMP_COLOR_VALUE(yellow);
    SC_CLAMP_COLOR_VALUE(key);
    
    *red = (1 - cyan) * (1 - key);
    *green = (1 - magenta) * (1 - key);
    *blue = (1 - yellow) * (1 - key);
}

void SCRGB2CMY(CGFloat red, CGFloat green, CGFloat blue,
               CGFloat *cyan, CGFloat *magenta, CGFloat *yellow) {
    SC_CLAMP_COLOR_VALUE(red);
    SC_CLAMP_COLOR_VALUE(green);
    SC_CLAMP_COLOR_VALUE(blue);
    
    *cyan = 1 - red;
    *magenta = 1 - green;
    *yellow = 1 - blue;
}

void SCCMY2RGB(CGFloat cyan, CGFloat magenta, CGFloat yellow,
               CGFloat *red, CGFloat *green, CGFloat *blue) {
    SC_CLAMP_COLOR_VALUE(cyan);
    SC_CLAMP_COLOR_VALUE(magenta);
    SC_CLAMP_COLOR_VALUE(yellow);
    
    *red = 1 - cyan;
    *green = 1 - magenta;
    *blue = 1 - yellow;
}

void SCCMY2CMYK(CGFloat cyan, CGFloat magenta, CGFloat yellow,
                CGFloat *cCyan, CGFloat *mMagenta, CGFloat *yYellow, CGFloat *kKey) {
    SC_CLAMP_COLOR_VALUE(cyan);
    SC_CLAMP_COLOR_VALUE(magenta);
    SC_CLAMP_COLOR_VALUE(yellow);
    
    *kKey = fmin(cyan, fmin(magenta, yellow));
    if (*kKey == 1) {
        *cCyan = *mMagenta = *yYellow = 0;   // Pure black
    } else {
        *cCyan = (cyan - *kKey) / (1 - *kKey);
        *mMagenta = (magenta - *kKey) / (1 - *kKey);
        *yYellow = (yellow - *kKey) / (1 - *kKey);
    }
}

void SCCMYK2CMY(CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat key,
                CGFloat *cCyan, CGFloat *mMagenta, CGFloat *yYellow) {
    SC_CLAMP_COLOR_VALUE(cyan);
    SC_CLAMP_COLOR_VALUE(magenta);
    SC_CLAMP_COLOR_VALUE(yellow);
    SC_CLAMP_COLOR_VALUE(key);
    
    *cCyan = cyan * (1 - key) + key;
    *mMagenta = magenta * (1 - key) + key;
    *yYellow = yellow * (1 - key) + key;
}

void SCHSB2HSL(CGFloat hue, CGFloat saturation, CGFloat brightness,
               CGFloat *hHue, CGFloat *sSaturation, CGFloat *lLightness) {
    SC_CLAMP_COLOR_VALUE(hue);
    SC_CLAMP_COLOR_VALUE(saturation);
    SC_CLAMP_COLOR_VALUE(brightness);
    
    *hHue = hue;
    *lLightness = (2 - saturation) * brightness / 2;
    if (*lLightness <= 0.5) {
        *sSaturation = (saturation) / ((2 - saturation));
    } else {
        *sSaturation = (saturation * brightness) / (2 - (2 - saturation) * brightness);
    }
}

void SCHSL2HSB(CGFloat hue, CGFloat saturation, CGFloat lightness,
               CGFloat *hHue, CGFloat *sSaturation, CGFloat *bBrightness) {
    SC_CLAMP_COLOR_VALUE(hue);
    SC_CLAMP_COLOR_VALUE(saturation);
    SC_CLAMP_COLOR_VALUE(lightness);
    
    *hHue = hue;
    if (lightness <= 0.5) {
        *bBrightness = (saturation + 1) * lightness;
        *sSaturation = (2 * saturation) / (saturation + 1);
    } else {
        *bBrightness = lightness + saturation * (1 - lightness);
        *sSaturation = (2 * saturation * (1 - lightness)) / *bBrightness;
    }
}

@end

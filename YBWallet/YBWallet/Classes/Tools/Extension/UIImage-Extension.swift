//
//  UIImage-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/6.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit
import Accelerate

extension UIImage{
    
    ///返回不渲染图片
    class func yb_originalImage(_ imageName:String) -> UIImage? {
        guard let result = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal) else{return nil}
        return result
    }
    
    /// 创建头像图像
    ///
    /// - parameter size:      尺寸
    /// - parameter backColor: 背景颜色
    ///
    /// - returns: 裁切后的图像
    func yb_avatarImage(size: CGSize?, backColor: UIColor = UIColor.white, lineColor: UIColor = UIColor.lightGray) -> UIImage? {
        
        var size = size
        if size == nil {
            size = self.size
        }
        let rect = CGRect(origin: CGPoint(), size: size!)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        backColor.setFill()
        UIRectFill(rect)
        
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        
        draw(in: rect)
        
        let ovalPath = UIBezierPath(ovalIn: rect)
        ovalPath.lineWidth = 2
        lineColor.setStroke()
        ovalPath.stroke()
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
    }
    
    /// 生成指定大小的不透明图象
    ///
    /// - parameter size:      尺寸
    /// - parameter backColor: 背景颜色
    ///
    /// - returns: 图像
    func yb_image(size: CGSize? = nil, backColor: UIColor = UIColor.white) -> UIImage? {
        
        var size = size
        if size == nil {
            size = self.size
        }
        let rect = CGRect(origin: CGPoint(), size: size!)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        backColor.setFill()
        UIRectFill(rect)
        
        draw(in: rect)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
    }
    
    //毛玻璃效果
    class func yb_blurry(_ image : UIImage,level: CGFloat) -> UIImage {
        // 处理模糊程度, 防止超出
        var levelValue: CGFloat = level
        if level < 0 {
            levelValue = 0.1
        } else if level > 1.0 {
            levelValue = 1.0
        }
        
        // boxSize 必须大于 0
        var boxSize = Int(levelValue * 100)
        boxSize -= (boxSize % 2) + 1
        
        let _cgImage = image.cgImage
        
        // 图像缓存: 输入缓存、输出缓存
        var inBuffer = vImage_Buffer()
        var outBuffer = vImage_Buffer()
        var error = vImage_Error()
        
        
        let inProvider = _cgImage?.dataProvider
        let inBitmapData = inProvider?.data
        
        inBuffer.width = vImagePixelCount((_cgImage?.width)!)
        inBuffer.height = vImagePixelCount((_cgImage?.height)!)
        inBuffer.rowBytes = (_cgImage?.bytesPerRow)!
        inBuffer.data = UnsafeMutableRawPointer(mutating: CFDataGetBytePtr(inBitmapData!))
        
        // 像素缓存
        let pixelBuffer = malloc((_cgImage?.bytesPerRow)! * (_cgImage?.height)!)
        outBuffer.data = pixelBuffer
        outBuffer.width = vImagePixelCount((_cgImage?.width)!)
        outBuffer.height = vImagePixelCount((_cgImage?.height)!)
        outBuffer.rowBytes = (_cgImage?.bytesPerRow)!
        
        // 中间缓存区, 抗锯齿
        let pixelBuffer2 = malloc((_cgImage?.bytesPerRow)! * (_cgImage?.height)!)
        var outBuffer2 = vImage_Buffer()
        outBuffer2.data = pixelBuffer2
        outBuffer2.width = vImagePixelCount((_cgImage?.width)!)
        outBuffer2.height = vImagePixelCount((_cgImage?.height)!)
        outBuffer2.rowBytes = (_cgImage?.bytesPerRow)!
        
        
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, nil, 0, 0, UInt32(boxSize), UInt32(boxSize), nil, vImage_Flags(kvImageEdgeExtend))
        error = vImageBoxConvolve_ARGB8888(&outBuffer2, &outBuffer, nil, 0, 0, UInt32(boxSize), UInt32(boxSize), nil, vImage_Flags(kvImageEdgeExtend))
        
        if error != kvImageNoError {
            debugPrint(error)
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let ctx = CGContext(data: outBuffer.data, width: Int(outBuffer.width), height: Int(outBuffer.height), bitsPerComponent: 8, bytesPerRow: outBuffer.rowBytes, space: colorSpace, bitmapInfo: (_cgImage?.bitmapInfo.rawValue)!)
        
        let finalCGImage = ctx!.makeImage()
        let finalImage = UIImage(cgImage: finalCGImage!)
        
        free(pixelBuffer!)
        free(pixelBuffer2!)
        
        return finalImage
    }
}


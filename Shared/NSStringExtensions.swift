//
//  NSStringExtensions.swift
//  Campus WatchKit Extension
//
//  Created by IJke Botman on 17/01/2018.
//  Copyright © 2018 IJke Botman. All rights reserved.
//

import UIKit

extension NSString {
    
    func draw(at point: CGPoint, angle: CGFloat, withAttributes attributes: [NSAttributedStringKey: AnyObject]) {
        
        let textSize: CGSize = self.size(withAttributes: attributes)
        
        // sizeWithAttributes is only effective with single line NSString text
        // use boundingRectWithSize for multi line text
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        let transformation: CGAffineTransform = CGAffineTransform(translationX: point.x, y: point.y)
        let rotation: CGAffineTransform = CGAffineTransform(rotationAngle: angle)
        
        context.concatenate(transformation)
        context.concatenate(rotation)
        
        self.draw(at: CGPoint(x: -1 * textSize.width, y: 0), withAttributes: attributes)
        
        context.concatenate(rotation.inverted())
        context.concatenate(transformation.inverted())
        
    }
    
}

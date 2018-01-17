//
//  WatchGraphGeneratorSettings.swift
//  Campus WatchKit Extension
//
//  Created by IJke Botman on 17/01/2018.
//  Copyright © 2018 IJke Botman. All rights reserved.
//

import WatchKit

struct WatchGraphGeneratorSettings: GraphGeneratorSettings {
    
    // elements
    var drawBackgroundGradient: Bool = false
    var drawUnderGraphGradient: Bool = true
    var drawGridlines: Bool = true
    var drawPoints: Bool = true
    var drawLine: Bool = false
    var drawPointStroke: Bool = true
    
    // colors
    var graphLineColor: UIColor = UIColor.white
    var gridlineMajorColor: UIColor = UIColor.white.withAlphaComponent(0.3)
    var gridlineMinorColor: UIColor = UIColor.white.withAlphaComponent(0.11)
    var demarcationTitleColor: UIColor = UIColor.white.withAlphaComponent(0.4)
    var underGraphGradientColors: [CGColor] = [UIColor(hex: 0xFE007F).cgColor, UIColor(hex: 0x8D8CFF).cgColor]
    var backgroundGradientColors: [CGColor] = [UIColor.black.cgColor]
    var pointGradientColors: [CGColor] = [UIColor.black.cgColor]
    var pointStrokeGradientColors: [CGColor] = [UIColor(hex: 0xFE007F).cgColor, UIColor(hex: 0x8D8CFF).cgColor]
    var highlightedPointGradientColors: [CGColor] = [UIColor(hex: 0x7ED321).cgColor]
    var highlightedPointOutsetColor: UIColor = UIColor.black
    
    // corners
    var backgroundGradientCornerRadius: Int = 8
    
    // line width
    var gridlineWidth: CGFloat = 1
    var graphLineWidth: CGFloat = 2
    var pointSize: CGFloat = 5
    var pointStrokeWidth: CGFloat = 1
    var highlightedPointSize: CGFloat {
        return pointSize * 3
    }
    var highlightedPointStrokeWidth: CGFloat = 1
    var highlightedPointStrokeDashes: [CGFloat] = [0, 1]
    var demarcationTitleFontSize: CGFloat = 17
    var demarcationTitleRotationAngle = -CGFloat.pi / 2
    
    // insets
    var gridlineHorizontalInsets: CGFloat {
        return pointSize / CGFloat.pi
    }
    var graphHorizontalInsets: CGFloat {
        return pointSize / CGFloat.pi
    }
    var topInset: CGFloat {
        return pointSize / 2
    }
    var bottomInset:CGFloat {
        return pointSize / 2
    }
    var highlightedPointStrokeOutset: CGFloat = 4
    
}

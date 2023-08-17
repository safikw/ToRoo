//
//  Font.swift
//  ToRoo
//
//  Created by Adry Mirza on 10/06/23.
//

import Foundation
import SwiftUI

extension Font {
    
    static func sfRoundedBlack(fontSize: Double) -> Font {
        Font.custom("SF-Pro-Rounded-Black", size: fontSize)
    }
    
    static func sfRoundedBold(fontSize: Double) -> Font {
        Font.custom("SF-Pro-Rounded-Bold", size: fontSize)
    }
    
    static func sfRoundedHeavy(fontSize: Double) -> Font {
        Font.custom("SF-Pro-Rounded-Heavy", size: fontSize)
    }
    
    static func sfRoundedLight(fontSize: Double) -> Font {
        Font.custom("SF-Pro-Rounded-Light", size: fontSize)
    }
    
    static func sfRoundedMedium(fontSize: Double) -> Font {
        Font.custom("SF-Pro-Rounded-Medium", size: fontSize)
    }
    
    static func sfRoundedRegular(fontSize: Double) -> Font {
        Font.custom("SF-Pro-Rounded-Regular", size: fontSize)
    }
    
    static func sfRoundedSemiBold(fontSize: Double) -> Font {
        Font.custom("SF-Pro-Rounded-Semibold", size: fontSize)
    }
}

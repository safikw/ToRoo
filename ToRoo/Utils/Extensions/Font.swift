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
        Font.custom("SFProRounded-Black", size: fontSize)
    }
    
    static func sfRoundedBold(fontSize: Double) -> Font {
        Font.custom("SFProRounded-Bold", size: fontSize)
    }
    
    static func sfRoundedHeavy(fontSize: Double) -> Font {
        Font.custom("SFProRounded-Heavy", size: fontSize)
    }
    
    static func sfRoundedLight(fontSize: Double) -> Font {
        Font.custom("SFProRounded-Light", size: fontSize)
    }
    
    static func sfRoundedMedium(fontSize: Double) -> Font {
        Font.custom("SFProRounded-Medium", size: fontSize)
    }
    
    static func sfRoundedRegular(fontSize: Double) -> Font {
        Font.custom("SFProRounded-Regular", size: fontSize)
    }
    
    static func sfRoundedSemiBold(fontSize: Double) -> Font {
        Font.custom("SFProRounded-Semibold", size: fontSize)
    }
}

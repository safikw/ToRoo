//
//  PopUpViewComponent.swift
//  SleepWithToRoo
//
//  Created by Safik Widiantoro on 18/08/23.
//

import SwiftUI

struct PopUpViewComponent: View {
    var sleepDurationText: String
    var torooImage: String
    
    var body: some View {
        Rectangle()
            .frame(width: 329.31, height: 58)
            .cornerRadius(12)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Spacer()
                    Text(sleepDurationText)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Image(torooImage)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
            )

    }
}

struct PopUpViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        PopUpViewComponent(sleepDurationText: "7 Hours Sleep", torooImage: "4")
    }
}

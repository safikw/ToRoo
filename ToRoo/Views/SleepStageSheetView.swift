//
//  SleepStageSheetView.swift
//  ToRoo
//
//  Created by Adry Mirza on 12/06/23.
//

import SwiftUI

struct SleepStageSheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Text("Sleep Stages")
                    .font(.sfRoundedMedium(fontSize: 18))
                    .padding(.leading, 24)
                Spacer()

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close")
                        .padding()
                        .cornerRadius(10)
                }
                .padding(.trailing)
            }.padding(.top, 8)

            Divider()

            ScrollView{
                VStack{
                    Text("While we sleep, our brains and bodies restore themselves. Each sleep stage plays a different role, but they're all essential to waking up refreshed.")
                    
                    VStack(alignment: .leading){
                        HStack{
                            Circle()
                                .fill(.orange)
                                .frame(width: 18)
                            Text("Awake")
                                .font(.sfRoundedBold(fontSize: 22))
                        }
                        Text("It takes time to fall asleep and we wake up periodically throughout the night. This time is represented as Awake in your charts.")
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            Circle()
                                .fill(.cyan)
                                .frame(width: 18)
                            Text("REM")
                                .font(.sfRoundedBold(fontSize: 22))
                        }
                        Text("Studies show that REM sleep may play a key role in memory and refreshing your brain. It's where most of your dreaming happens. Your eyes will also move side to side. REM sleep first occurs about 90 minutes after falling asleep.")
                    }
                    
                    
                    VStack(alignment: .leading){
                        HStack{
                            Circle()
                                .fill(.blue)
                                .frame(width: 18)
                            Text("Core")
                                .font(.sfRoundedBold(fontSize: 22))
                        }
                        Text("This stage, where muscle activity lowers and body temperature drops, represents the bulk of your time asleep. While it's sometimes referred to as light sleep, it's just as critical as any other sleep stage.")
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            Circle()
                                .fill(.purple)
                                .frame(width: 18)
                            Text("Deep")
                                .font(.sfRoundedBold(fontSize: 22))
                        }
                        Text("It happens in longer periods during the first half of the night. It's often difficult to wake up from deep sleep because you're so relaxed.")
                    }
                    
                }.padding()
            }
            Spacer()
        }
    }
}

struct SleepStageSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SleepStageSheetView()
    }
}

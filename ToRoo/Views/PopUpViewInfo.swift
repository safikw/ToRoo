import SwiftUI
import Combine

struct PopUpViewInfo: View {
    @Binding var isPanelVisible : Bool
    
    var body: some View {
        ZStack{
            
            Button( action: {
                isPanelVisible.toggle()
            }) {Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea(.all)
                .opacity(0.5)}
            VStack{
                Text ("ToRoo's Represent")
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    .foregroundColor(Color(hex: "452680"))
                
                PopUpViewComponent(sleepDurationText: "7 Hours Sleep", torooImage: "7")
                PopUpViewComponent(sleepDurationText: "6 Hours Sleep", torooImage: "6")
                PopUpViewComponent(sleepDurationText: "5 Hours Sleep", torooImage: "5")
                PopUpViewComponent(sleepDurationText: "4 Hours Sleep", torooImage: "4")
                PopUpViewComponent(sleepDurationText: "3 Hours Sleep", torooImage: "3")
                PopUpViewComponent(sleepDurationText: "2 Hours Sleep", torooImage: "2")
                PopUpViewComponent(sleepDurationText: "1 Hours Sleep", torooImage: "1")
                
            }.background() {
                Rectangle()
                    .frame(width: 390 , height: 574)
                    .cornerRadius(30)
                    .foregroundColor(Color(hex: "ECEAEF"))
                    .opacity(1)
                
                
            }
        }
        
        
    }
}

struct PopUpViewInfo_Previews: PreviewProvider {
    static var previews: some View {
        PopUpViewInfo(isPanelVisible: .constant(false))
    }
}

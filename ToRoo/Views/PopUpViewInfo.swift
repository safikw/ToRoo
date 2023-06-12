import SwiftUI
import Combine

struct PopUpViewInfo: View {
    @Binding var isPanelVisible : Bool
    //@State private var isPanelVisible = false
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
                Rectangle()
                    .frame(width: 329.31, height: 58)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        HStack {
                            Spacer()
                            Text("7 Hours Sleep")
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image("7").resizable().scaledToFit()
                            Spacer()
                        }
                    )
                Rectangle()
                    .frame(width: 329.31, height: 58)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        HStack {
                            Spacer()
                            Text("6 Hours Sleep")
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image("6").resizable().scaledToFit()
                            Spacer()
                        }
                    )
                Rectangle()
                    .frame(width: 329.31, height: 58)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        HStack {
                            Spacer()
                            Text("5 Hours Sleep")
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image("5").resizable().scaledToFit()
                            Spacer()
                        }
                    )
                Rectangle()
                    .frame(width: 329.31, height: 58)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        HStack {
                            Spacer()
                            Text("4 Hours Sleep")
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image("4").resizable().scaledToFit()
                            Spacer()
                        }
                    )
                Rectangle()
                    .frame(width: 329.31, height: 58)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        HStack {
                            Spacer()
                            Text("3 Hours Sleep")
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image("3").resizable().scaledToFit()
                            Spacer()
                        }
                    )
                Rectangle()
                    .frame(width: 329.31, height: 58)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        HStack {
                            Spacer()
                            Text("2 Hours Sleep")
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image("2").resizable().scaledToFit()
                            Spacer()
                        }
                    )
                Rectangle()
                    .frame(width: 329.31, height: 58)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        HStack {
                            Spacer()
                            Text("1 Hours Sleep")
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image("1").resizable().scaledToFit()
                            Spacer()
                        }
                    )
                
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

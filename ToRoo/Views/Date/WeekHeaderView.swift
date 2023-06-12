//
//  WeekHeaderView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 06/06/23.
//

import SwiftUI

struct WeekHeaderView: View {
    @EnvironmentObject var weekStore: WeekStore
    @State var showDatePicker: Bool = false
    
    var body: some View {
        VStack{
            ZStack {
                DatePicker("label", selection: $weekStore.selectedDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                SwiftUIWrapper{
                    HStack {
                        Text(weekStore.selectedDate.monthToString())
                            .font(.sfRoundedHeavy(fontSize: 32))
                        Text(weekStore.selectedDate.toString(format: "yyyy"))
                            .font(.sfRoundedSemiBold(fontSize: 32))
                        Image(systemName: "chevron.down")
                    }
                }
                .allowsHitTesting(false)
            }
            Button{
                withAnimation {
                    weekStore.selectToday()
                }
            } label: {
                Text("Today")
                    .font(.sfRoundedSemiBold(fontSize: 14))
                    .foregroundColor(.primary)
                    .padding(4)
                    .background(.secondary)
                    .cornerRadius(4)
            }
            
            
            
        }.padding(.bottom, -15)
        
    }
    
    
    
    
}


struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
    let content: () -> T
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: content())
    }
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
}


//struct WeekHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeekHeaderView()
//    }
//}

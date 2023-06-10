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
            HStack {
                Text(weekStore.selectedDate.monthToString())
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(weekStore.selectedDate.toString(format: "yyyy"))
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                Spacer()
                
                Button {
                    withAnimation {
                        weekStore.selectToday()
                    }
                } label: {
                    Text("Today")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(4)
                        .background(.secondary)
                        .cornerRadius(4)
                }
                ZStack {

                    DatePicker("label", selection: $weekStore.selectedDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                                    .labelsHidden()
                                    .frame(width: 24, height: 35)
                    SwiftUIWrapper{
                                        Image(systemName: "calendar")
                                            .font(.system(size: 24))
                                            .foregroundColor(.primary)
                                    }
                    
                                    .allowsHitTesting(false)

            }
        }
            .padding(.bottom, -15)
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

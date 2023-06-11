//
//  SleepSummary.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 03/06/23.
//

import SwiftUI
import HealthKit


struct SleepSummaryView: View {
    
    @ObservedObject var healthStore: SleepStore
    @ObservedObject var weekStore: WeekStore
    
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack(alignment: .leading){
                InfiniteWeekView()
                    .environmentObject(weekStore)
                
                VStack{
                    TimeBarChartView(healthStore: healthStore, weekStore: weekStore, selectedDay: weekStore.selectedDate, sleepData: healthStore.sleepData)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                
                OneDimensionalBarChartView(healthStore: healthStore, weekStore: weekStore, data: [], selectedDay: weekStore.selectedDate)
                SleepEfficiency(healthStore: healthStore, weekStore: weekStore)
                WeeklyReportView(healthStore: healthStore)
            }.padding([.leading,.trailing], 10)
            //request access healthStore
            .onAppear() {
                healthStore.requestAuthorization()
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(hex: "#f5f5f5"))

        
    }
    
    
}

extension View {
    @ViewBuilder
    func iOSPopover<Content: View>(isPresented: Binding<Bool>, arrowDirection: UIPopoverArrowDirection, @ViewBuilder content: @escaping ()->Content)-> some View{
        self
            .background{
                PopOverController(isPresented: isPresented, arrowDirection: arrowDirection, content: content())
            }
    }
}

//popover helper
struct PopOverController<Content: View>:UIViewControllerRepresentable{
    @Binding var isPresented: Bool
    var arrowDirection: UIPopoverArrowDirection
    var content: Content
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            //presenting popover
            let controller = CustomHostingView(rootView: content)
            controller.view.backgroundColor = .clear
            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.permittedArrowDirections = arrowDirection
            
            //connecting delegate
            controller.presentationController?.delegate = context.coordinator
            
            controller.popoverPresentationController?.sourceView = uiViewController.view
            uiViewController.present(controller, animated: true)
        }
    }
    
    //forcing it to show popover using PresentationDelegate
    class Coordinator: NSObject, UIPopoverPresentationControllerDelegate{
        var parent: PopOverController
        init(parent: PopOverController) {
            self.parent = parent
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
        
        //observing status of popover
        //when it's dismiss updating the presentation style
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            parent.isPresented = false
        }
    }
}

//custom hosting controller for wraping to it's swiftUI view size

class CustomHostingView<Content: View>: UIHostingController<Content>{
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = sizeThatFits(in: UIView.layoutFittingExpandedSize)
        preferredContentSize = size
    }
}




//struct SleepSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepSummaryView(healthStore: SleepStore(), weekStore: WeekStore())
//    }
//}

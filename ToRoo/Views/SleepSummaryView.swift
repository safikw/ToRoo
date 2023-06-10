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
    
    @State var showingPopover = false
    
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading){
                InfiniteWeekView()
                    .environmentObject(weekStore)
                //                List(healthStore.sleepData) { sleep in
                //                    VStack(alignment: .leading) {
                //                        Text("Start: \(healthStore.formatDate(sleep.startDate))")
                //                        Text("End: \(healthStore.formatDate(sleep.endDate))")
                //                        Text("Duration: \(healthStore.formatDuration(sleep.duration))")
                //                        Text("Sleep Stages:\(sleep.sleepStages)")
                //
                //                    }
                //                }.frame(height: 100)
                VStack{
                    TimeBarChartView(healthStore: healthStore, weekStore: weekStore)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                OneDimensionalBarChartView(healthStore: healthStore, weekStore: weekStore, data: [])
                
                VStack(alignment: .leading){
                    Text("Sleep Eficiency: ")
                        .font(.system(size: 16))
                    HStack(alignment: .top){
                        Text("85%")
                            .font(.system(size: 32))
                            .foregroundColor(Color("PrimaryColor"))
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        Button() {
                            showingPopover.toggle()
                        }label: {
                            Image(systemName: "info.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16)
                        }
                        .iOSPopover(isPresented: $showingPopover, arrowDirection: .up){
                            ScrollViewReader { value in
                                ScrollView{
                                    Text("""
                        The amount of time you spend actually sleeping while in bed is known as sleep  efficiency. This measurement should ideally be 85 percent or more for optimal health benefits\n(National Sleep Foundation, thensf.org).
                        """)
                                    .padding()
                                }.frame(height: 155)
                            }
                        }
                    }
                }
                
                WeeklyReportView()
                
            }.padding()
            //request access healthStore
                .onAppear() {
                    healthStore.requestAuthorization()
                }
        }.navigationBarBackButtonHidden(true)
        
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
//        SleepSummaryView()
//    }
//}

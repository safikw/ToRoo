//
//  ContentView.swift
//  TOROO
//
//  Created by Febrina Yusuf on 02/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var nextPage1 = false
    @State private var currentTab = 0
    @EnvironmentObject var healthStore: SleepManager 
    
    //TODO: ONBOARDING VIEW ONCE TIME
    let onComplete: () -> Void
    //    var notify = NotificationHandler()
    
    var body: some View {
        
        TabView(selection: $currentTab,content: {
            ZStack {
                Color(hex: "0xffC89FD2").edgesIgnoringSafeArea(.all)
                
                Circle()
                    .frame(width: 600)
                    .foregroundColor(Color.black.opacity(0.12))
                    .blur(radius: 1)
                    .position(CGPoint(x: 100, y: 0))
                
                Circle()
                    .frame(width: 300)
                    .foregroundColor(Color.white.opacity(0.3))
                    .position(CGPoint(x: 450, y: -60))
                
                Circle()
                    .frame(width: 300)
                    .foregroundColor(Color.white.opacity(0.1))
                    .blur(radius: 1)
                    .offset(x: 200, y: 400)
                
                VStack(alignment: .leading) {
                    Text("Meet ToRoo!")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 45))
                        .padding(.horizontal, 80)
                    
                    Text("In the bustling realm of Freelancia, where creativity and flexibility collide, a magical creature named ToRoo was born. ToRoo, an adorable and spirited being, understands the unique challenges that freelancers face.")
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 80)
                }
                .padding(.bottom, 480)
                
                Image("ToRoo")
                    .resizable()
                    .frame(width: 470, height: 460)
                    .offset(x: 50, y: 100)
                
                Text("Skip").onTapGesture {
                    onComplete()
                }.offset(x: 170, y: -410)
                    .foregroundColor(.blue)
            }.tag(0)
            
            ZStack {
                Color(hex: "0xffC89FD2").edgesIgnoringSafeArea(.all)
                
                
                Circle()
                    .frame(width: 250)
                    .foregroundColor(Color.white.opacity(0.8))
                    .blur(radius: 1)
                    .offset(x: 10, y:-100)
                
                Circle()
                    .frame(width: 380)
                    .foregroundColor(Color(hex:"0xffFFC529"))
                    .blur(radius: 1)
                    .offset(x: 200, y: -200)
                
                Circle()
                    .frame(width: 260)
                    .foregroundColor(Color.black.opacity(0.1))
                    .blur(radius: 1)
                    .offset(x:-100, y:-120)
                
                
                VStack (alignment: .leading) {
                    Text("ToRoo ToRoo!")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 45))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 70)
                        .padding(2)
                    
                    Text("ToRoo's mission is simple: to accompany you on your sleep routine and ensure you get the rest you need. ")
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 50)
                        .padding(.horizontal, 30)
                        .padding(.trailing, 50)
                    
                }
                .padding(.top, 250)
                
                Image("ToRoo2")
                    .resizable()
                    .frame(width: 490, height: 480)
                    .offset(x:10, y:-240)
                
                //                Image(systemName: "arrow.right.circle.fill")
                //                    .resizable()
                //                    .frame(width: 60, height: 60)
                //                    .foregroundColor(.white)
                //                    .padding(.top, 600)
                
            }.tag(1)
                .navigationBarBackButtonHidden(true)
            
            ZStack{
                Color(hex: "0xffC89FD2")
                    .ignoresSafeArea()
                Circle()
                    .fill(Color("ColorPurpleDarker"))
                    .frame(width: 400,height: 1000)
                    .position(CGPoint(x: 100, y: 130))
                Circle()
                    .fill(Color("ColorYellow"))
                    .frame(width: 400.0,height: 300)
                    .position(CGPoint(x: 400, y: -10))
                    .opacity(0.8)
                Circle()
                    .fill(Color("ColorLightPurple"))
                    .frame(width: 400,height: 300)
                    .position(CGPoint(x: 400, y: 400))
                Image("TorooOnboarding")
                    .position(CGPoint(x: 200, y: 410))
                VStack{
                    Text("ToRooooo!")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .offset(x: -65, y: -250)
                    Text("""
    With ToRoo by your side, you'll harness
    the energy of a thousand well-rested
    Freelancians.
    All hail the reign of Freelancians!
    """)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .offset(x: -10, y: -250)
                }
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .frame(width: 60,height: 60)
                    .offset(x: 4, y: 300)
                    .foregroundColor(.white)
                    .onTapGesture {
                        onComplete()
                        healthStore.requestAuthorization()
                        
                        //                        notify.requestNotif()
                    }
            }.tag(2)
            
            
        }).ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle())
    }
    
    @available(iOS 16.0, *)
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView(onComplete: {})
        }
    }
}

//
//  UserNotif.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 12/06/23.
//

import Foundation
import UserNotifications

class NotificationHandler{
    func requestNotif() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){
            success, error in
            if success {
                print("All Set")
            }else if let error = error{
                print(error.localizedDescription)
            }
                
        }
    }


    func schedulerNotif(date: Date, type: String, timeInterval: Double , title: String, body: String){
        var trigger: UNNotificationTrigger?
        
        if type == "date" {
            let dateComponents = Calendar.current.dateComponents([.day, .month, .hour], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            }else if type == "time"{
                trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
            }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
    //    print(content)
    //    print(type)
    //    print(request)
        print(title)
        
        }
        
        


}

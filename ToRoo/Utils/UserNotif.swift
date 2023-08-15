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


    func schedulerNotif(type: String, timeInterval: Double = 10, title: String, body: String, notifHour: Int = 9){
        var trigger: UNNotificationTrigger?
        
            if type == "date" {
                var dateComponents = DateComponents()
                dateComponents.hour = notifHour
                dateComponents.minute = 0
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
        
        }
        
        


}

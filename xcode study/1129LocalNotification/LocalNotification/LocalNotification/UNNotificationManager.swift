//
//  UNNotificationManager.swift
//  LocalNotification
//
//  Created by Maru on 29/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import UserNotifications

final class UNNotificationManager: NSObject {
    
    struct Identifier {
        static let basicCategory = "BasicCategory"
        static let anotherCategory = "AnotherCategory"
        
        static let timeIntervalRequest = "TimeIntervalRequest"
        static let calendarRequest = "CanlendarRequest"
        
        static let repeatAction = "RepeatAction"
        static let removeAction = "RemoveAction"
        static let textInputAction = "TextInputAction"
    }
    
    
    
    func register() {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        center.delegate = self
        center.requestAuthorization(options: options) { (isGranted, error) in
            guard isGranted else {
                print(error?.localizedDescription ?? "")
                return self.alertNotificationIsNotGranted()
            }
            self.setupNotificationCategories()
            
            // 원격에서 허용 사용 할 때
            //  UIApplication.shared.registerForRemoteNotifications()
        }
        
    }
    
    func alertNotificationIsNotGranted() {
        guard let settingUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        DispatchQueue.main.async {
            UIApplication.shared.open(settingUrl)
        }
    }
    
    func getNotificationSettings(with completionHandler: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { completionHandler($0.authorizationStatus == .authorized)
            
        }
    }
    
    
    func setupNotificationCategories() {
        let basicCategory = UNNotificationCategory(identifier: Identifier.basicCategory, actions: [], intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([basicCategory])
        
        let repeatAction = UNNotificationAction(identifier: Identifier.repeatAction, title: "Repeat", options: [])
        
        let removeAction = UNNotificationAction(identifier: Identifier.removeAction, title: "Remove", options: [.destructive])
        
        let textInputAction = UNTextInputNotificationAction(
            identifier: Identifier.textInputAction,
            title: "Change Title",
            options: [.authenticationRequired],
            textInputButtonTitle: "Save",
            textInputPlaceholder: "Repeat with Input Message")
        
        let anotherCategory = UNNotificationCategory(identifier: Identifier.anotherCategory, actions: [repeatAction, removeAction, textInputAction], intentIdentifiers: [], options: [.customDismissAction])
        
        UNUserNotificationCenter.current().setNotificationCategories([basicCategory,anotherCategory])
    }
    
    func triggerTimeIntervalNotification(withTitle title: String = " Reminder") {
        // TimeIntervalNotification 시간마다 반복적으로
        // CalendarNotification 특정 날짜에
        // LocationNotification 특정 장소에서
        
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = Identifier.basicCategory
        content.title = NSString.localizedUserNotificationString(forKey: title, arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Alarm fired", arguments: nil)
        content.badge = 1
        
        // 사운드 미설정 시 소리 X
        //        content.sound = UNNotif0-=icationSound.default
        let soundName = UNNotificationSoundName(rawValue: "sweetalertsound4.wav")
        content.sound = UNNotificationSound(named: soundName)
        
        
        // Audio (5 MB), Image(10 MB), Movie(50 MB)
        if let imageURL = Bundle.main.url(forResource: "movieImage", withExtension: "jpg") {
            let attachment = try! UNNotificationAttachment(identifier: "MovieImage", url: imageURL)
            content.attachments = [attachment]
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false) // true로 할 때는 타임을 60초 이상으로 설정해야 가능
        let request = UNNotificationRequest(identifier: Identifier.timeIntervalRequest, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func triggerCalendarNotification(withTitle title: String = "Reminder") {
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = Identifier.anotherCategory
        content.title = NSString.localizedUserNotificationString(forKey: title, arguments: nil)
        content.subtitle = "Subtitle"
        content.body = "Body"
        content.sound = UNNotificationSound.default
        content.userInfo = ["Name": "Giftbot"]
        
        if let soundURL = Bundle.main.url(forResource: "pup-alert", withExtension: "mp3") {
            let soundAttachment = try! UNNotificationAttachment(identifier: "SoundAttachment", url: soundURL)
            content.attachments = [soundAttachment]
        }
        
        let calendar = Calendar.current
        let date = Date(timeIntervalSinceNow: 5)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.hour = calendar.component(.hour, from: date)
        dateComponents.minute = calendar.component(.minute, from: date)
        dateComponents.second = calendar.component(.second, from: date)
        
        
        // 직접 숫자 지정도 가능
        // dateComponents.minute = 0
        // dateComponents.second = 5
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: Identifier.calendarRequest, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func removeNotificationRequest(withIdentifier indentifire: String){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [indentifire])
    }
    
}

extension UNNotificationManager: UNUserNotificationCenterDelegate {
    
    /****************************************
     Foreground 아닌 상태에서 Noti 받았을 때
     ****************************************/
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("\n------------ [ didReceive ] -------------\n")
        let content = response.notification.request.content
        let userInfo = content.userInfo
        let categoryID = content.categoryIdentifier
        
        print(content)
        print(userInfo["Name"] as? String ?? "")
        print(categoryID)
        
        if categoryID == Identifier.anotherCategory {
            switch response.actionIdentifier {
            case UNNotificationDismissActionIdentifier:
                print("Dismiss Notification")
            case UNNotificationDefaultActionIdentifier:
                print("Tap Notification")
            case Identifier.repeatAction:
                print("Repeat Action")
                triggerCalendarNotification()
            case Identifier.removeAction:
                print("Remove Action")
            // Remove Some Data
            case Identifier.textInputAction:
                print("TextInputAction")
                if let inputResponse = response as? UNTextInputNotificationResponse {
                    triggerTimeIntervalNotification(withTitle: inputResponse.userText)
                }
            default:
                print("Unknown action")
            }
        } else {
            // Code
        }
        completionHandler()
    }
    
    /****************************************
     Foreground 상태에서 Noti 받았을 때
     ****************************************/
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("\n------------ [ willPresent ] -------------\n")
        print("notification :", notification)
        completionHandler([.alert, .sound])
    }
}

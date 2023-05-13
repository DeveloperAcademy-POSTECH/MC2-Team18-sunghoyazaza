//
//  NotificationManager.swift
//  sunghoyazaza
//
//  Created by Yun Dongbeom on 2023/05/08.
//

import Foundation
import SwiftUI
import UserNotifications



class NotificationManager {
    static let shared = NotificationManager()
    private init() {}
    
    // MARK: 사용자 알림 설정 여부
    @AppStorage(AppStorageKey.hasNotificationPermission.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var hasNotificationPermission: Int = -1
    
    //MARK: 알림 권한요청
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) {(success, error) in
            if let error = error {
                print("ERROR: \(error)")
                self.hasNotificationPermission = 0
            } else {
                print("SUCCESS")
                print(success)
                if success {
                    self.hasNotificationPermission = 1
                } else {
                    self.hasNotificationPermission = 0
                }
            }
        }
    }
    
    // TODO: 노티피케이션 요청방식 논의필요, 현재는 시간을 기준으로 작성
    // MARK: 노티피케이션 생성 및 요청
    func requestNotificationCreate(
        title: String = "Sample Notification Title",
        subtitle: String = "Sample Notification SubTitle",
        timeInterval: Double = 5.0
    ) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
}

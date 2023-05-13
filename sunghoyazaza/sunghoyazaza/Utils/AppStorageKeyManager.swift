//
//  AppStorageKeyManager.swift
//  sunghoyazaza
//
//  Created by Yun Dongbeom on 2023/05/08.
//

import Foundation

public enum AppStorageKey: String {
    case selectionToDiscourage // FamilyActivitySelection
    case sleepStartDateComponent
    case sleepEndDateComponent
    case daysOfWeek
    case isUserNotificationOn
    case additionalCount
    case isUserInit
    case hasNotificationPermission
    case hasScreenTimePermission

}

// MARK: 실기 테스트 시 App Groups 설정 후 동일한 이름으로 수정하세요.
let APP_GROUP_NAME = "group.com.shield.dreamon"

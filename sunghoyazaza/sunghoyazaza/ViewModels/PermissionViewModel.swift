//
//  PermissionViewModel.swift
//
//  Created by Yun Dongbeom on 2023/05/12.
//

import Foundation
import SwiftUI

struct PermissionButtonInfo: Identifiable {
    let id = UUID()
    let headerText: String
    let src: String
    let permissionName: String
    let footerText: String
}

typealias PermissionButtonStatus = (label: String, img: String, color: Color)

class PermissionViewModel: ObservableObject {
    
    @Published
    var notificationButtonInfo = PermissionButtonInfo(
        headerText: "선택권한",
        src: "Notifications",
        permissionName: "알림",
        footerText: """
        자야 할 시간이 되기 5분 전에 알림을 받을 수 있고,
        약속한 15분이 끝나기 5분 전에 알림을 받을 수 있어요
        """
    )
    @Published
    var screenTimeButtonInfo = PermissionButtonInfo(
        headerText: "필수권한",
        src: "ScreenTime",
        permissionName: "스크린 타임",
        footerText: """
        자야 할 시간에 잠에 드는 데 방해가 되는 앱을 선택하고
        자야 할 시간이 됐을 때 사용을 제한할 수 있어요
        """
    )

    @Published
    var notificationButtonStatus: PermissionButtonStatus = (label: "설정하기", img: "checkmark.circle.fill", color: .systemGray2)
    
    @Published
    var screenTimeButtonStatus: PermissionButtonStatus = (label: "설정하기", img: "checkmark.circle.fill", color: .systemGray2)
    
    @Published
    var hasNotificationPermission = false
    
    @Published
    var hasScreenTimePermission = false
}

extension PermissionViewModel {
    func updatePermissionStatus() {
        updateNotificationPermissionStatus()
        updateScreenTimePermissionStatus()
    }
    
    private func updateNotificationPermissionStatus() {
        
        if NotificationManager.shared.hasNotificationPermission == 1 {
            notificationButtonStatus.label = "설정완료"
            notificationButtonStatus.img = "checkmark.circle.fill"
            notificationButtonStatus.color = .systemGreen
            hasNotificationPermission = true
        } else if NotificationManager.shared.hasNotificationPermission == 0 {
            notificationButtonStatus.label = "설정변경"
            notificationButtonStatus.img = "x.circle.fill"
            notificationButtonStatus.color = .systemRed
            hasNotificationPermission = false
        } else {
            notificationButtonStatus.label = "설정하기"
            notificationButtonStatus.img = "checkmark.circle.fill"
            notificationButtonStatus.color = .systemGray2
            hasNotificationPermission = false
        }
    }
    
    private func updateScreenTimePermissionStatus() {
        if ScreenTimeVM.shared.hasScreenTimePermission {
            screenTimeButtonStatus.label = "설정완료"
            screenTimeButtonStatus.img = "checkmark.circle.fill"
            screenTimeButtonStatus.color = .systemGreen
            hasScreenTimePermission = true
        } else {
            screenTimeButtonStatus.label = "설정하기"
            screenTimeButtonStatus.img = "checkmark.circle.fill"
            screenTimeButtonStatus.color = .systemGray2
            hasScreenTimePermission = false
        }
    }
    
    func handlePermissionButton(permissionName: String) {
        if permissionName == "알림" {
            requestNotificationPermission()
        } else {
            requestScreenTimePermission()
        }
    }
    
    // MARK: Notification 권한 요청
    private func requestNotificationPermission() {
        NotificationManager.shared.requestAuthorization()
    }
    
    // MARK: ScreenTime 권한 요청
    private func requestScreenTimePermission() {
        ScreenTimeVM.shared.requestAuthorization()
    }
}

//
//  ScreenTImeVM.swift
//  sunghoyazaza
//
//  Created by Yun Dongbeom on 2023/05/08.
//
import DeviceActivity
import FamilyControls
import Foundation
import ManagedSettings
import SwiftUI

// MARK: ScreenTime과 관련된 데이터를 관리하기 위한 Class
class ScreenTimeVM: ObservableObject {
    static let shared = ScreenTimeVM()

    private init() {}

    @Published
    var testInt = 0

    // MARK: 제한할 앱 정보를 담고 있는 변수
    @AppStorage(AppStorageKey.selectionToDiscourage.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var selectionToDiscourage = FamilyActivitySelection()

    // MARK: 온보딩을 완료한 유저인지 체크하기 위한 변수
    @AppStorage(AppStorageKey.isUserInit.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var isUserInitStatus: Bool = true

    // MARK: 스크린 타임 설정 여부
    @AppStorage(AppStorageKey.hasScreenTimePermission.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var hasScreenTimePermission: Bool = false {
        didSet {
            print("Changed: ", hasScreenTimePermission)
            updateHasScreenTimePermission()
        }
    }

    @Published
    var sharedHasScreenTimePermission = false

    func updateHasScreenTimePermission() {
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                self.sharedHasScreenTimePermission = self.hasScreenTimePermission
            }
        }
    }

    // MARK: 스케쥴 시작 시간을 담기 위한 변수
    @AppStorage(AppStorageKey.sleepStartDateComponent.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var sleepStartDateComponent = DateComponents(hour: 23, minute: 00) //TODO: 테스트용 더미 값
    //var sleepStartDateComponent = DateComponents()
    
    // MARK: 스케쥴 종료 시간을 담기 위한 변수
    @AppStorage(AppStorageKey.sleepEndDateComponent.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var sleepEndDateComponent = DateComponents(hour: 07, minute: 00) //TODO: 테스트용 더미 값
    //var sleepEndDateComponent = DateComponents()
    
    // MARK: 사용자 알림 설정 여부
    @AppStorage(AppStorageKey.isUserNotificationOn.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var isUserNotificationOn: Bool = true

    // MARK: 오늘 수면 계획 동안 15분 연장 횟수
    @AppStorage(AppStorageKey.additionalCount.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var additionalCount: Int = 0

    let managedSettingStore = ManagedSettingsStore()
    let deviceActivityCenter = DeviceActivityCenter()
    let authorizationCenter = AuthorizationCenter.shared

    // MARK: 스크린타임 권한 요청
    func requestAuthorization() {

        if authorizationCenter.authorizationStatus == .approved {
            print("ScreenTime Permission approved")
        } else {
            Task {
                do {
                     try await authorizationCenter.requestAuthorization(for: .individual)
                    hasScreenTimePermission = true
                    // 동의함
                 } catch {
                     //동의 X
                     print("Failed to enroll Aniyah with error: \(error)")
                     hasScreenTimePermission = false
                     // 사용자가 허용안함.
                     // Error Domain=FamilyControls.FamilyControlsError Code=5 "(null)
                 }
            }
        }
    }

    // MARK: onReceive 권한 상태 업데이트
    func updateAuthorizationStatus(authStatus: AuthorizationStatus) {
        switch authStatus {
        case .notDetermined:
            hasScreenTimePermission = false
        case .denied:
            hasScreenTimePermission = false
        case .approved:
            hasScreenTimePermission = true
        @unknown default:
            fatalError("요청한 권한설정 타입에 대한 처리는 없습니다")
        }
    }

    // MARK: 스크린타임 권한 조회
    func requestAuthorizationStatus() -> AuthorizationStatus {
        AuthorizationCenter.shared.authorizationStatus
    }

    // MARK: 선택했던 토큰 정보 초기화
    func handleResetSelection() {
        selectionToDiscourage = FamilyActivitySelection()
    }

    // MARK: 모니터링 스케쥴 등록
    func handleStartDeviceActivityMonitoring(
        startTime: DateComponents,
        endTime: DateComponents,
        deviceActivityName: DeviceActivityName = .dailySleep,
        warningTime: DateComponents = DateComponents(minute: 5) // 5분 전 알림
    ) {
        let schedule: DeviceActivitySchedule

        if deviceActivityName == .dailySleep { // 기본 수면계획 스케줄일 경우
            schedule = DeviceActivitySchedule(
                intervalStart: startTime,
                intervalEnd: endTime,
                repeats: true,
                warningTime: warningTime
            )
            print("Daily Sleep Schedule: \(startTime.hour!):\(startTime.minute!) ~ \(endTime.hour!):\(endTime.minute!)")

        } else { // 추가시간 15분 스케줄일 경우
            let currentDateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: Date()) // 현재시간
            let startHour = currentDateComponents.hour ?? 0
            let startMinute  = currentDateComponents.minute ?? 0
            var endHour = startHour + 0
            var endMinute = startMinute + 15 // 15분
            if endMinute >= 60 {
                endMinute -= 60
                endHour += 1
            }
            if endHour > 23 {
                endHour = 23
                endMinute = 59
            }
            print("Additional time schedule: \(startHour):\(startMinute) ~ \(endHour):\(endMinute)")

            // (추가시간 15분 종료 시점 ~ 수면 종료 시간)의 새로운 스케줄 생성하기
            schedule = DeviceActivitySchedule(
                intervalStart: DateComponents(hour: endHour, minute: endMinute),
                intervalEnd: endTime,
                repeats: false,
                warningTime: DateComponents(minute: 5) // 종료 5분 전에 알림
            )

        }

        do {
            ScreenTimeVM.shared.deviceActivityCenter.stopMonitoring()
            try ScreenTimeVM.shared.deviceActivityCenter.startMonitoring(
                deviceActivityName,
                during: schedule
            )
            if deviceActivityName == .dailySleep {
                print("Daily sleep monitoring started")
            } else if deviceActivityName == .additionalTime {
                print("Additional 15 minutes Monitoring started")
            }
        } catch {
            print("Unexpected error: \(error).")
        }

        //TODO: 이벤트 미사용 - 코드 삭제 논의하기
//        let event = DeviceActivityEvent(
//            applications: selectionToDiscourage.applicationTokens,
//            categories: selectionToDiscourage.categoryTokens,
//            webDomains: selectionToDiscourage.webDomainTokens,
//            threshold: DateComponents(minute: 1) // 테스트 필요 시 수정해서 사용할 것 ex) minute: 15
//        )
        
    }
}

//MARK: FamilyActivitySelection Parser
extension FamilyActivitySelection: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(FamilyActivitySelection.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension DateComponents: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(DateComponents.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

//MARK: Schedule Name List
extension DeviceActivityName {
    static let dailySleep = Self("dailySleep")
    static let additionalTime = Self("additionalTime")
}

//MARK: Schedule Event Name List
//TODO: 이벤트 미사용 - 논의 후 코드 삭제
//extension DeviceActivityEvent.Name {
//    static let `default` = Self("threshold.default")
//}
//MARK: ManagedSettingStore Name List
extension ManagedSettingsStore.Name {
    static let tenSeconds = Self("threshold.seconds.ten")
    static let dailySleep = Self("dailySleep")
    static let additionalFifteen = Self("additionalFifteen")
}

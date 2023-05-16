//
//  ShieldActionExtension.swift
//  ShieldAction
//
//  Created by 김영빈 on 2023/05/15.
//

import DeviceActivity
import Foundation
import ManagedSettings
import SwiftUI

// Override the functions below to customize the shield actions used in various situations.
// The system provides a default response for any functions that your subclass doesn't override.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class ShieldActionExtension: ShieldActionDelegate {
    // MARK: 오늘 수면 계획 동안 15분 연장 횟수
    @AppStorage(AppStorageKey.additionalCount.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var additionalCount: Int = 0
    
    // MARK: 스케줄 종료 지점 판별을 위한 변수
    @AppStorage(AppStorageKey.isEndPoint.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var isEndPoint: Bool = true
    
    let managedSettingsStore = ManagedSettingsStore(named: .default)
    
    //MARK: application으로 선택된 앱에서의 동작
    override func handle(action: ShieldAction, for application: ApplicationToken, completionHandler: @escaping (ShieldActionResponse) -> Void) {
        // Handle the action as needed.
        switch action {
        case .primaryButtonPressed:
            completionHandler(.close)
        case .secondaryButtonPressed:
            //TODO: 오늘의 약속 지키기 실패 시 실패 날짜 리스트에 해당 스케줄 날짜 추가
            //dummyDate.append(DateValue.key)
            isEndPoint = false // 종료 지점을 다음 스케줄로 넘김
            additionalCount += 1 // 연장 횟수 1 카운트
            //MARK: 15분 연장 스케줄 모니터링 시작
            ScreenTimeVM.shared.handleStartDeviceActivityMonitoring(
                startTime: ScreenTimeVM.shared.sleepStartDateComponent, // 어떤 값을 넣어줘도 상관 X
                endTime: ScreenTimeVM.shared.sleepEndDateComponent, // 사용자 설정 종료 시간
                deviceActivityName: .additionalTime
            )
            
            //실패 데이터(yyyymmdd)를 DateModel의 failList에 append
            var current = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: current)
            let minute = calendar.component(.minute, from: current)
            
            let sleepEndDateComponent = ScreenTimeVM.shared.sleepEndDateComponent
            
            if hour < sleepEndDateComponent.hour!{
                current = calendar.date(byAdding: .day, value: -1, to: current)!
            }
            if hour == sleepEndDateComponent.hour! , minute <= sleepEndDateComponent.minute!{
                current = calendar.date(byAdding: .day, value: -1, to: current)!
            }
            let dateString = current.toString()
            if var failList = DateModel.shared.failList.decode, !failList.contains(dateString){
                failList.append(dateString)
                DateModel.shared.failList = (failList.encode)!
                
            }
            
            completionHandler(.none)
        @unknown default:
            fatalError()
        }
    }
    
    // TODO: 미사용 시 제거할지 말지 논의하기
//    override func handle(action: ShieldAction, for webDomain: WebDomainToken, completionHandler: @escaping (ShieldActionResponse) -> Void) {
//        // Handle the action as needed.
//        completionHandler(.close)
//    }
    
    //MARK: category로 선택된 앱에서의 동작
    override func handle(action: ShieldAction, for category: ActivityCategoryToken, completionHandler: @escaping (ShieldActionResponse) -> Void) {
        // Handle the action as needed.
        switch action {
        case .primaryButtonPressed:
            completionHandler(.close)
        case .secondaryButtonPressed:
            //TODO: 오늘의 약속 지키기 실패 시 실패 날짜 리스트에 해당 스케줄 날짜 추가
            //dummyDate.append(DateValue.key)
            isEndPoint = false // 종료 지점을 다음 스케줄로 넘김
            additionalCount += 1 // 연장 횟수 1 카운트
            //MARK: 15분 연장 스케줄 모니터링 시작
            ScreenTimeVM.shared.handleStartDeviceActivityMonitoring(
                startTime: ScreenTimeVM.shared.sleepStartDateComponent, // 어떤 값을 넣어줘도 상관 X
                endTime: ScreenTimeVM.shared.sleepEndDateComponent, // 사용자 설정 종료 시간
                deviceActivityName: .additionalTime
            )
            
            //실패 데이터(yyyymmdd)를 DateModel의 failList에 append
            var current = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: current)
            let minute = calendar.component(.minute, from: current)
            
            let sleepEndDateComponent = ScreenTimeVM.shared.sleepEndDateComponent
            
            if hour < sleepEndDateComponent.hour!{
                current = calendar.date(byAdding: .day, value: -1, to: current)!
            }
            if hour == sleepEndDateComponent.hour! , minute <= sleepEndDateComponent.minute!{
                current = calendar.date(byAdding: .day, value: -1, to: current)!
            }
            let dateString = current.toString()
            if var failList = DateModel.shared.failList.decode, !failList.contains(dateString){
                failList.append(dateString)
                DateModel.shared.failList = (failList.encode)!
                
            }
            
            completionHandler(.none)
        @unknown default:
            fatalError()
        }
    }
}

//TODO: 이벤트 미사용 - 논의 후 코드 삭제
//extension DeviceActivityEvent.Name {
//    static let `default` = Self("threshold.default")
//}

//
//  ShieldConfigurationExtension.swift
//  ShieldConfiguration
//
//  Created by 김영빈 on 2023/05/15.
//

import ManagedSettings
import ManagedSettingsUI
import SwiftUI
import UIKit

// Override the functions below to customize the shields used in various situations.
// The system provides a default appearance for any methods that your subclass doesn't override.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class ShieldConfigurationExtension: ShieldConfigurationDataSource {
    // MARK: 오늘 수면 계획 동안 15분 연장 횟수
    @AppStorage(AppStorageKey.additionalCount.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var additionalCount: Int!
    // MARK: 스케줄 종료 지점 판별을 위한 변수
    @AppStorage(AppStorageKey.isEndPoint.rawValue, store: UserDefaults(suiteName: APP_GROUP_NAME))
    var isEndPoint: Bool!
    
    let imageName = "mustsleep_80.png"
    
    // MARK: 로직에 따른 문구 분기처리
    let screenTimeVM = ScreenTimeVM.shared
    let dateModel = DateModel.shared
    let uiColorValue = UIColor(Color.primary)
    
    var shieldContent: ShieldContent{
        let totalSuccessCount = dateModel.totalSuccessCount
        let recentSuccessCount = dateModel.recentSuccessCount
        let recentFailCount = dateModel.recentFailCount

        if additionalCount == 0{
            if recentSuccessCount == 0{
                if recentFailCount == 0 {
                    return .case1
                }else if recentFailCount == 1{
                    return .case2
                }else{
                    return .case3
                }
            }else if recentSuccessCount == 1{
                if totalSuccessCount == 1{
                    return .case4
                }else{
                    return .case5
                }
            }else{
                return .case6
            }
        }else if additionalCount == 1{
            return .case7
        }else{
            return .case8
        }
    }
    
    override func configuration(shielding application: Application) -> ShieldConfiguration {
        // Customize the shiel d as needed for applications.
        if shieldContent.self == .case8 { //MARK: 2회 이상 휴대폰을 본 뒤에는 더보기 버튼이 없는 쉴드 페이지
            return ShieldConfiguration(
                backgroundBlurStyle: UIBlurEffect.Style.extraLight,
                backgroundColor: UIColor.white.withAlphaComponent(0.1),
                icon: UIImage(named: imageName),
                title: ShieldConfiguration.Label(text: shieldContent.title, color: .black),
                subtitle: ShieldConfiguration.Label(
                    text: "\(String(shieldContent.subTitle.split(separator: "$")[0]))\(String(describing: application.localizedDisplayName!.description))\(String(shieldContent.subTitle.split(separator: "$")[1]))",
                    color: .black
                ),
                primaryButtonLabel: ShieldConfiguration.Label(text: shieldContent.primaryButtonText, color: .white),
                primaryButtonBackgroundColor: uiColorValue,
                secondaryButtonLabel: nil
            )
        } else {
            return ShieldConfiguration(
                backgroundBlurStyle: UIBlurEffect.Style.extraLight,
                backgroundColor: UIColor.white.withAlphaComponent(0.1),
                icon: UIImage(named: imageName),
                title: ShieldConfiguration.Label(text: shieldContent.title, color: .black),
                subtitle: ShieldConfiguration.Label(
                    text: "\(String(shieldContent.subTitle.split(separator: "$")[0]))\(String(describing: application.localizedDisplayName!.description))\(String(shieldContent.subTitle.split(separator: "$")[1]))",
                    color: .black
                ),
                primaryButtonLabel: ShieldConfiguration.Label(text: shieldContent.primaryButtonText, color: .white),
                primaryButtonBackgroundColor: uiColorValue,
                secondaryButtonLabel: ShieldConfiguration.Label(text: shieldContent.secondaryButtonText, color: uiColorValue)
            )
        }
    }
    
    override func configuration(shielding application: Application, in category: ActivityCategory) -> ShieldConfiguration {
        // Customize the shield as needed for applications shielded because of their category.
        if shieldContent.self == .case8 { //MARK: 2회 이상 휴대폰을 본 뒤에는 더보기 버튼이 없는 쉴드 페이지
            return ShieldConfiguration(
                backgroundBlurStyle: UIBlurEffect.Style.extraLight,
                backgroundColor: UIColor.white.withAlphaComponent(0.1),
                icon: UIImage(named: imageName),
                title: ShieldConfiguration.Label(text: shieldContent.title, color: .black),
                subtitle: ShieldConfiguration.Label(
                    text: "\(String(shieldContent.subTitle.split(separator: "$")[0]))\(String(describing: application.localizedDisplayName!.description))\(String(shieldContent.subTitle.split(separator: "$")[1]))",
                    color: .black
                ),
                primaryButtonLabel: ShieldConfiguration.Label(text: shieldContent.primaryButtonText, color: .white),
                primaryButtonBackgroundColor: uiColorValue,
                secondaryButtonLabel: nil
            )
        } else {
            return ShieldConfiguration(
                backgroundBlurStyle: UIBlurEffect.Style.extraLight,
                backgroundColor: UIColor.white.withAlphaComponent(0.1),
                icon: UIImage(named: imageName),
                title: ShieldConfiguration.Label(text: shieldContent.title, color: .black),
                subtitle: ShieldConfiguration.Label(
                    text: "\(String(shieldContent.subTitle.split(separator: "$")[0]))\(String(describing: application.localizedDisplayName!.description))\(String(shieldContent.subTitle.split(separator: "$")[1]))",
                    color: .black
                ),
                primaryButtonLabel: ShieldConfiguration.Label(text: shieldContent.primaryButtonText, color: .white),
                primaryButtonBackgroundColor: uiColorValue,
                secondaryButtonLabel: ShieldConfiguration.Label(text: shieldContent.secondaryButtonText, color: uiColorValue)
            )
        }
    }
}

//
//  ShieldConfigurationExtension.swift
//  ShieldConfiguration
//
//  Created by Yun Dongbeom on 2023/05/08.
//

import ManagedSettings
import ManagedSettingsUI
import UIKit

// Override the functions below to customize the shields used in various situations.
// The system provides a default appearance for any methods that your subclass doesn't override.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class ShieldConfigurationExtension: ShieldConfigurationDataSource {
    
    // TODO: 커스텀 이미지 추가하기
    let imageName = "stopwatch"
    // TODO: 로직에 따른 문구 분기처리 필요
    let title = "😴 잠에 들 시간이에요"
    let subtitle = "\n(N)시간 이상의 숙면은\n내일의 계획을 지키는 데 필수적이에요\n\n내일의 계획을 지키려면\n지금 반드시 잠에 들어야 해요\n\n내일의 계획을 지키기 위해\n이제 그만 앱을 종료해볼까요?"
    let primaryButtonnText = "내일의 계획 지키기"
    let secondaryButtonText = "내일의 계획 안 지키기"
    
    override func configuration(shielding application: Application) -> ShieldConfiguration {
        // Customize the shield as needed for applications.
        return ShieldConfiguration(
            backgroundBlurStyle: UIBlurEffect.Style.systemThickMaterial,
            backgroundColor: UIColor.white,
            icon: UIImage(systemName: imageName),
            title: ShieldConfiguration.Label(text: title, color: .black),
            subtitle: ShieldConfiguration.Label(text: subtitle, color: .black),
            primaryButtonLabel: ShieldConfiguration.Label(text: primaryButtonnText, color: .white),
            secondaryButtonLabel: ShieldConfiguration.Label(text: secondaryButtonText, color: .black)
        )
    }
    
    override func configuration(shielding application: Application, in category: ActivityCategory) -> ShieldConfiguration {
        // Customize the shield as needed for applications shielded because of their category.
        return ShieldConfiguration(
            backgroundBlurStyle: UIBlurEffect.Style.systemThickMaterial,
            backgroundColor: UIColor.white,
            icon: UIImage(systemName: imageName),
            title: ShieldConfiguration.Label(text: title, color: .black),
            subtitle: ShieldConfiguration.Label(text: subtitle, color: .black),
            primaryButtonLabel: ShieldConfiguration.Label(text: primaryButtonnText, color: .white),
            secondaryButtonLabel: ShieldConfiguration.Label(text: secondaryButtonText, color: .black)
        )
    }
    
    // TODO: 미사용 시 제거할지 말지 논의하기
//    override func configuration(shielding webDomain: WebDomain) -> ShieldConfiguration {
//        // Customize the shield as needed for web domains.
//        ShieldConfiguration()
//    }
//    
//    override func configuration(shielding webDomain: WebDomain, in category: ActivityCategory) -> ShieldConfiguration {
//        // Customize the shield as needed for web domains shielded because of their category.
//        ShieldConfiguration()
//    }
}

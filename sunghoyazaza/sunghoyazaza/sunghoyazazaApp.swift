//
//  sunghoyazazaApp.swift
//  sunghoyazaza
//
//  Created by Seokmin on 2023/05/07.
//

import SwiftUI

@main
struct sunghoyazazaApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if !ScreenTimeVM.shared.isUserInitStatus && ScreenTimeVM.shared.authorizationCenter.authorizationStatus == .approved  {
                    MainView()
                }
                else {
                    Onboarding0View()
                }
            }
            .environmentObject(ScreenTimeVM.shared)
            .background(Color.systemGray6, ignoresSafeAreaEdges: .all)
            .onReceive(ScreenTimeVM.shared.authorizationCenter.$authorizationStatus) { authStatus in
                ScreenTimeVM.shared.updateAuthorizationStatus(authStatus: authStatus)
            }
        }
        .onChange(of: scenePhase) { phase in
            NotificationManager.shared.updateHasNotificationPermission()
            NotificationManager.shared.updateAuthStatus()
        }
    }
}

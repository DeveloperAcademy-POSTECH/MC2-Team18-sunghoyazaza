//
//  DetailView.swift
//  sunghoyazaza
//
//  Created by Seokmin on 2023/05/08.
//

import SwiftUI
import FamilyControls

struct DetailView: View {
    @State private var settingIndex = 0
    @State var selection = FamilyActivitySelection()
    @State var startAt = UserDefaults.standard.object(forKey: "startAt") as? Date ?? Calendar.current.date(bySettingHour: 23, minute: 0, second: 0, of: Date())!
    @State var endAt = UserDefaults.standard.object(forKey: "endAt") as? Date ?? Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!
    @State var selectedDays:[Bool] = UserDefaults.standard.array(forKey: "selectedDays") as? [Bool] ?? [Bool](repeating: false, count: 7)
    
    var body: some View {
        VStack(spacing: 24) {
            Picker("설정 선택", selection: $settingIndex, content: {
                Text("시간 설정").tag(0)
                Text("앱 설정").tag(1)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer().frame(height: 0)
            
            if settingIndex == 0 {
                RepeatDaysPicker(selectedDays: $selectedDays)
                
                Spacer().frame(height: 0)
                
                DatePicker(selection: $startAt, displayedComponents: .hourAndMinute, label: { Text("취침시간") })
                
                DatePicker(selection: $endAt, displayedComponents: .hourAndMinute, label: { Text("기상시간") })
            }
            else {
                FamilyActivityPicker(headerText: "사용이 제한되는 앱", selection: $selection)
                    .onChange(of: selection) { newSelection in
                        _ = selection.applications
                        _ = selection.categories
                        _ = selection.webDomains
                    }
            }
            
            Spacer()
        }.padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("수면 계획").font(.headline)
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("저장") {
                        UserDefaults.standard.set(startAt, forKey: "startAt")
                        UserDefaults.standard.set(endAt, forKey: "endAt")
                        UserDefaults.standard.set(selectedDays, forKey: "selectedDays")
                        //TODO: 수면 계획 모니터링 시작 -> 사용자 설정시간으로 넘겨주도록 수정 필요
                        ScreenTimeVM.shared.handleStartDeviceActivityMonitoring(
                            startTime: ScreenTimeVM.shared.sleepStartDateComponent,
                            endTime: ScreenTimeVM.shared.sleepEndDateComponent,
                            deviceActivityName: .dailySleep
                        )
                    }
                }
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

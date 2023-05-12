//
//  OnboardingView.swift
//  sunghoyazaza
//
//  Created by Seokmin on 2023/05/08.
//

import SwiftUI
import FamilyControls

struct OnboardingView: View {
    @State var startAt = UserDefaults.standard.object(forKey: "startAt") as? Date ?? Calendar.current.date(bySettingHour: 23, minute: 0, second: 0, of: Date())!
    @State var endAt = UserDefaults.standard.object(forKey: "endAt") as? Date ?? Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!
    @State var selectedDays:[Bool] = UserDefaults.standard.array(forKey: "selectedDays") as? [Bool] ?? [Bool](repeating: false, count: 7)
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("계획한 수면 시간을 설정해주세요").font(.largeTitle.bold())
                Text("7시간 이상의 숙면은 내일의 집중을 도와줍니다.").foregroundColor(.gray)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            RepeatDaysPicker(selectedDays: $selectedDays)
            
            Spacer().frame(height: 0)
            
            DatePicker(selection: $startAt, displayedComponents: .hourAndMinute, label: { Text("취침시간") })
            
            DatePicker(selection: $endAt, displayedComponents: .hourAndMinute, label: { Text("기상시간") })
            
            Spacer()
            
            NavigationLink(destination: Onboarding2View()) {
                Text("설정 완료").foregroundColor(.white)
            }.simultaneousGesture(TapGesture().onEnded{
                UserDefaults.standard.set(startAt, forKey: "startAt")
                UserDefaults.standard.set(endAt, forKey: "endAt")
                UserDefaults.standard.set(selectedDays, forKey: "selectedDays")
            }).padding()
                .frame(width: 240)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }.padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("수면계획 설정").font(.headline)
                    }
                }
            }
    }
}

struct RepeatDaysPicker: View {
    let daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"]
    @Binding var selectedDays:[Bool]
    
    var body: some View {
        VStack {
            HStack {
                Text("반복일 설정").font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                if selectedDays == [Bool](repeating: true, count: 7) {
                    Button("전체취소") {
                        selectedDays = [Bool](repeating: false, count: 7)
                    }
                }
                else {
                    Button("전체반복") {
                        selectedDays = [Bool](repeating: true, count: 7)
                    }
                }
            }
            HStack {
                ForEach(0 ..< daysOfWeek.count, id: \.self) { index in
                    Button(action: {
                        if selectedDays[index] {
                            selectedDays[index] = false
                        } else {
                            selectedDays[index] = true
                        }
                    }) {
                        Text(daysOfWeek[index])
                            .font(.system(size: 18))
                            .fontWeight(selectedDays[index] ? .bold : .regular)
                            .foregroundColor(selectedDays[index] ? Color.accentColor : .black)
                    }
                    .frame(width: 44, height: 44)
                    .background(selectedDays[index] ? Color.accentColor.opacity(0.1) : Color.white)
                    .cornerRadius(50)
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

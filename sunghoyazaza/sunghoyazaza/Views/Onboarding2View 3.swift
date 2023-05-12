//
//  Onboarding2View.swift
//  sunghoyazaza
//
//  Created by Seokmin on 2023/05/08.
//

import SwiftUI
import FamilyControls

struct Onboarding2View: View {
    
    @State var selection = FamilyActivitySelection()
    @State var isPresented = false
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading, spacing: 8) {
                Text("사용을 제한할 앱을 선택해주세요").font(.largeTitle.bold())
                Text("7시간 이상의 숙면은 내일의 집중을 도와줍니다.").foregroundColor(.gray)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            // TODO::Pick interface
            
            // VERSION 1
            FamilyActivityPicker(headerText: "사용이 제한되는 앱", selection: ScreenTimeVM.shared.$selectionToDiscourage)
                .onChange(of: ScreenTimeVM.shared.selectionToDiscourage) { newSelection in

                }
            
            // VERSION 2
            /*
            Button("FamilyActivityPicker 열기") { isPresented = true }
                .familyActivityPicker(isPresented: $isPresented,
                                      selection: $selection)
                .onChange(of: selection) { newSelection in
                    _ = selection.applications
                    _ = selection.categories
                    _ = selection.webDomains
                }
             */
            
            NavigationLink(destination: {
                MainView()
            }) {
                Text("설정 완료").foregroundColor(.white)
            }.padding()
                .frame(width: 240)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }.padding().navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("수면계획 설정").font(.headline)
                    }
                }
            }
    }
}

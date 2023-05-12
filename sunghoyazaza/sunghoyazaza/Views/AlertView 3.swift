//
//  AlertView.swift
//  sunghoyazaza
//
//  Created by 077tech on 2023/05/06.
//
//MARK: 계획 중단 시 나오는 팝업

import SwiftUI
import UIKit

//MARK: MAIN
struct AlertView: View {
    // 팝업을 위한 State
    @State private var isShowingAlert = false
    
    var body: some View {
        //TODO: 임시 버튼임으로써 피터(정)이 계획 중단 뷰를 구성하면 .alert부터 작성하면 됨
        Button("Show Alert") {
            isShowingAlert = true
        }
        
        //Alert 중 Bold처리 부분
        .alert("계획 중단 시\n앱 사용제한이 해제됩니다.", isPresented: $isShowingAlert) {
            
            //Alert중 계획 유지 버튼
            Button("계획 유지", role: .cancel) {
                print("계획 유지 clicked")
            }
            
            //Alert중 계획 중단 버튼
            Button("계획 중단", role: .destructive) {
                print("계획 중단 clicked")
            }
            
            //Alert중 Regular 버튼
        } message: {
            Text("앱 사용제한이 해제되면\n수면 시간에 영향을 줄 수 있습니다")
        }
    }
}

//MARK: PREVIEW
struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}


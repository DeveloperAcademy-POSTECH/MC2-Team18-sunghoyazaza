//
//  SleepPlanBottomView.swift
//  sunghoyazaza
//
//  Created by 077tech on 2023/05/07.
//
//MARK: 차단된 앱 로고 표시 화면

import SwiftUI

struct SleepPlanBottomView: View {
    var body: some View {
        
        // 차단된 앱 개수 변수
        @State var dataCount = MainVM().blockApplicationCount()
        
        // 전체 Stack
        VStack {
            
            // 가로 나열을 위한 Stack
            HStack {
                
                //7개 이하일 시 보이는 화면 (앱 위에 +N 이 필요없기 때문)
                if dataCount <= 7{
                    ForEach(0..<dataCount) { i in
                        Image(MainModel().blockApplicationData[i])
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    Spacer()
                    
                //7개 이상일 시 보이는 화면 (앱 위에 +N 표시)
                }else{
                    // 앱 로고 표시
                    ForEach(0..<6) { i in
                        Image(MainModel().blockApplicationData[i])
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    
                    // 앱 위에 +N 표시를 위한 ZStack (맨 마지막 앱에만 적용)
                    ZStack{
                        Image(MainModel().blockApplicationData[6])
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                            .opacity(0.3)
                        Text("+\(dataCount-7)")
                            .bold()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(hex: 0xF6F8FF))
        .cornerRadius(24)
    }
}

//MARK: PREVIEW
struct SleepPlanBottomView_Previews: PreviewProvider {
    static var previews: some View {
        SleepPlanBottomView()
    }
}


//
//  PermissionView.swift
//  sunghoyazaza
//
//  Created by JAESEOK LEE on 2023/05/11.
//

import SwiftUI

struct PermissionView: View {
    
    @State private var navigationIsActive: Bool = false
    
    func enableNavigationLink () {
        
    }
    
    var body: some View {
        VStack{
            
            Text("머스트 슬립은\n아래 기능들에 대한 권한 설정이 필요해요\n권한을 설정을 완료하면\n첫 수면 계획을 만들러 갈 수 있어요")
                .font(.system(size: 20, weight: .bold))
                .lineSpacing(8)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
                .padding(.bottom, 24)
                .padding([.horizontal], 16)
            
            VStack {
                
                Text("선택 권한")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color(hex: "AEAEB2"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    print("Notifications Permission Button Clicked")
                } label: {
                    HStack{
                        Image("Notifications_Icon")
                            .padding([.vertical], 10)
                            .padding(.trailing, 8)
                        Text("알림")
                            .foregroundColor(Color(hex: "000000"))
                        Spacer()
                        Text("설정 완료")
                            .padding(.trailing, 10)
                    }
                }
                .buttonStyle(.bordered)
                .tint(Color(hex: "3F3F3F")) // 배경 색이 적용이 안돼서 일단 아무 색깔로 해놓음 (바꿔야 함)
                
                Text("자야 할 시간이 되기 5분 전에 알림을 받을 수 있고,\n약속한 15분이 끝나기 5분 전에 알림을 받을 수 있어요")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color(hex: "8E8E93"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            
            }
            .padding([.horizontal], 16)
            .padding(.bottom, 24)
            
            VStack {
                
                Text("필수 권한")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color(hex: "AEAEB2"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    print("Screen Time Permission Button Clicked")
                } label: {
                    HStack{
                        Image("Screen_Time_Icon")
                            .padding([.vertical], 10)
                            .padding(.trailing, 8)
                        Text("스크린 타임")
                        Spacer()
                        Text("설정 완료")
                            .padding(.trailing, 10)
                    }
                }
                .buttonStyle(.bordered)
                .tint(Color(hex: "3F3F3F")) // 배경 색이 적용이 안돼서 일단 아무 색깔로 해놓음 (바꿔야 함)
                
                Text("자야 할 시간에 잠에 드는 데 방해가 되는 앱을 선택하고\n자야 할 시간이 됐을 때 사용을 제한할 수 있어요")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color(hex: "8E8E93"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding([.horizontal], 16)
            
            Spacer()
            
            NavigationLink("첫 수면 계획 만들러 가기", destination: OnboardingView(), isActive: $navigationIsActive)
                .padding()
                .frame(width: 240)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct PermissionView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionView()
    }
}

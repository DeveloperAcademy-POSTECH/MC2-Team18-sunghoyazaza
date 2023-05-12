//
//  StartPermissionView.swift
//  sunghoyazaza
//
//  Created by 077tech on 2023/05/06.
//
//MARK: 앱 시작 시 나오는 권한설정 화면

import SwiftUI

//MARK: MAIN
struct StartPermissionView: View {
    @EnvironmentObject var screenTimeVM: ScreenTimeVM
    @State var alarmOnOff : Bool = false
    @State var screenTimeAPIOnOff : Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                //TODO: APP이름 정해지면 넣을 것
                Text("\"App Name\"은 \n아래 기능을 사용해요")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .bold()
                    .font(.system(size: 34))
                
                
                Spacer()
                
                // 권한 설정 하기 버튼
                NavigationLink("시작하기", destination: OnboardingView())
                    .padding()
                    .frame(width: 240)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            VStack{
                HStack{
                    if alarmOnOff == false {
                        Text("alarmOff")
                            .padding()
                    }else{
                        Text("alarmOn")
                            .padding()
                    }
                    Button {
                        print("alarm Notification Click")
                    } label: {
                        Text("alarm Notification")
                    }
                }

                HStack{
                    if screenTimeAPIOnOff == false {
                        Text("screenTimeAPIOff")
                            .padding()
                    }else{
                        Text("screenTimeAPIOn")
                            .padding()
                    }
                    Button {
                        print("screenNotificationAPI Notification Click")
                    } label: {
                        Text("screenNotificationAPI Notification")
                    }

                }

                
                
                //                // 중간 Bold 텍스트 (UI 변경시 삭제될 것)
                //                Text("Screen Time \n권한을 허용해주세요.")
                //                    .multilineTextAlignment(.center)
                //                    .bold()
                //                    .font(.system(size: 34))
                //                    .padding(.bottom, 1)
                //
                //                // 중간 Regular 텍스트 (UI 변경시 삭제될 것)
                //                Text("앱을 사용하려면 \nScreen Time 권한이 필요합니다.")
                //                    .multilineTextAlignment(.center)
                //                    .font(.system(size: 17))
            }
        }
        
    }
}

//MARK: PREVIEW
struct StartPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        StartPermissionView()
    }
}

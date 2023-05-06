//
//  StartPermissionView.swift
//  SungHozaza
//
//  Created by 077tech on 2023/05/06.
//
//MARK: 앱 시작 시 나오는 권한설정 화면

import SwiftUI

//MARK: MAIN
struct StartPermissionView: View {
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
                Button {
                    print("권한 설정하기 clicked")
                } label: {
                    Text("권한 설정하기")
                        .padding(.horizontal, 80)
                        .padding(.vertical)
                        .foregroundColor(Color.white)
                        .font(.system(size: 17))
                }
                .background(Color(hex: 0x0F0094))
                .cornerRadius(10)

        }
            VStack{
                // 중간 Bold 텍스트 (UI 변경시 삭제될 것)
                Text("Screen Time \n권한을 허용해주세요.")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.system(size: 34))
                    .padding(.bottom, 1)
                // 중간 Regular 텍스트 (UI 변경시 삭제될 것)
                Text("앱을 사용하려면 \nScreen Time 권한이 필요합니다.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
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

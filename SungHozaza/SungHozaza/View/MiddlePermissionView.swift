//
//  MiddlePermissionView.swift
//  SungHozaza
//
//  Created by 077tech on 2023/05/06.
//
//MARK: 권한 설정 도중 중간에 앱 종료시 나오는 화면

import Foundation
import SwiftUI

//MARK: MAIN
struct MiddlePermissionView: View {
    var body: some View {
        VStack{
            Spacer()
            //위에 Bold 텍스트
            Text("Screen Time \n권한을 허용해주세요.")
                .multilineTextAlignment(.center)
                .bold()
                .font(.system(size: 34))
                .padding(.bottom, 1)
            
            //아래 Regular 텍스트
            Text("앱을 사용하려면 \nScreen Time 권한이 필요합니다.")
                .multilineTextAlignment(.center)
                .font(.system(size: 17))
            Spacer()
            
            //권한 설정하기 버튼
            Button {
                //TODO: 권한 설정을 하기 위한 페이지 띄우기
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
            
            //나가기 버튼
            Button {
                //TODO: 나가기 버튼 클릭 시 Action구현하기
                print("나가기 clicked")
            } label: {
                Text("나가기")
                    .foregroundColor(Color(hex: 0x0F0094))
                    .padding(.horizontal, 105)
                    .padding(.vertical)
                    .foregroundColor(Color.white)
                    .font(.system(size: 17))
            }
            .background(Color(hex: 0xD9E1FF))
            .cornerRadius(10)
        }
    }
}

//MARK: PREVIEW
struct MiddlePermissionView_Previews: PreviewProvider {
    static var previews: some View {
        MiddlePermissionView()
    }
}

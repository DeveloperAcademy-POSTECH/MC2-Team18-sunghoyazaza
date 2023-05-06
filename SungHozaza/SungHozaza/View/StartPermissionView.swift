//
//  StartPermissionView.swift
//  SungHozaza
//
//  Created by 077tech on 2023/05/06.
//

import SwiftUI

struct StartPermissionView: View {
    var body: some View {
        ZStack{
            VStack{
                Text("\"App Name\"은 \n아래 기능을 사용해요")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .bold()
                    .font(.system(size: 34))
                

                Spacer()
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
                Text("Screen Time \n권한을 허용해주세요.")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.system(size: 34))
                    .padding(.bottom, 1)
                Text("앱을 사용하려면 \nScreen Time 권한이 필요합니다.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
            }
        }

    }
}

struct StartPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        StartPermissionView()
    }
}

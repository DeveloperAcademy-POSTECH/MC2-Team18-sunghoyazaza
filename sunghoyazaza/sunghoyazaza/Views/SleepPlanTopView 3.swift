//
//  SleepPlanTopView.swift
//  sunghoyazaza
//
//  Created by 077tech on 2023/05/07.
//


import SwiftUI

struct SleepPlanTopView: View {
    
//MARK: DATABASE
    var weekDay : String
    var sleepTime : String
    var wakeupTime : String
    
//MARK: View
    var body: some View {
        
        //전체 Stack
        HStack(spacing: 0){
            
            //침대 이미지
            Image("sleepPlanImage")
                .resizable()
                .frame(width: 60, height: 60)
            
            // 데이터 받는 Stack (취침+기상+요일)
            VStack{
                
                //요일 Stack (우측으로 밀기 위한 HStack+Spacer)
                HStack{
                    Spacer()
                    Text("\(weekDay)")
                        .font(.system(size: 13))
                }
                .padding(.horizontal)
                
                // 취침 시간 Text + 유저 설정 취침시간
                HStack{
                    Text("취침시간")
                        .font(.system(size: 15))
                    Spacer()
                    Text("\(sleepTime)")
                        .font(.system(size: 28))
                        .foregroundColor((Color(hex: 0x0F0094)))
                        .bold()
                }
                .padding(.horizontal)
                
                // 기상 시간 Text + 유저 설정 취침시간
                HStack{
                    Text("기상시간")
                        .font(.system(size: 15))
                    Spacer()
                    Text("\(wakeupTime)")
                        .font(.system(size: 28))
                        .foregroundColor((Color(hex: 0x0F0094)))
                        .bold()
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .background(Color(hex: 0xF6F8FF))
        .cornerRadius(24)
        
    }
}

//MARK: PREVIEW
struct SleepPlanTopView_Previews: PreviewProvider {
    static var previews: some View {
        SleepPlanTopView(weekDay: MainModel().weekDay, sleepTime: MainModel().sleepTime, wakeupTime: MainModel().wakeupTime)
    }
}


//
//  ContentView.swift
//  sunghoyazaza
//
//  Created by Seokmin on 2023/05/02.
//

//MARK: 앱의 메인 화면
import SwiftUI

struct MainView: View {
    @State var textIndex = MainVM().changeMainText() //
    @State var currentDate : Date = Date()
    let mainModel = MainModel()
    
    var body: some View {
        //        ScrollView{  //꽉찬 뷰 해결방법?
        //전체 뷰 Stack
        ScrollView(){
            VStack(spacing: 0){
                // 메인 Text
                Text("\(mainModel.mainLabel)")
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 34))
                    .padding(.horizontal)
                    .bold()
                // 서브 Text (문구 랜덤 생성)
                Text("\(mainModel.subLabel)")
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundColor(Color(hex: 0x8E8E93))
                
                //캘린더
                CalendarView(currentDate: $currentDate)
                    .padding(.vertical)
                    .cornerRadius(24)
                    .frame(height: 393)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                
                
                HStack{
                    //수면계획 택스트
                    Text("수면 계획")
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    // 편집 버튼
                    NavigationLink(destination: DetailView(), label: {Text("편집").foregroundColor(Color(hex: 0x0F0094))}).padding(.horizontal)
                }
                
                Spacer()
                
                //취침 및 기상시간 알려주는 View
                SleepPlanTopView(weekDay: MainModel().weekDay, sleepTime: MainModel().sleepTime, wakeupTime: MainModel().wakeupTime)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                
                //차단된 앱 알려주는 View
                SleepPlanBottomView()
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
            .padding(.top, 30)
            .background(Color(hex: 0xF0F0F5).edgesIgnoringSafeArea(.all))
            .navigationBarBackButtonHidden(true)
        }.background(Color(hex: 0xF0F0F5).edgesIgnoringSafeArea(.all))
    }
}

//MARK: PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


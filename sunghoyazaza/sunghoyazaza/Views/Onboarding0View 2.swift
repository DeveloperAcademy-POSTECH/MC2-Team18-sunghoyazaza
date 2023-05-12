//
//  Onboarding0View.swift
//  sunghoyazaza
//
//  Created by JAESEOK LEE on 2023/05/11.
//

import SwiftUI

struct Onboarding0View: View {
    var body: some View {
        VStack {
            TabView {
                VStack {
                    Text("머스트 슬립과 함께\n자야 할 시간에 잠에 들고\n내일의 계획을 지켜 보세요")
                        .modifier(TitleText())
                    Spacer()
                    Image("Onboarding_1")
                        .modifier(Illustration())
                }
                VStack {
                    Text("⚙️ 수면 계획 설정")
                        .modifier(TitleText())
                    Text("⏰ 수면 루틴 : 수면 시간과 요일을 선택해요\n⚠️ 제한할 앱 : 방해가 되는 앱을 선택해요")
                        .modifier(BodyText())
                    Spacer()
                    Image("Onboarding_2")
                        .modifier(Illustration())
                }
                VStack {
                    Text("😴 수면 계획 실행")
                        .modifier(TitleText())
                    Text("‘수면 루틴’에 해당하는 시간이 되면\n‘제한할 앱’에 해당하는 앱이 제한돼요")
                        .modifier(BodyText())
                    Spacer()
                    Image("Onboarding_3")
                        .modifier(Illustration())
                }
                VStack {
                    Text("🔥 연속 달성 기록 확인")
                        .modifier(TitleText())
                    Text("몇 회 연속으로 자야 할 시간에 잠에 들었는지,\n현재 달성 중인 기록을 확인할 수 있어요")
                        .modifier(BodyText())
                    Spacer()
                    Image("Onboarding_4")
                        .modifier(Illustration())
                }
                VStack {
                    Text("⏳ 딱 15분만!")
                        .modifier(TitleText())
                    Text("제한된 앱의 사용을 참는게 너무나도 힘들면\n우리, 딱 15분만 사용하기로 약속해요\n단, 현재 달성 중인 기록은 깨지게 돼요")
                        .modifier(BodyText())
                    Spacer()
                    Image("Onboarding_5")
                        .modifier(Illustration())
                }
                VStack {
                    Text("머스트 슬립이\n자야 할 시간에 잠에 들도록 도와드리려면\n몇 가지 기능에 대한 권한 설정이 필요해요\n권한을 설정하고 내일의 계획을 지켜보세요")
                        .modifier(SemiTitleText())
                    Spacer()
                    Image("Onboarding_6")
                        .modifier(Illustration())
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            NavigationLink("권한 설정하러 가기", destination: PermissionView())
                .padding()
                .frame(width: 240)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct Onboarding0View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding0View()
    }
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30, weight: .bold))
            .lineSpacing(8)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(.yellow) // 영역 확인용
//            .border(Color.pink) // 영역 확인용
            .padding([.top], 60)
            .padding([.horizontal], 16)
    }
}

struct SemiTitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .bold))
            .lineSpacing(8)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(.yellow) // 영역 확인용
//            .border(Color.pink) // 영역 확인용
            .padding([.top], 60)
            .padding([.horizontal], 16)
    }
}

struct BodyText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold))
            .lineSpacing(8)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(.blue) // 영역 확인용
//            .border(Color.pink) // 영역 확인용
            .padding([.top], 10)
            .padding([.horizontal], 16)
    }
}

struct Illustration: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
//            .background(.green) // 영역 확인용
//            .border(Color.pink) // 영역 확인용
            .padding([.bottom], 150)
            .padding([.horizontal], 16)
    }
}


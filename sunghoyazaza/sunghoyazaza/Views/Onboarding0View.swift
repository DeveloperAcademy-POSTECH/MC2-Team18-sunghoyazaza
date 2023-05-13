//
//  Onboarding0View.swift
//  sunghoyazaza
//
//  Created by JAESEOK LEE on 2023/05/11.
//

import SwiftUI

struct Onboarding0View: View {
    
    @StateObject
    var vm = Onboarding0VM()
    
    @State
    private var isNavigationActive = false
    
    var body: some View {
        VStack {
            CarouselContainerView()
            GoToPermissionButtonView()
        }
        .background(Color.systemGray6, ignoresSafeAreaEdges: .all)
    }
}

// MARK: Views
extension Onboarding0View {
    // MARK: 캐로셀 컨테이너 뷰
    func CarouselContainerView() -> some View {
        TabView {
            ForEach(vm.carouselItems) {
                carouselItem in
                CarouselItemView(info: carouselItem)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    func CarouselItemView(info: CarouselItemInfo) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8){
                Text(info.labelTitle)
                    .font(info.idx == 0 ? .systemTitle : info.idx == 5 ? .systemTitle3 : .systemTitle)
                    .bold()
                if info.idx > 0 && info.idx < 5 {
                    Text(info.labelBody)
                        .font(.systemTitle3)
                        .kerning(-0.5)
                }
            }
            .padding(.top, .spacing56)
            .padding(.horizontal, .spacing24)
            .frame(minHeight: 240, maxHeight: 240, alignment: .topLeading)
//            .border(.red)
            Image(info.src)
                .resizable()
                .scaledToFit()
//                .border(.red)
        }
//        .border(.red)
    }
    
    // MARK: 시작하기 버튼
    func GoToPermissionButtonView() -> some View {
        VStack {
            Button {
                isNavigationActive = true
            } label: {
                Text("권한 설정하러 가기")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.systemWhite)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding([.horizontal, .bottom], CGFloat.spacing24)
            NavigationLink(destination: PermissionView(), isActive: $isNavigationActive) {
                EmptyView()
            }
        }
    }
}

struct Onboarding0View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding0View()
    }
}


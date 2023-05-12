//
//  LottieVIew.swift
//  sunghoyazaza
//
//  Created by 077tech on 2023/05/12.
//

import SwiftUI
import Lottie
import UIKit

struct LottieView: UIViewRepresentable {
    let lottieFile: String
 
    let animationView = LottieAnimationView()
 
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
 
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
 
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        animationView.loopMode = .playOnce
        animationView.animationSpeed = CGFloat(0.8)
        animationView.play()
        
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
 
        
        
    }
}

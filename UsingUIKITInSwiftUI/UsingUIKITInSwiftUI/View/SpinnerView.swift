//
//  SpinnerView.swift
//  UsingUIKITInSwiftUI
//
//  Created by Michele Manniello on 07/11/21.
//

import SwiftUI
import UIKit

struct Spinner: UIViewRepresentable {
    let isAnimating: Bool
    let style : UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        return spinner
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
//        show the spinner animation
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
     
}

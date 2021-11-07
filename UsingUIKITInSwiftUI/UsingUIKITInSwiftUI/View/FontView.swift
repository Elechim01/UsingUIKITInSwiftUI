//
//  FontView.swift
//  UsingUIKITInSwiftUI
//
//  Created by Michele Manniello on 07/11/21.
//

import SwiftUI
import UIKit

//1.Declare FontPicker that represents UIFontPickerViewController.
struct FontPicker: UIViewControllerRepresentable {
    
//    8.
    @Environment(\.presentationMode) var presentationMode
    
    
//    2.The make method returns the initial view controller.
    
    func makeUIViewController(context: Context) -> UIFontPickerViewController {
//        7.
        let picker = UIFontPickerViewController()
        picker.delegate = context.coordinator
        return picker
    }
// 3.   The update method allows us to keep UIViewController in sync with SwiftUI state updates.
//        In this example, we leave it empty, as our view controller does not depend on the rest of our SwiftUI app for any data.
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
  
  
// 4.    implement the binding
    @Binding var font: UIFontDescriptor?
    
// 5.    Creazione corrdinator...
    class Coordinator: NSObject,UIFontPickerViewControllerDelegate {
        var parent: FontPicker
        
        init(parent: FontPicker) {
            self.parent = parent
        }
        func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
            parent.font = viewController.selectedFontDescriptor
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
//    6
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
}

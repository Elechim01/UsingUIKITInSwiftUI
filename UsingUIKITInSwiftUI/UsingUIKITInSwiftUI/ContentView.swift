//
//  ContentView.swift
//  UsingUIKITInSwiftUI
//
//  Created by Michele Manniello on 07/11/21.
// documentation:
// Se volele usare PickFont() commentare SpinnerToggle()
// Se volete usare SpinnerToggle() commentare Pickfont()

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
       Pickfont()
        
//       oppure
        
//        SpinnerToggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Pickfont: View {
    @State var isPresented = false
    
    @State var font : UIFontDescriptor?
    
    var body: some View{
        Button {
            self.isPresented.toggle()
        } label: {
            Text("Pick font")
        }
        .sheet(isPresented: $isPresented) {
            FontPicker(font: self.$font)
        }
    }
}

struct SpinnerToggle: View{
    @State private var isAnimating = false
    
    var toggle: some View{
        Toggle(isOn: $isAnimating) {
            EmptyView()
        }
        .labelsHidden()
    }
    
    var body: some View {
        
        VStack(spacing: 30) {
            toggle
            Spinner(isAnimating: isAnimating, style: .large)
        }

    }
}

//
//  ContentView.swift
//  Test
//
//  Created by Alejandro Vazquez on 27/12/23.
//

import SwiftUI

struct MyModifiers: ViewModifier{
    var size : CGFloat
    
    init(size: CGFloat){
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: size).weight(.semibold))
            .foregroundColor(Color.blue)
    }
}

struct MyOwnStyle: ViewModifier{
    var size : CGFloat
    var weight : Font.Weight
    var color : Color
    
    init(size: CGFloat, weight: Font.Weight, color: Color) {
        self.size = size
        self.weight = weight
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: size).weight(weight))
            .foregroundColor(color)
    }
}

struct MyImgMod: ViewModifier {
    init () {
    }
    
    func body(content: Content) -> some View {
        content
            .font(Font.system(size:80))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.yellow)
    }
}

struct MyLabelMod : ViewModifier {
    init () {
        
    }
    
    func body(content : Content) -> some View {
        content
            .font(.largeTitle)
            .labelStyle(.titleAndIcon)
            .imageScale(.large)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.yellow)
            .onAppear(perform: {
                print("current: \(self)")
            })
    }
}

struct ContentView: View {
  
    var body: some View {
        HStack(alignment: .center){
            Image(systemName:"bus")
            Image(systemName:"airplane")
            Image(systemName:"phone")
        }.border(Color.red, width: 2)
        .font(.title)
    }
}

#Preview {
    ContentView()
}

		

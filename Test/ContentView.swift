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

extension VerticalAlignment {
    enum BusAlignment: AlignmentID{
        static func defaultValue(in dimension: ViewDimensions) -> CGFloat {
            return dimension[VerticalAlignment.center]
        }
    }
    static let alignBus = VerticalAlignment(BusAlignment.self)
}

struct ContentView: View {
  
    let valid = true
    
    var body: some View {
        
        VStack{
            Group {
                if valid {
                    Image(systemName: "keyboard")
                }
                else {
                    Text("The state is invalid")
                }
            }.foregroundColor(.gray)
            
            Group{
                if valid {
                    Text("Manchester")
                }
                else {
                    Text("Viena")
                }
            }.font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}

		

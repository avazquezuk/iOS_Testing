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

struct MyVStackView : View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            Text("City")
                .modifier(MyOwnStyle(size: 50, weight: Font.Weight.semibold, color: Color.red))
            Text("New York")
            Label("Label",systemImage: "envelope.circle")
                .modifier(MyLabelMod())
            Image(systemName:"sun.min.fill")
                .modifier(MyImgMod())
            Image(systemName: "dot.radiowaves.forward", variableValue: 0.8)
                .font(.largeTitle)
        }
    }
}

struct ContentView: View {
  
    var body: some View {
    
        VStack{
            Spacer()
            HStack{
                Image(systemName: ("cloud"))
                    .modifier(MyImgMod())
                VStack(alignment: .leading){
                    Text("City")
                        .foregroundColor(.gray)
                    Text("New York")
                        .font(.title)
                }
                Spacer()
            }
        }
        .safeAreaInset(edge: .bottom, content: {
            HStack{
                Spacer()
                Text("Important")
                    .padding()
                    .font(Font.system(size: 40).bold())
                    .foregroundColor(.red)
                Spacer()
            }.background(.yellow)
        })
    }
}

#Preview {
    ContentView()
}

		

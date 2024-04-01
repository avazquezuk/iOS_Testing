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

struct ContentView: View {
    @ScaledMetric var customSize: CGFloat = 100
    let myfont = Font.system(size: 100)
    let fontSize : CGFloat = 100
    
    var body: some View {
        
        VStack{
            Text("City")
            Text("New York")
        }
        
        HStack {
            Text("HCity")
            Text("HNew York")
        }
    }
}

#Preview {
    ContentView()
}

		

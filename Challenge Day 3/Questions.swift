//
//  Questions.swift
//  Challenge Day 3
//
//  Created by Tomislav Tomic on 16.11.2020..
//

import SwiftUI

struct Questions: View {
    
    let slikice = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile"]
    
    @State private var animation = 360.0
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), startPoint: .topTrailing, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        
                        Image("bear")
                        Image("buffalo")
                        Image("chick")
                        
                    }
                    
                    Spacer()
                    
                    Text("Practice the multification table, use + or - to select table. After you can test your knowledge. Good luck!")
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        Image("chicken")
                        Image("cow")
                        Image("crocodile")
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }
        
    }
    
}

struct Questions_Previews: PreviewProvider {
    static var previews: some View {
        Questions()
    }
}

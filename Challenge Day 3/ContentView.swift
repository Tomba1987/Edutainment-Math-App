//
//  ContentView.swift
//  Challenge Day 3
//
//  Created by Tomislav Tomic on 16.11.2020..
//

import SwiftUI

struct ContentView: View {
    
    @State private var brojTablice = 1
    
    @State private var broj = Int.random(in: 1 ... 10)
    
    @State private var userInput = ""
    
    @State private var userScore = 0
    
    @State private var alertTitle = ""
    
    @State private var alertMessage = ""
    
    @State private var alertShow = false
    
    @State private var animation = 0.0
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.black, .orange, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                    
                    Section {
                        
                        Text("User score: \(userScore)")
                            .font(.system(size: 30))
                            
                            .padding()
                            .background(Color.green)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.yellow, lineWidth: 5))
                            .padding()
                            
            
                            .rotation3DEffect(
                                .degrees(animation),
                                axis: (x: 0, y: 1, z: 0))
                            
                        
                    }
                    
                    Spacer()
                    
                    Section {
                        
                        Text("Which Multiplication Table do you want to practice?")
                            .multilineTextAlignment(.center)
                        
                        Text("TABLE: \(brojTablice) x ?")
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.white)
                            .clipShape(Rectangle())
                            .cornerRadius(20)
                            .padding()
                        
                    }
                    .font(.system(size: 30))
                    .padding()
                    
                    Section {
                        
                        Stepper("Choose Table", value: $brojTablice, in: 1 ... 10)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                        
                        Text("What is \(brojTablice) * \(broj)")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                        
                    }
                    
                    Section {
                        
                        TextField("Enter your answer", text: $userInput, onCommit: mnozenje)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.numberPad)
                            .opacity(0.5)
                        
                    }
                    
                    Spacer()
                    
                }
                .alert(isPresented: $alertShow) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                .navigationBarTitle(Text("Multiplication Table"))
                .navigationBarItems(leading: NavigationLink(
                                        destination: Questions(),
                                        label: {
                                            Text("Info")
                                        }), trailing: Button("New Game") { newGame() })
                
            }
            
        }
        
    }
    
    func mnozenje() {
        
        let brojTablice = self.brojTablice
        let mile = brojTablice * broj
        
        if Int(userInput) == mile {
            alertTitle = "Well done!"
            alertMessage = "Correct answer!"
            
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 3)) {
                self.animation += 360 }
            
            userScore += 1
        }
        else {
            alertTitle = "Whoops!"
            alertMessage = "That's not right, better check your math son."
            
            
            
            userScore -= 1
        }
        
        
        if userScore < 0 {
            alertTitle = "Better luck next time!"
            alertMessage = "Start a new game!"
            
            newGame()
        }
        
        
        broj = Int.random(in: 1 ... 10)
        
        userInput = ""
        
        alertShow = true
        
    }
    
    func newGame() {
        
        userInput = ""
        
        userScore = 0
        
        broj = Int.random(in: 1 ... 10)
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

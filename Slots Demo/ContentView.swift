//
//  ContentView.swift
//  Slots Demo
//
//  Created by Kuiduan Zeng on 12/28/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["icecream", "star", "gift", "icecream", "star", "gift", "icecream", "star", "gift"]
    @State private var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @State private var backgrounds = [Color.white, Color.white, Color.white, Color.white, Color.white, Color.white, Color.white, Color.white, Color.white]
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        ZStack {
            //Background
            Rectangle().foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255)).edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255)).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                // Title
                HStack {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                // Credits counter
                Text("Credits: \(credits)")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color(.white).opacity(0.5))
                    .cornerRadius(20)
                
                // Cards
                
                Spacer()
                
                VStack {
                    HStack {
                        
                        CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        
                        CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        
                        CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        
                    }
                    
                    HStack {
                        
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        
                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        
                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                        
                    }
                    
                    HStack {
                        
                        CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        
                        CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        
                        CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        
                    }
                }
                
                
                
                Spacer()
                
                HStack {
                    // Button
                    Button(action: {
                        // Change the images
                        self.backgrounds[0] = Color.white
                        self.backgrounds[1] = Color.white
                        self.backgrounds[2] = Color.white
                        
                        self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                        self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                        self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                        
                        
                        //Check winnings
                        if self.symbols[self.numbers[0]]  == self.symbols[self.numbers[1]] && self.symbols[self.numbers[1]] == self.symbols[self.numbers[2]] {
                            // Won
                            self.credits += self.betAmount * 10
                            
                            // Update backgrounds to green
                            self.backgrounds[0] = Color.green
                            self.backgrounds[1] = Color.green
                            self.backgrounds[2] = Color.green
                            
                        } else {
                            self.credits -= self.betAmount
                        }
                        
                        
                    }, label: {
                        Text("Spin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color(.systemPink))
                            .cornerRadius(20)
                    })
                    
                    // Max spin button
                    Button(action: {
                        // Change the images
                        self.backgrounds = self.backgrounds.map { _ in
                            Color.white
                        }
                        
                        self.numbers = self.numbers.map { _ in
                            Int.random(in: 0...self.symbols.count - 1)
                        }
                        
                        //Check winnings
                        if self.symbols[self.numbers[0]]  == self.symbols[self.numbers[1]] && self.symbols[self.numbers[1]] == self.symbols[self.numbers[2]] {
                            // Won
                            self.credits += self.betAmount * 10
                            
                            // Update backgrounds to green
                            self.backgrounds[0] = Color.green
                            self.backgrounds[1] = Color.green
                            self.backgrounds[2] = Color.green
                            
                        } else {
                            self.credits -= self.betAmount
                        }
                        
                        if self.symbols[self.numbers[3]]  == self.symbols[self.numbers[4]] && self.symbols[self.numbers[4]] == self.symbols[self.numbers[5]] {
                            // Won
                            self.credits += self.betAmount * 10
                            
                            // Update backgrounds to green
                            self.backgrounds[3] = Color.green
                            self.backgrounds[4] = Color.green
                            self.backgrounds[5] = Color.green
                            
                        } else {
                            self.credits -= self.betAmount
                        }
                        
                        if self.symbols[self.numbers[6]]  == self.symbols[self.numbers[7]] && self.symbols[self.numbers[7]] == self.symbols[self.numbers[8]] {
                            // Won
                            self.credits += self.betAmount * 10
                            
                            // Update backgrounds to green
                            self.backgrounds[6] = Color.green
                            self.backgrounds[7] = Color.green
                            self.backgrounds[8] = Color.green
                            
                        } else {
                            self.credits -= self.betAmount
                        }
                        
                        // Check diagonal direction winning
                        if self.symbols[self.numbers[3]]  == self.symbols[self.numbers[1]] && self.symbols[self.numbers[1]] == self.symbols[self.numbers[8]] {
                            // Won
                            self.credits += self.betAmount * 10
                            
                            // Update backgrounds to green
                            self.backgrounds[3] = Color.green
                            self.backgrounds[1] = Color.green
                            self.backgrounds[8] = Color.green
                            
                        } else {
                            self.credits -= self.betAmount
                        }
                        
                        if self.symbols[self.numbers[5]]  == self.symbols[self.numbers[1]] && self.symbols[self.numbers[1]] == self.symbols[self.numbers[6]] {
                            // Won
                            self.credits += self.betAmount * 10
                            
                            // Update backgrounds to green
                            self.backgrounds[5] = Color.green
                            self.backgrounds[1] = Color.green
                            self.backgrounds[6] = Color.green
                            
                        } else {
                            self.credits -= self.betAmount
                        }
                        
                        
                    }, label: {
                        Text("Max Spin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color(.systemPink))
                            .cornerRadius(20)
                    })
                }
                
            
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

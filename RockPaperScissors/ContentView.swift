//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Samet Karakurt on 20.01.2022.
//

import SwiftUI

struct OptionImage : View {
    var image : String
    
    var body : some View {
        Image(image)
            .resizable()
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
            .frame(width: 125, height: 125)
    }
}

struct ContentView: View {
    
    
    @State private var options = ["Rock","Paper","Scissors"]
    
    @State private var computer = ["Rock","Paper","Scissors"]
    
    @State private var winningPositions = ["Paper", "Scissors", "Rock"]
    
    @State private var computerChose = Int.random(in: 0..<3)
    
    @State private var chosen = ""
    
    @State private var winOrLose = Bool.random()
    
    @State private var score = 0
    
    @State private var numberOfGames = 0
    
    @State private var gameIsOver = false
    
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.indigo, .yellow]), startPoint: .top, endPoint: .bottom)
            VStack{
                Spacer()
                Spacer()
        
            Text("RPS Game")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
 
             
    
                VStack(spacing:25){
                    
                    VStack(spacing:15){
                        Text("App's move is \(computer[computerChose])")
                            .foregroundColor(.secondary)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                    
                        Text(winOrLose ? "App want you to Win" : "App want you to Lose")
                            .foregroundColor(.secondary)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    
                            
                        
                    }
                    
                    VStack(spacing:20){
                        ForEach(0..<3){ number in
                            Button{
                                buttonTapped(number: number)
                                
                            }label: {
                                OptionImage(image: options[number])
                                
                            }
                        }
                        
                    }
                    
  
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
           
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                
                
                
            }
            .padding()

            
        }.ignoresSafeArea()
            .alert("Game is over", isPresented: $gameIsOver) {
                Button("Restart", action: restart)
                
            } message: {
                Text("Your score is \(score)")
            }

    }
    
    func buttonTapped(number:Int) {
        if winOrLose{
            if(options[number] == winningPositions[computerChose]){
                score = score + 1
            }else{
                if(score==0){
                    score = 0
                }
                else{
                    score = score - 1
                }
                
            }
            
        }else{
            if(options[number] != winningPositions[computerChose]){
                score = score + 1
            }
            else{
                if(score==0){
                    score = 0
                }
                else{
                    score = score - 1
                }
            }
            
        }

        computerChose = Int.random(in: 0..<3)
        winOrLose = Bool.random()
        if numberOfGames == 9 {
            gameIsOver = true
        }
        numberOfGames += 1

            
        
    }
    
    func restart() {
        score = 0
        numberOfGames = 0
        gameIsOver = false
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

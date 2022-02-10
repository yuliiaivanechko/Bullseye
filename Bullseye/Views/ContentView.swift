//
//  ContentView.swift
//  Bullseye
//
//  Created by Yuliia Ivanechko on 05.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    @State var score: Int = 0
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    
    struct LabelStyle: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct ButtonLargeText: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallText: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    struct Shadow: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .shadow(color: Color.black, radius: 5.0, x: 2, y: 2)
        }
    }
    
    var body: some View {
    VStack {
        
        Spacer()
        HStack
        {
            Text("Put the bullseye as close as you can to: ")
                .modifier(LabelStyle())
            Text(String(game.target)).modifier(ValueStyle())
        }

        Spacer()
        HStack {
            Text("1")
                .modifier(LabelStyle())
            Slider(value: self.$sliderValue, in: 1.0...100.0).accentColor(Color.green)
            Text("100")
                .modifier(LabelStyle())
            }
        
        Spacer()
        Button(action: {
            self.alertIsVisible = true
            let roundedValue: Int = Int(self.sliderValue.rounded())
            self.score = game.pointsForRound(var: roundedValue)
            
        }) {
            Text("Hit me").modifier(ButtonLargeText())
            }
        .alert(isPresented: $alertIsVisible) {() -> Alert in
            let roundedValue: Int = Int(self.sliderValue.rounded())
            let title = game.alertTitle(var: Int(self.sliderValue.rounded()))
            return Alert(title: Text("\(title)"), message: Text("The slider's value is \(roundedValue). " + "\nYou scored \(self.score) points."), dismissButton: .default(Text("Awesome!"))
                         {
                game.score = game.score + game.pointsForRound(var: Int(self.sliderValue.rounded()))
                game.target = Int.random(in: 1...100)
                game.round += 1
            })
        }
        .background(Image("Button")).modifier(Shadow())
        Spacer()
        HStack
        {
            Button(action:
                    {
                game.startOver()
                self.sliderValue = 50.0
                game.target = Int.random(in: 1...100)
            })
            {
                HStack
                {
                    Image("StartOverIcon")
                    Text("Start over")
                        .modifier(ButtonSmallText())
                }
                .background(Image("Button")).modifier(Shadow())
            }
            Spacer()

            Text("Score").modifier(LabelStyle())
            Text("\(game.score)").modifier(ValueStyle())
            
            Spacer()
            Text("Round").modifier(LabelStyle())
            Text("\(game.round)").modifier(ValueStyle())
        }
    }
    .background(Image("Background"), alignment: .center)
    .accentColor(midnightBlue)
    .navigationBarTitle("Bullseye")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 2436, height: 1125))
        
    }
}
    




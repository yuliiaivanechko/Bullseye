//
//  Game.swift
//  Bullseye
//
//  Created by Yuliia Ivanechko on 06.02.2022.
//

import Foundation

struct Game
{
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    
    func pointsForRound(`var` sliderValue: Int) -> Int
    {
        let difference = abs(sliderValue - target)
        var awardedPoints = 100 - difference
        if awardedPoints == 100
        {
            awardedPoints += 100
        }
        else if awardedPoints == 99
        {
            awardedPoints += 50
        }
        return awardedPoints
    }
    
    mutating func startOver() -> Void
    {
        self.round = 1
        self.score = 0
    }
    
    func alertTitle(`var` sliderValue: Int) -> String
    {
        let difference = abs(sliderValue - target)
        let title: String
        if difference == 0
        {
            title = "Perfect!"
        } else if difference < 5
        {
            title = "You almost had it."
        } else if difference <= 10
        {
            title = "Not bad."
        }
        else
        {
            title = "Are you even trying?"
        }
        
        return title
    }
    
}

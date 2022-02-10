//
//  AboutView.swift
//  Bullseye
//
//  Created by Yuliia Ivanechko on 10.02.2022.
//

import SwiftUI

struct AboutView: View{
    var body: some View
    {
        VStack
        {
            Text("🎯 Bullseye 🎯")
            Text ("This is a Bullseye, the game, where you can win points and earn fame by dragging a slider.")
            Text("A goal is to place a slider as close as possible to target value. The close you are, the more points you score.")
            Text("Enjoy!")
        }
        .navigationTitle("AboutBullseye")
    }
}

struct AboutView_Previews: PreviewProvider
{
    static var previews: some View
    {
        AboutView().previewLayout(.fixed(width: 2436, height: 1125))
    }
}

//
//  ContentView.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-25.
//

import SwiftUI

struct ContentView: View {
    let color: UIColor = UIColor(red: 31/255.0,
                                 green: 31/255.0,
                                 blue: 31/255.0,
                                 alpha: 1)
    var body: some View {
    
        VStack {
            ZStack {
                ZStack {
                    Color(color)
                    Image("splash")
                }.ignoresSafeArea()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

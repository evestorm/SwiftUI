//
//  ContentView.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/19.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("UI Design")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("accent"))
                    .padding(.bottom)
                Text("233").foregroundColor(.white)
                Image("Background1")
            }
            .background(Color.black)
            .cornerRadius(10.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

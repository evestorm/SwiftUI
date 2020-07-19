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
        ZStack {
            VStack {
                Text("Cark Back")
            }
            .frame(width: 300.0, height: 280.0)
            .background(Color.blue)
            .cornerRadius(10.0)
            .shadow(radius: 20.0)
            .offset(x: 0, y: -20.0)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("UI Design")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("accent"))
                            .padding(.top)
                        Text("Certificate")
                            .foregroundColor(Color.white)
                        
                    }
                    Spacer()
                    Image("Logo1")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                }
                .padding(.horizontal)
                Spacer()
                Image("Card1")
            }
            .frame(width: 340.0, height: 280.0)
            .background(Color.black)
            .cornerRadius(10.0)
            .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  TabBar.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/27.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem({
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            })
            .tag(1)
            ContentView()
                .tabItem {
                    Image(systemName: "aspectratio")
                    Text("Certificates")
            }
            .tag(2)
            UpdateList()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Updates")
            }
            .tag(3)
            Settings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
            .tag(4)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
//            TabBar()
//                .environment(\.colorScheme, .dark)
        }
//            .environment(\.sizeCategory, .extraExtraLarge)
    }
}

//
//  TabBar.swift
//  DesignCode
//
//  Created by Praveen on 03/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            CourseList().tabItem {
                Image(systemName: "function")
                Text("Courses")
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().previewDevice("iPhone 8")
    }
}

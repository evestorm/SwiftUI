//
//  HomeList.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/26.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 3) { item in
                    CourseView()
                }
            }
            Spacer()
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Build an app with SwiftUI")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(20)
                .lineLimit(4)
                .frame(width: 150)
            Spacer()
            Image("Card2")
                .resizable()
                .frame(width: 246)
        }
        .background(Color("darkblue"))
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: Color("darkblueshadow"), radius: 20, x: 0, y: 20)
    }
}

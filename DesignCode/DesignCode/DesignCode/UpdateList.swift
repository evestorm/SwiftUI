//
//  UpdateList.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/27.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @State var showModal = false
    var updates = updateData
    
    var body: some View {
        NavigationView {
            List(updates) { item in
                NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                    HStack(spacing: 12.0) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color("background2"))
                            .cornerRadius(20)
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.text)
                                .lineLimit(2)
                                .lineSpacing(4)
                                .font(.subheadline)
                            Text(item.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.vertical, 8.0)
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.showModal = true
                }) {
                    Image(systemName: "gear")
                }.sheet(isPresented: self.$showModal) {
                    Text("modal")
                }
            )
        }
        .padding()
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI Advanced", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "JAN 1"),
    Update(image: "Card2", title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
    Update(image: "Card3", title: "ProtoPie", text: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27"),
    Update(image: "Card4", title: "SwiftUI", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUNE 26"),
    Update(image: "Card5", title: "Framer Playground", text: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 11")
]

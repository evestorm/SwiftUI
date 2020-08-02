//
//  UpdateList.swift
//  DesignCode
//
//  Created by Praveen on 02/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(title: "New item", image: "Card1", text: "text", date: "Jan 2"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { item in
                    NavigationLink(destination: UpdateDetail(update: item)) {
                        HStack {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(item.title)
                                    .font(.system(size: 20, weight: .bold))
                                Text(item.text)
                                    .font(.subheadline)
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                .lineLimit(2)
                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .onDelete { (index) in
                    self.store.updates.remove(at: index.first ?? 0)
                }
                .onMove { (sourceIndexSet, desitinationIndex) in
                    self.store.updates.move(fromOffsets: sourceIndexSet, toOffset: desitinationIndex)
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            }, trailing: EditButton())
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var text: String
    var date: String
}

let updateData = [
    Update(title: "SwiftUI Advanced", image: "Card1", text: "Want to test concepts using real techniques? This is the perfect course to learn design using SwiftUI.", date: "Dec 14"),
    Update(title: "SwiftUI Prototyping", image: "Card2", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "Nov 28"),
    Update(title: "Objc Advanced", image: "Card3", text: "Want to test concepts using real techniques? This is the perfect course to learn design using SwiftUI.", date: "Dec 14"),
    Update(title: "SwiftUI Designs", image: "Card4", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "Nov 28")
]

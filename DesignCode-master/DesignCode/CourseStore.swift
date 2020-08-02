//
//  CourseStore.swift
//  DesignCode
//
//  Created by Praveen on 09/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "jzf5o2kgg108", accessToken: "sgzwMIiZ2dYbyAr-412FINGeSJt8rKUOhrZgF7sC3ac")

func getArray(id: String, completion: @escaping ([Entry]) -> Void) {
    let query = Query.where(contentTypeId: id)
    client.fetchArray(of: Entry.self, matching: query) { result in
        print(result)
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .error(let error):
            print(error)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init() {
        let colorArray = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),]
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                self.courses.append(
                    Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    image: (item.fields.linkedAsset(at: "image")?.url) ?? URL(string: "")!
                        ,
                    logo: #imageLiteral(resourceName: "Logo3"),
                    color: colorArray.randomElement()!,
                    show: false)
                )
            }
        }
    }
}

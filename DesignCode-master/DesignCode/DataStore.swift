//
//  DataStore.swift
//  DesignCode
//
//  Created by Praveen on 09/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        API().getPost { (posts) in
            self.posts = posts
        }
    }
    
}

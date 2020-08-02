//
//  Data.swift
//  DesignCode
//
//  Created by Praveen on 08/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}


class API {
    func getPost(completion: @escaping ([Post]) -> Void) {
        guard let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, respones, error) in
            guard let data = data else { return }
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
}

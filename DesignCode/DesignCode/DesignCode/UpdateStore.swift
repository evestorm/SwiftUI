//
//  UpdateStore.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/27.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = [] // Update对象数组
    init(updates: [Update] = []) {
        self.updates = updates
    }
}

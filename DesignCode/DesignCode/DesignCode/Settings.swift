//
//  Settings.swift
//  DesignCode
//
//  Created by evestorm on 2020/7/28.
//  Copyright © 2020 evelance. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var emial = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("Receive notifications")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                Picker(selection: $selection, label: Text("Favorite course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker(selection: $date) {
                    Text("Date")
                }
                Section(header: Text("Email")) {
                    TextField("Your email", text: $emial)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: { self.submit.toggle() }) {
                    Text("Submit")
                }
                .alert(isPresented: $submit) { () -> Alert in
                    Alert(title: Text("Thanks!"), message: Text("Email: \(emial)"))
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

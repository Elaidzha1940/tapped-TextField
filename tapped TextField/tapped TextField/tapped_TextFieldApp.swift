//
//  tapped_TextFieldApp.swift
//  tapped TextField
//
//  Created by Elaidzha Shchukin on 08.05.2023.
//

import SwiftUI

@main
struct tapped_TextFieldApp: App {
    var body: some Scene {
        WindowGroup {
            SortView(showConfirmationDialog: .constant(false))
        }
    }
}

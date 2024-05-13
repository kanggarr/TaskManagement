//
//  Task_ManagerApp.swift
//  Task Manager
//
//  Created by Beyond Wealth on 13/5/2567 BE.
//

import SwiftUI

@main
struct Task_ManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}

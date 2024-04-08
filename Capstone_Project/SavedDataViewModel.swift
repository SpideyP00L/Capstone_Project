//
//  SavedDataViewModel.swift
//  demo_sqllite_saving
//
//  Created by Jeet Panchal on 2024-04-06.
//

import Foundation

class SavedDataViewModel: ObservableObject {
    @Published var users: [User] = []
    private let dbManager = DatabaseManager()

    func fetchUsers() {
        users = dbManager.getUsers()
    }
}

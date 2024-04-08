//
//  DatabaseManager.swift
//  Youtube_Login_Page
//
//  Created by Jeet Panchal on 2024-04-07.
//

import Foundation
import SQLite3

class DatabaseManager {
    var db: OpaquePointer?

    init() {
        // Open database
        if sqlite3_open(getDBPath(), &db) != SQLITE_OK {
            print("Error opening database")
        }
        
        // Create table
        let createTableQuery = """
            CREATE TABLE IF NOT EXISTS Users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT,
                email TEXT,
                phoneNumber TEXT,
                password TEXT
            );
            """
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Error creating table: \(errmsg)")
        }
    }

    deinit {
        // Close database
        if sqlite3_close(db) != SQLITE_OK {
            print("Error closing database")
        }
    }
    
    func saveUser(username: String, email: String, phoneNumber: String, password: String) {
        let insertQuery = "INSERT INTO Users (username, email, phoneNumber, password) VALUES (?, ?, ?, ?);"
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (username as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (phoneNumber as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 4, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) != SQLITE_DONE {
                print("Error inserting user data")
            }
        } else {
            print("Error preparing insert statement")
        }
        
        sqlite3_finalize(statement)
    }
    
    func getUsers() -> [User] {
        let selectQuery = "SELECT * FROM Users;"
        var users: [User] = []
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, selectQuery, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(statement, 0))
                let username = String(cString: sqlite3_column_text(statement, 1))
                let email = String(cString: sqlite3_column_text(statement, 2))
                let phoneNumber = String(cString: sqlite3_column_text(statement, 3))
                let password = String(cString: sqlite3_column_text(statement, 4))
                users.append(User(id: id, username: username, email: email, phoneNumber: phoneNumber, password: password))
            }
        } else {
            print("Error preparing select statement")
        }

        sqlite3_finalize(statement)
        
        // Print the retrieved users to the console
        print("Retrieved users:")
        for user in users {
            print("ID: \(user.id), Username: \(user.username), Email: \(user.email), Phone Number: \(user.phoneNumber), Password: \(user.password)")
        }
        
        return users
    }
    
    func loginUser(email: String, password: String) -> Bool {
        let selectQuery = "SELECT * FROM Users WHERE email = ? AND password = ?;"
        var statement: OpaquePointer?
        var isLoggedIn = false
        
        if sqlite3_prepare_v2(db, selectQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) == SQLITE_ROW {
                isLoggedIn = true
                print("User logged in successfully!")
            } else {
                print("Invalid email or password")
            }
        } else {
            print("Error preparing select statement")
        }
        
        sqlite3_finalize(statement)
        return isLoggedIn
    }

    func getLoggedInUser(email: String, password: String) -> User? {
        let selectQuery = "SELECT * FROM Users WHERE email = ? AND password = ?;"
        var statement: OpaquePointer?
        var loggedInUser: User?

        if sqlite3_prepare_v2(db, selectQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (password as NSString).utf8String, -1, nil)

            if sqlite3_step(statement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(statement, 0))
                let username = String(cString: sqlite3_column_text(statement, 1))
                let email = String(cString: sqlite3_column_text(statement, 2))
                let phoneNumber = String(cString: sqlite3_column_text(statement, 3))
                let password = String(cString: sqlite3_column_text(statement, 4))
                loggedInUser = User(id: id, username: username, email: email, phoneNumber: phoneNumber, password: password)
                print("Logged-in user details: ID: \(loggedInUser!.id), Username: \(loggedInUser!.username), Email: \(loggedInUser!.email), Phone Number: \(loggedInUser!.phoneNumber), Password: \(loggedInUser!.password)")
            } else {
                print("User not found with provided email and password")
            }
        } else {
            print("Error preparing select statement")
        }

        sqlite3_finalize(statement)
        return loggedInUser
    }
    
    private func getDBPath() -> String {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("users.sqlite")
        return fileURL.path
    }
}


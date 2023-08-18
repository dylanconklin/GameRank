//
//  Database.swift
//  GameRank
//
//  Created by Dylan Conklin on 8/5/23.
//

import Foundation
// import FirebaseStorage
import PostgresClientKit

class Database {
    static func query(_ queryText: String) -> [[PostgresValue]] {
        var results: [[PostgresValue]] = []
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "localhost"
            configuration.port = 5432
            configuration.database = "dylan-c-conklin"
            configuration.user = "dylan-c-conklin"
            configuration.ssl = false
            configuration.credential = .trust
            // configuration.credential = .scramSHA256(password: "apple")
            
            let connection: Connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let statement = try connection.prepareStatement(text: queryText)
            defer { statement.close() }
            let cursor = try statement.execute()
            defer { cursor.close() }
            for row in cursor {
                let result = try row.get().columns
                results.append(result)
            }
        } catch {
            print("Error: \(error)") // better error handling goes here
        }
        return results
    }
}

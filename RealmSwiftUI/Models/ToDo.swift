//
//  ToDo.swift
//  RealmSwiftUI
//
//  Created by Andres Gutierrez on 6/25/23.
//

import Foundation
import RealmSwift

class ToDo: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var completed = false
    @Persisted var urgency: Urgency = .neutral
    
    enum Urgency: Int, PersistableEnum {
        case trivial, neutral, urgent
        
        var text: String {
            switch self {
            case.trivial:
                return "Trivial"
            case .neutral:
                return "Neutral"
            case .urgent:
                return "Urgent"
            }
        }
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
}

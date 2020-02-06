import FluentMySQL
import Vapor

final class Jobs: MySQLModel {
    
    var id: Int?
    var title: String

    init(id: Int? = nil, title: String) {
        self.id = id
        self.title = title
    }
}

/// Allows `Jobs` to be used as a dynamic migration.
extension Jobs: Migration { }

/// Allows `Jobs` to be encoded to and decoded from HTTP messages.
extension Jobs: Content { }

/// Allows `Jobs` to be used as a dynamic parameter in route definitions.
extension Jobs: Parameter { }

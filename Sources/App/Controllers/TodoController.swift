import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class JobsController {
    /// Returns a list of all `Jobs`s.
    func index(_ req: Request) throws -> Future<[Jobs]> {
        return Jobs.query(on: req).all()
    }

    /// Saves a decoded `Jobs` to the database.
    func create(_ req: Request) throws -> Future<Jobs> {
        return try req.content.decode(Jobs.self).flatMap { todo in
            return todo.save(on: req)
        }
    }

    /// Deletes a parameterized `Jobs`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Jobs.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
}

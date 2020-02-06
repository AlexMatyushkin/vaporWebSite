import FluentMySQL
import Vapor
import Leaf

/// Called before your application initializes.
public func configure(_ config: inout Config,
                      _ env: inout Environment,
                      _ services: inout Services) throws {
    
    // Register providers first
    try services.register(FluentMySQLProvider())
    try services.register(LeafProvider())
    
    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    // middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a MySQL database
    var databeses = DatabasesConfig()
    
    let databaseConfig = MySQLDatabaseConfig(
        port: 3306,
        username: "root",
        password: "root",
        database: "vaporDataBase"
    )
    
    let database = MySQLDatabase(config: databaseConfig)
    databeses.add(database: database, as: .mysql)
    services.register(databeses)
    
    // Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Jobs.self, database: .mysql)
    services.register(migrations)
    
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
}

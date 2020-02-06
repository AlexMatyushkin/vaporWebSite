import FluentPostgreSQL
import Vapor
import Leaf

/// Called before your application initializes.
public func configure(_ config: inout Config,
                      _ env: inout Environment,
                      _ services: inout Services) throws {
    
    // Register providers first
    try services.register(FluentPostgreSQLProvider())
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
    let db = Environment.get("POSTGRES_DB") ?? "test"
    let host = Environment.get("POSTGRES_HOST") ?? "localhost"
    let user = Environment.get("POSTGRES_USER") ?? "postgres"
    let pass = Environment.get("POSTGRES_PASSWORD")

    var port = 5432
    if let param = Environment.get("POSTGRES_PORT"), let newPort = Int(param) {
        port = newPort
    }

    let pgConfig = PostgreSQLDatabaseConfig(hostname: host, port: port, username: user, database: db, password: pass)
    let pgsql = PostgreSQLDatabase(config: pgConfig)
    var databases = DatabasesConfig()
    databases.add(database: pgsql, as: .psql)
    services.register(databases)
    
    // Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Jobs.self, database: .psql)
    services.register(migrations)
    
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
    
    let myServerConfig = try EngineServerConfig.detect(from: &env, port: 80)
    services.register(myServerConfig)
}

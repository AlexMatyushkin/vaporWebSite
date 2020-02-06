import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let jobsController = JobsController()
    router.get("jobs", use: jobsController.index)
    router.post("jobs", use: jobsController.create)
    router.delete("jobs", Jobs.parameter, use: jobsController.delete)
    
    //Register WebSiteController
    let websiteController = WebsiteController()
    try router.register(collection: websiteController)
}

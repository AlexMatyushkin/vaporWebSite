import Vapor
import Leaf

struct HomePageController: RouteCollection {
  
    func boot(router: Router) throws {
        router.get(use: indexHandler)
    }
    
    func indexHandler(_ req: Request) throws -> Future<View> {
        let context = createContext()
        return try req.view().render("index", context)
    }
    
    func createContext() -> HomePageContext {
        var jobs: [Job] = []
        var position: [Position] = []
        
        position.append(Position(name: "Junior IOS software engineer",
                                 whatToDo:
            """
            Develop a corporative messanger "Sberchat".
            I had debugging it and had developing new feature kind of:
            1) Users permissions in groups and channel;
            2) Create wounded contact screen.
            
            Develop an enterprise IOS store for our company IOS apps.
            Create MVP application;
            1) Refactoring app for VIPER;
            2) Add VDI functional for VPN connections to our company resource.
            """))
        position.append(Position(name: "IOS software enginner",
                                 whatToDo:
            """
            Develop Sberbank Bussines Online appication.
            <br>This is application for clients of bank which have self companies.
            <br>My feature team is developing online credit system for clients.
            """))
        
        jobs.append(Job(companyName: "Sberbank",
                        companyWebSiteLink: "https://www.sberbank.com/index",
                        workPeriod: "From Aprill 2018 to now",
                        positions: position))
        
        return HomePageContext(title: "Alex Matyushkin", jobs: jobs)
    }
}



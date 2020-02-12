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
            <br>I had debugging it and had developing new feature kind of:
            <br>-Users permissions in groups and channel;
            <br>-Create wounded contact screen.
            <br>
            <br> Develop an enterprise IOS store for our company IOS apps.
            <br>-Create MVP application;
            <br>-Refactoring app for VIPER;
            <br>-Add VDI functional for VPN connections to our company resource.
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



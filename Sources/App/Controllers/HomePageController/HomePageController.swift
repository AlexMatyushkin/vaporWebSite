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
            This is application for clients of bank which have self companies.
            My feature team is developing online credit system for clients.
            """))
        
        jobs.append(Job(companyName: "Sberbank",
                        companyWebSiteLink: "https://www.sberbank.com/index",
                        workPeriod: "From Aprill 2018 to now",
                        positions: position))
        
        let newPosition: [Position] = [Position(name: "First Line support lead", whatToDo:
        """
        The Department of Information Technology is a specialist in primary support for the processes of filing applications for legal entities.

        What i do:

        - Diagnosing problems, finding solutions and workarounds for existing bugs in the processes of filing, reviewing, making decisions on applications of legal entities.

        - Setting tasks to technologists to take measures to correct found bugs.

         - Consideration and submission of proposals for the modernization and optimization of internal systems of the bank on the process related to the filing of applications.

         - Transfer of operations to the performance of remote employees.

        - Problem managment.


        In the course of work, I confidently mastered splunk for searching logs by processes, as well as compiling dashboards for monitoring problems

        What instruments I use:

        - SAS to monitor and search for information in various databases, compile automatic error reports related to the application review process

         -SOAP to send events to update the current information on requests in case of error correction.

         - Create SQLrequest for finding inforamtion about errors in data bases.

        Progress:

         - Construction of primary support for a POS lending product (processing loans for stores, partners) from scratch.

         - Creating and transferring operations to remote support staff.

         - Writing instructions and processes for employees to understand the process of  product and the weak points of it.

        - Description of major bugs and making recommendations for optimizing and improving the process.

        - Set up reporting and process monitoring and process errors using database bundles.
        """)]
        
        jobs.append(Job(companyName: "Tinkoff",
                        companyWebSiteLink: "https://www.tinkoff.ru/eng/",
                        workPeriod: "From Aprill 2016 to Aprill 2018",
                        positions: newPosition))
        return HomePageContext(title: "Alex Matyushkin", jobs: jobs)
    }
}



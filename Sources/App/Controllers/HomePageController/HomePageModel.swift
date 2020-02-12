//
//  HomePageModel.swift
//  App
//
//  Created by 17503583 on 12.02.2020.
//

import Foundation

struct HomePageContext: Encodable {
    var title: String
    var jobs: [Job]
}

struct Job: Encodable {
    var companyName: String
    var companyWebSiteLink: String
    var workPeriod: String
    var positions: [Position]
}

struct Position: Encodable {
    var name: String
    var whatToDo: String
}

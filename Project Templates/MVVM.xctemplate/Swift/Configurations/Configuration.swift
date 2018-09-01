//
//  Configuration.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

struct Configuration {

}

struct ___PROJECTNAME___ClientAPIKeys {
    #if DEBUG
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""

    #elseif STAGING
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""

    #elseif RELEASE
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""
    #endif
}

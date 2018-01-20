//
//  Configuration.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

struct Configuration {
    
}

struct ___PROJECTNAME___ClientAPI {
    #if DEBUG
        let basePath = ""
        let clientID = ""
        let clientSecret = ""

    #elseif STAGGING
        let basePath = ""
        let clientID = ""
        let clientSecret = ""

    #elseif RELEASE
        let basePath = ""
        let clientID = ""
        let clientSecret = ""
    #endif
}

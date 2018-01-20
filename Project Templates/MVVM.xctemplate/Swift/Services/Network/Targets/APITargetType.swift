//
//  APITarget.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Alamofire
import Moya

protocol Authenticatable {
    var authentication: Authentication { get }
}

enum Authentication: String {
    case none
    case basic
    case accessToken
    case oauth2
    case bearerToken
}

protocol APITargetType: TargetType, Authenticatable {}

extension APITargetType {

    var task: Task {
        return .requestPlain
    }

    //swiftlint:disable force_unwrapping
    var baseURL: URL {
        return URL(string: ___PROJECTNAME___ClientAPI.basePath)!
    }
    //swiftlint:enable force_unwrapping

    var authentication: Authentication {
        return .bearerToken
    }

    var parameters: Parameters? {
        return nil
    }

    var parameterEncoding: ParameterEncoding {
        return CompositeEncoding()
    }

    var sampleData: Data {
        return Data()
    }
}

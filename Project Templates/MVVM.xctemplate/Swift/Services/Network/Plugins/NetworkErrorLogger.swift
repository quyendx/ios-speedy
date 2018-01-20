//
//  NetworkErrorLogger.swift
//
//
//  Created by Dang Thai Son on 7/4/17.
//  Copyright © 2017 Innovatube. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper
import Result

struct NetworkErrorLogger: PluginType {
    func didReceive(_ result: Result<Moya.Response, Moya.MoyaError>, target: TargetType) {

        switch result {
        case .success(let response):
            if (200...299).contains(response.statusCode) {
                return
            }

            do {
                let serverError = try response.mapObject(ServerError.self)
                debugLog("\(target) -> \(serverError.localizedDescription)")

            } catch {
                debugLog(error.message)
            }

        case .failure(let error):
            debugLog(error.message)
        }
    }
}

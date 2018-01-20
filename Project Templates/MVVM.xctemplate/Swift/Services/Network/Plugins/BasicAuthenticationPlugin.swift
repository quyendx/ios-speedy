//
//  BasicAuthenticationPlugin.swift
//  CarBid
//
//  Created by Dang Thai Son on 5/26/17.
//  Copyright © 2017 Khoi Truong Minh. All rights reserved.
//

import Foundation
import Moya

struct BasicAuthenticationPlugin: PluginType {
    let tokenStore: TokenKeychainStore

    init(tokenStore: TokenKeychainStore = TokenKeychainStore.default) {
        self.tokenStore = tokenStore
    }

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let target = target.rawTarget as? APITargetType, target.authentication == .bearerToken else { return request }

        if let token = request.value(forHTTPHeaderField: "Authorization"), token.length > 0 {
            return request
        }

        let token = tokenStore.currentToken
        guard token.isValid, let accessToken = token.accessToken else { return request }

        var newRequest = request
        newRequest.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        return newRequest
    }

    func willSend(_ request: RequestType, target: TargetType) {
        guard let target = target.rawTarget as? Authenticatable else { return }

        switch target.authentication {
        case .basic:
            let token = tokenStore.currentToken
            guard token.isValid else { return }

            guard let username = token.username, let password = token.password else { return }
            _ = request.authenticate(user: username, password: password, persistence: .none)

        default:
            break
        }

    }
}

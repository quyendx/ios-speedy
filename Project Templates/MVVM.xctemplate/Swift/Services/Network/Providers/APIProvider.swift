//
//  APIProvider.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Alamofire
import Moya
import RxSwift

extension TargetType {

    var rawTarget: TargetType {

        if let multiTarget = self as? MultiTarget {
            return multiTarget.target
        }
        return self
    }
}

class APIProvider: MoyaProvider<MultiTarget> {

    override init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                  requestClosure: @escaping RequestClosure = MoyaProvider.defaultRequestMapping,
                  stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                  callbackQueue: DispatchQueue? = nil,
                  manager: Manager = MoyaProvider<MultiTarget>.defaultAlamofireManager(),
                  plugins: [PluginType] = [BasicAuthenticationPlugin(), NetworkErrorTransformPlugin(), NetworkErrorLogger(), NetworkActivityPlugin(networkActivityClosure: { (type, _) in UIApplication.shared.isNetworkActivityIndicatorVisible = type == .began })],
                  trackInflights: Bool = false) {

        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: callbackQueue, manager: manager, plugins: plugins, trackInflights: trackInflights)
    }
}

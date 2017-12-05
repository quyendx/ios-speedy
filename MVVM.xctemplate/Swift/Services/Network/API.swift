//
//  API.swift
//
//  Created by Dang Thai Son on 5/22/17.
//  Copyright © 2017 Innovatube. All rights reserved.
//

import Foundation
import Moya
import RxSwift

let NotSignInNotification = Notification.Name("NotSignIn")

class API {
    static let `default` = API()

    let provider: MoyaProvider<MultiTarget>
    let tokenProvider: AccessTokenProvider

    private let disposeBag: DisposeBag = DisposeBag()

    init(provider: MoyaProvider<MultiTarget> = APIProvider(), tokenProvider: AccessTokenProvider = AccessTokenProvider()) {
        self.provider = provider
        self.tokenProvider = tokenProvider
    }

    func request(target: APITargetType) -> Observable<Response> {
        return provider
            .rx
            .request(MultiTarget(target))
            .debug()
            .filterSuccessfulStatusCodes()
            .asObservable()
    }

    func authenticateRequest(target: APITargetType) -> Observable<Response> {
        return provider
            .rx
            .request(MultiTarget(target))
            .do(onNext: { response in
                if response.statusCode == 401 {
                    NotificationCenter.default.post(name: NotSignInNotification, object: nil)
                }
            })
            .filterSuccessfulStatusCodes()
            .asObservable()
    }

    func requestWithProgress(target: APITargetType) -> Observable<ProgressResponse> {
        return provider
            .rx
            .requestWithProgress(MultiTarget(target))
    }
}

extension API {
    /// Request with Default API instance
    class func request(target: APITargetType) -> Observable<Response> {
        return `default`.request(target: target)
    }
    
    /// Authenticate Request with Default API instance
    class func authenticateRequest(target: APITargetType) -> Observable<Response> {
        return `default`.authenticateRequest(target: target)
    }
}

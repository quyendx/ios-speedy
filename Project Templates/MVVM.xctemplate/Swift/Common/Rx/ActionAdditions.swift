//
//  ActionAdditions.swift
//  CarBid
//
//  Created by Khoi Truong Minh on 8/28/16.
//  Copyright © 2016 Khoi Truong Minh. All rights reserved.
//

import RxSwift
import RxCocoa
import Action

extension Error {

    func unwrapActionUnderlyingError() -> Error? {
        guard let actionError = self as? ActionError else { return nil }
        switch actionError {
        case .notEnabled:
            fatalError("Action not enabled")
        case .underlyingError(let error):
            return error
        }
    }
}

extension ObservableType where E: Error {

    func unwrapActionUnderlyingError() -> Observable<Error> {
        return map { (actionError) -> Error in
            guard let actionError = actionError as? ActionError else { fatalError("ActionError type mismatch") }
            switch actionError {
            case .notEnabled:
                fatalError("Action not enabled")
            case .underlyingError(let error):
                return error
            }
        }
    }

}

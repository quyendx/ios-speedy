//
//  Error+Rx.swift
//  CarBid
//
//  Created by Khoi Truong Minh on 12/22/16.
//  Copyright © 2016 Khoi Truong Minh. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

extension ObservableType {

    func forwardError<O: ObserverType>(to observer: O) -> Observable<E> where O.E == Error {
        return self.do(onError: { observer.onNext($0) })
    }

}

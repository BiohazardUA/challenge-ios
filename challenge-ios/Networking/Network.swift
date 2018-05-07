//
//  Network.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 07.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Moya
import RxSwift
import RxCocoa
import Result

class Network {
  fileprivate static var disposeBag = DisposeBag()
  
  fileprivate static var provider = MoyaProvider<ServerAPI>(
    endpointClosure: { target -> Endpoint<ServerAPI> in
      return Endpoint<ServerAPI>(url: target.url,
                                 sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                                 method: target.method,
                                 task: target.task,
                                 httpHeaderFields: target.headers)
  }, plugins: [
    NetworkLoggerPlugin(verbose: true, cURL: true)
    ])
}

extension Network {
  
  static func request(target: ServerAPI) -> Observable<Response> {
    return Observable.create({ observer in
      let request = provider.rx.request(target).subscribe { event in
        switch event {
        case .success(let response):
          observer.onNext(response)
        case .error(let error):
          observer.on(.error(error))
        }
      }
      return Disposables.create {
        request.disposed(by: disposeBag)
      }
    })
  }
}


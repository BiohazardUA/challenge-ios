//
//  EventsFeedModel.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 07.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import RxCocoa
import RxSwift
import RxOptional
import NSObject_Rx
import Moya
import Moya_ObjectMapper

class EventsFeedModel: NSObject {
  public var loadingOutput: Driver<LoadingState>
  public var eventsOutput: Observable<[EventItem]>
  private var loadingState: Variable<LoadingState?> = Variable(nil)
  private var events: Variable<[EventItem]?> = Variable(nil)
  private var lastPage : Variable<EventsPagination?> = Variable(nil)
  private let itemsToFetch = 5
  private var cityID: String!
  
  convenience init(cityID: CityID) {
    self.init()
    self.cityID = cityID.rawValue
  }
  
  override private init() {
    loadingOutput = loadingState.asDriver().filterNil()
    eventsOutput = events.asObservable().filterNil()
    super.init()
  }
  
  public func clear() {
    lastPage.value = nil
    events.value = []
  }
  
  public func getEvents() -> [EventItem]? {
    return events.value
  }
  
  public func haveNextPage() -> Bool {
    let total = lastPage.value?.data?.count ?? 0
    return getEventsCount() < total
  }
  
  private func getNextPageNumber() -> Int {
    let eventsCount = getEventsCount()
    let currentPageNumber = ceil(Double(eventsCount) / 20)
    return Int(currentPageNumber) + 1
  }
  
  public func getEventsCount() -> Int {
    return events.value == nil ? 0 : events.value!.count
  }
  
  private func getTotalEventsCount() -> Int {
    return lastPage.value?.data?.count ?? 0
  }
  
  private func update(_ pagination: EventsPagination) {
    guard let fetchedEvents = pagination.data?.items else { return }
    if fetchedEvents.isNotEmpty {
      lastPage.value = pagination
    }
    
    if events.value == nil {
      events.value = fetchedEvents
    } else {
      events.value?.append(contentsOf: fetchedEvents)
    }
  }
  
  public func requestNextPage() {
    guard loadingState.value != .loading else { return }
    Observable
      .just((itemsCount: itemsToFetch,
             pageNumber: getNextPageNumber(),
             cityID: cityID),
            scheduler: ConcurrentDispatchQueueScheduler(qos: .background))
      .do() { [weak self] in
        self?.loadingState.value = .loading
      }
      .flatMap { parameters -> Observable<Response> in
        return Network.request(target: .fetchEvents(limit: parameters.itemsCount,
                                                    pageNumber: parameters.pageNumber,
                                                    cityID: parameters.cityID))
          .share(replay: 1)
      }
      .mapObject(EventsPagination.self)
      .observeOn(ConcurrentMainScheduler.instance)
      .subscribe { [weak self] (event) in
        switch event {
        case .next(let pagination):
          self?.update(pagination)
          self?.loadingState.value = .normal
        case .error(let error):
          print(error)
          self?.loadingState.value = .error
        case .completed:
          self?.loadingState.value = .normal
        }
      }
      .disposed(by: rx.disposeBag)
  }
}

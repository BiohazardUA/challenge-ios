//
//  EventsViewController.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import UIKit

class EventsViewController: TransitionViewController {
  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(nibWithCellClass: EventCell.self)
      tableView.estimatedRowHeight = 200
      tableView.height = UITableViewAutomaticDimension
      tableView.rx.setDelegate(self).disposed(by: rx.disposeBag)
    }
  }
  private var refreshControl: UIRefreshControl!
  private var bottomActivityView: UIActivityIndicatorView!
  private var viewModel: EventsFeedModel!
  private var cityID: CityID!
  
  static func storyboardInstance(with cityID: CityID) -> EventsViewController {
    let vc = StoryboardScene.Events.eventsViewController.instantiate()
    vc.cityID = cityID
    return vc
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel = EventsFeedModel(cityID: cityID)
    refreshControl = UIRefreshControl()
    refreshControl?.backgroundColor = .clear
    refreshControl.clipsToBounds = true
    refreshControl?.tintColor = .mainGreen
    refreshControl?.addTarget(self,
                              action: #selector(refreshEvents),
                              for: .valueChanged)
    tableView.addSubview(refreshControl)
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    bottomActivityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    view.decorator.apply(Style.bottomGradient(with: bottomActivityView,
                                              maxYpos: UIScreen.main.bounds.maxY))
    binds()
    viewModel.requestNextPage()
  }
  
  @objc private func refreshEvents() {
    viewModel.clear()
    viewModel.requestNextPage()
  }
  
  private func binds() {
    viewModel.eventsOutput
      .bind(to: tableView.rx
        .items(cellIdentifier: String(describing: EventCell.self),
               cellType: EventCell.self)) { (row, element, cell) in
                cell.configure(with: element)
      }
      .disposed(by: rx.disposeBag)
    
    tableView.rx
      .modelSelected(EventItem.self)
      .subscribe(onNext: { [weak self] (event) in
        guard let strongSelf = self else { return }
        if let selectedRow = strongSelf.tableView.indexPathForSelectedRow {
          strongSelf.tableView.deselectRow(at: selectedRow,
                                           animated: true)
        }
        let vc = EventViewController.storyboardInstance(with: event)
        strongSelf.show(vc)
      })
      .disposed(by: rx.disposeBag)
    
    viewModel.loadingOutput
      .drive(onNext: { [weak bottomActivityView, weak refreshControl] (state) in
        switch state {
        case .loading:
          bottomActivityView?.startAnimating()
        default:
          refreshControl?.endRefreshing()
          bottomActivityView?.stopAnimating()
        }
      })
      .disposed(by: rx.disposeBag)
  }
}

extension EventsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView,
                 willDisplay cell: UITableViewCell,
                 forRowAt indexPath: IndexPath) {
    if indexPath.row == viewModel.getEventsCount() - 1 && viewModel.haveNextPage() {
      viewModel.requestNextPage()
    }
  }
}









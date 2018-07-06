//
//  CitiesViewController.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

  @IBAction private func hamburgTapped() {
    let vc = EventsViewController.storyboardInstance(with: .hamburg)
    show(vc)
  }
  
  @IBAction private func kolnTapped() {
    let vc = EventsViewController.storyboardInstance(with: .koln)
    show(vc)
  }
  
  @IBAction private func allTapped() {
    let vc = EventsViewController.storyboardInstance(with: .all)
    show(vc)
  }
}

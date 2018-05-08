//
//  CitiesViewController.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

  @IBAction func hamburgTapped() {
    let vc = EventsViewController.storyboardInstance(with: .hamburg)
    show(vc, sender: nil)
  }
  
  @IBAction func kolnTapped() {
    let vc = EventsViewController.storyboardInstance(with: .koln)
    show(vc, sender: nil)
  }
  
  @IBAction func allTapped() {
    let vc = EventsViewController.storyboardInstance(with: .all)
    show(vc, sender: nil)
  }
}

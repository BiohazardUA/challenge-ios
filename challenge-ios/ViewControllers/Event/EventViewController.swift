//
//  EventViewController.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import UIKit

class EventViewController: TransitionViewController {
  @IBOutlet private weak var eventTitleLabel: UILabel!
  @IBOutlet private weak var eventImageView: UIImageView!
  @IBOutlet private weak var chefAvatarView: UIImageView!
  @IBOutlet private weak var chefNameLabel: UILabel!
  @IBOutlet private weak var dateOfCreationLabel: UILabel!
  private var event: EventItem!
  
  static func storyboardInstance(with event: EventItem) -> EventViewController {
    let vc = StoryboardScene.CertainEvent.eventViewController.instantiate()
    vc.event = event
    return vc
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    refreshUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    chefAvatarView.cornerRadius = chefAvatarView.height / 2
  }
  
  private func refreshUI() {
    eventImageView.hero.id = event.id
    eventTitleLabel.hero.id = event.id
    if let imageLink = event.images?.first?.imageUrl {
      eventImageView.kf.setImage(with: URL(string: imageLink),
                                 options: [.transition(.fade(0.3))])
    }
    title = event.title
    eventTitleLabel.text = event.title
    if let chefAvatarLink = event.chef?.avatarUrl {
      chefAvatarView.kf.setImage(with: URL(string: chefAvatarLink),
                                 options: [.transition(.fade(0.3))])
    }
    chefNameLabel.text = event.chef?.firstName
    let date = DateHelper.dateFrom(event.createdAt)
    let formatedDate = DateHelper.format(date)
    dateOfCreationLabel.text = formatedDate
  }
}

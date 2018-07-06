//
//  TransitionViewController.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Hero

class TransitionViewController: UIViewController {

  @IBAction private func screenEdgePaned(_ panGR: UIScreenEdgePanGestureRecognizer) {
    let translation = panGR.translation(in: nil)
    let progress = translation.x / view.bounds.width
    switch panGR.state {
    case .began:
      // begin the transition as normal
      DispatchQueue.main.async { [weak self] in
        self?.setHeroTransitionZoom(isBack: true)
        self?.navigationController?.popViewController()
      }
    case .changed:
      // calculate the progress based on how far the user moved
      DispatchQueue.main.async {
        Hero.shared.update(progress)
      }
    default:
      // end the transition when user ended their touch
      let progressWithVelocity = progress + panGR.velocity(in: nil).x / view.bounds.width
      if progressWithVelocity > 0.3 {
        Hero.shared.complete(finished: progressWithVelocity >= 1)
      } else {
        Hero.shared.cancel()
      }
    }
  }
}

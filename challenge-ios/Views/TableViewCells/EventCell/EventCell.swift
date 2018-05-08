//
//  EventCell.swift
//  challenge-ios
//
//  Created by Vladislav Ternovskiy on 08.05.2018.
//  Copyright © 2018 Vladislav Ternovskiy. All rights reserved.
//

import Cosmos
import Kingfisher

class EventCell: UITableViewCell {
  @IBOutlet private weak var bgView: UIView!
  @IBOutlet private weak var eventImageView: UIImageView!
  @IBOutlet private weak var gradientBottomView: UIView!
  @IBOutlet private weak var eventTitleLabel: UILabel!
  @IBOutlet private weak var ratingView: CosmosView!
  @IBOutlet private weak var reviewsCountLabel: UILabel!
  @IBOutlet private weak var priceLabel: UILabel!
  
  static func nib() -> UINib? {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    bgView.decorator
      .apply(Style.setShadow(opacity: 0.2,
                             color: .black,
                             cornerRadius: 8))
    gradientBottomView.decorator
      .apply(Style.addGradientToCellBottom(topColor: UIColor.white.withAlphaComponent(0),
                                           bottomColor: .black))
  }

  public func configure(with event: EventItem) {
    if let imageLink = event.images?.first?.imageUrl {
      eventImageView.kf.setImage(with: URL(string: imageLink),
                                 options: [.transition(.fade(0.3))])
    }
    eventTitleLabel.text = event.title
    let rating = event.chef?.reviewsAverageRate ?? 0
    ratingView.rating = Double(rating)
    reviewsCountLabel.text = event.chef?.reviewsCount?.string
    let currency = event.schedules?.first?.currency?.symbol ?? ""
    let price = event.schedules?.first?.price?.amount?.string ?? ""
    priceLabel.text = currency + " " + price
  }
}

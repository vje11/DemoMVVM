//
//  DetailListingCell.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit
import Kingfisher

class DetailListingCell: UITableViewCell {

    // MARK:- IBOutlets/Properties
    @IBOutlet private weak var titleLabel: CustomLabel!
    @IBOutlet private weak var userNameLabel: CustomLabel!
    @IBOutlet private weak var descriptionLabel: CustomLabel!
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        setup()
    }

    private func setup() {

        backgroundColor = AppColors.viewTransparentColor
        titleLabel.font = DefaultFonts.titleFont
        titleLabel.numberOfLines = 2
        userNameLabel.font = DefaultFonts.subTitleFont
        descriptionLabel.font = DefaultFonts.descriptionFont
        descriptionLabel.numberOfLines = 2
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.round(radius: Dimensions.cornerRadius)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCellData(with model: PullRequestViewModel?) {
        self.userNameLabel.text = model?.userName.uppercased()
        self.titleLabel.text = model?.title
        if let url = URL.init(string: model?.userImage ?? "") {
            self.userImage.kf.setImage(with: url)
        }

        var descriptionText = ""
        if let createdDate = model?.createdDate, !createdDate.isEmpty() {
            descriptionText = "<b>Created on</b> : \(createdDate.getDateFromString())"
        }
        if let closedDate = model?.closedDate, !closedDate.isEmpty() {
            let nextLine = !descriptionText.isEmpty() ? "\n" : " "
            descriptionText = descriptionText + nextLine + "<b>Closed on</b> : \(closedDate.getDateFromString())"
        }

        descriptionLabel.attributedText = descriptionText.getAttributedText()
    }
}

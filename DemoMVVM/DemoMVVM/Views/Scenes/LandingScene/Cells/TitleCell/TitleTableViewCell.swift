//
//  TitleTableViewCell.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    //MARK:- IBOutlets/Properties
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        backgroundColor = AppColors.viewTransparentColor
        titleLabel.font = DefaultFonts.titleFont
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.round(radius: Dimensions.cornerRadius)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with data: LandingListViewModel){
        titleLabel.text = data.option
    }
}

//
//  CustomLabel.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 14/08/22.
//

import UIKit

/**
 * this class is inherited from uilabel class only but it has the ability to provide default customisation to all the viewcontroller like font, color etc.
 */
class CustomLabel: UILabel {

    /**
     * this provides user to change the color of the label from code as well as nib files
     */
    @IBInspectable var LabelColor: String? {
        willSet {
            if let newColor = UIColor(named: newValue ?? "") {
                self.textColor = newColor
            }
        }
    }

    fileprivate var oldtext: String?

    /**
     * whenever user sets a text for label this text propertiy is overriden to fetch the localised version of the text from the localised string file. this is helps to achieve multilingual behavious of the app
     */
    open override var text: String? {
        willSet {
            oldtext = text
        }

        didSet {
            guard let newText = text else {
                return
            }

            if oldtext != newText {
                self.text = NSLocalizedString(newText, comment: "localised version of the label text")
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        if LabelColor == nil {
            self.textColor = AppColors.defaultTextColor
        }
        self.font = DefaultFonts.small
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if LabelColor == nil {
            self.textColor = AppColors.defaultTextColor
        }
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        if let currentText = text {
            self.text = currentText
        }
    }

}

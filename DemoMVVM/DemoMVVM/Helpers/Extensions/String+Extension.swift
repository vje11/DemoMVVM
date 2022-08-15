//
//  String+Extension.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import Foundation
import UIKit

extension String {
    
    var localized: String {
        return localizedString(lang: "en")
    }
    
    private func localizedString(lang: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    func isEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    func getDateFromString(fromFormat: String = DateFormats.server,
                           toFormat: String = DateFormats.appDefault) -> String {
        let serverReceivedDate = self
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        df.dateFormat = fromFormat
        // this will help to create original date from the string
        let date = df.date(from: serverReceivedDate) ?? Date()

        // this will help to convert original date to the desired date string for the display
        df.dateFormat = toFormat

        return df.string(from: date)
    }

    func getAttributedText(attributedFont font: UIFont = AppFonts.poppinsMedium.withSize(14), defaultFont: UIFont = DefaultFonts.descriptionFont) -> NSMutableAttributedString {
        let localizeString = self.localized  // fetch string
        let regex = try! NSRegularExpression(pattern:"<b>(.*?)</b>", options: [])
        let resultString = NSMutableAttributedString(string: localizeString)
        resultString.setAttributes([NSAttributedString.Key.font: defaultFont], range:  NSRange(location: 0 ,length: localizeString.count))

        // 1. find match of regex in the text and put appropriate
        regex.enumerateMatches(in: localizeString, options: [], range: NSMakeRange(0, localizeString.count)) { result, flags, stop in
            if let range = result?.range {
                //                debugPrint("Start Index : \(range.location), Length : \(range.length)")
                resultString.setAttributes([NSAttributedString.Key.font : font], range: NSRange(location:range.location ,length:range.length - 3))
            }
        }

        let mutableString = resultString.mutableString

        var stringToReplace = "<b>"

        while mutableString.contains(stringToReplace) {
            let rangeOfStringToBeReplaced = mutableString.range(of: stringToReplace)
            resultString.replaceCharacters(in: rangeOfStringToBeReplaced, with: "")
        }

        stringToReplace = "</b>"

        while mutableString.contains(stringToReplace) {
            let rangeOfStringToBeReplaced = mutableString.range(of: stringToReplace)
            resultString.replaceCharacters(in: rangeOfStringToBeReplaced, with: "")
        }

        return resultString
    }
    
}

//
//  JobListCell.swift
//  codesList
//
//  Created by Briant Garza on 12/13/21.
//

import UIKit

class JobListCell: UICollectionViewCell {
    
    @IBOutlet var jobDescription: UILabel!
    @IBOutlet var employerTitle: UILabel!
    @IBOutlet var jobCategoryLabel: UILabel!
    @IBOutlet var jobTitleLabel: UnderlinedLabel!
}



class UnderlinedLabel: UILabel {

    override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSRange(location: 0, length: text.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(.underlineStyle,
                                        value: NSUnderlineStyle.single.rawValue,
                                        range: textRange)
            // Add other attributes if needed
            self.attributedText = attributedText
        }
    }
}

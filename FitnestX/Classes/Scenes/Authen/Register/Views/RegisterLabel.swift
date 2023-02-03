//
//  RegisterLabel.swift
//  FitnestX
//
//  Created by Tiến Ngô on 03/02/2023.
//

import Foundation
import UIKit

struct RegisterLabelURL {
    static let registerLinkAction = "action://register"
}

final class RegisterLabel: TTTAttributedLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        numberOfLines = 0
        
        let linkAttributes: [NSAttributedString.Key: Any] = [
          .font: R.font.poppinsRegular(size: 14)!,
          .foregroundColor: R.color.purpleEEA4CE()!
        ]
        self.linkAttributes = linkAttributes
        self.activeLinkAttributes = linkAttributes
        
        let register = "Register"
        let fullText = String(format: "Don't have an account yet? %@", register)

        let textAttributes: [NSAttributedString.Key: Any] = [
          .font: R.font.poppinsRegular(size: 14)!,
          .foregroundColor: UIColor.black
        ]
        let attributedString = NSAttributedString(string: fullText,
                                                  attributes: textAttributes)
        text = attributedString
        
        let loginLink = URL(string: RegisterLabelURL.registerLinkAction)
        addLink(to: loginLink, with: NSRange(fullText.range(of: register)!, in: fullText))
    }
}

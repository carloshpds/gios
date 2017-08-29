//
//  Style.swift
//  gestta
//
//  Created by Carlos Henrique on 20/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import UIKit
import RSWidgets

struct Style {

    static func setup() {
        let style = Style()
        style.setupNavigationBar()
        style.setupTextField()
    }
    
    fileprivate func setupNavigationBar() {
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = UIColor.gtNavigationBar
        appearance.tintColor = UIColor.gtText
        appearance.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.gtText,
            NSFontAttributeName            : UIFont.title
        ]
        
        appearance.isTranslucent = false
    }
    
    
    fileprivate func setupTextField() {
        let appearance = RSTextField.appearance()
        appearance.font = UIFont.text
        appearance.textColor = UIColor.black
//        appearance.hintColor = UIColor.gtTextHint
//        appearance.lineBottomWidth = 1
//        appearance.borderColor = UIColor.gtTextHint
    }
    
    static func apply(onFormLabels labels: [UILabel]) {
        labels.forEach { (label) in
            label.textColor = UIColor.white
            label.font = UIFont.text
        }
    }
    
    static func apply(onPrimaryButton button: RSButton) {
        button.backgroundColor = UIColor.gtButtons
        button.titleLabel?.font = UIFont.primaryButton
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gtTextHint, for: .highlighted)
        button.cornerRadius = 6
    }

//
}

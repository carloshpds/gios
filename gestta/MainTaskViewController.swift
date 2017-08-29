//
//  MainTaskViewController.swift
//  gestta
//
//  Created by Carlos Henrique on 27/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import UIKit
import RSWidgets
import RSStarterKit

class MainTaskViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCloseKeyboardWhenTapView()
        applyLanguage()
        applyStyle()
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Methods
    fileprivate func applyLanguage () {
        // Apply all localized strings
    }
    
    fileprivate func applyStyle () {
        // Apply color scheme and visual effects
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    /*
    // MARK: - Actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
     */
    
}

/*
//MARK:  - SegueHandlerType
extension MainTaskViewController: SegueHandlerType {
    
    enum SegueIdentifier: String {
        case <# Segue Identifier #>
    }
    
}
*/

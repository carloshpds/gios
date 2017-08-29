//
//  MainViewController.swift
//  gestta
//
//  Created by Carlos Henrique on 27/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import UIKit
import RSWidgets
import RSStarterKit
import ScrollPager

class MainViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollPager: ScrollPager!
    
    @IBOutlet weak var taskViewContainer: UIView!
    
    @IBOutlet weak var dashboardViewContainer: UIView!
    @IBOutlet weak var requestViewContainer: UIView!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCloseKeyboardWhenTapView()
        applyLanguage()
        applyStyle()
        
        setupScrollPager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        
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
    
    fileprivate func setupScrollPager(){
        scrollPager.addSegmentsWithTitlesAndViews(segments: [
            ("Dashboard", dashboardViewContainer),
            ("Tarefas", taskViewContainer),
            ("Solicitações", requestViewContainer)
        ])
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
extension MainViewController: SegueHandlerType {
    
    enum SegueIdentifier: String {
        case <# Segue Identifier #>
    }
    
}
*/

//
//  BaseMenuViewController.swift
//  MyWorkplace
//
//  Created by Mobile Team 2 on 16/10/17.
//  Copyright © 2017 JCI. All rights reserved.
//

import UIKit

class BaseMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Menu_icon"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Home_icon"), style: .plain, target: self, action: #selector(BaseMenuViewController.showDashboard(_:)))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = 250.0
        self.revealViewController().bounceBackOnOverdraw = false
        self.revealViewController().stableDragOnOverdraw = true
    }
    
    @objc func showDashboard(_ sender:UIBarButtonItem!) {
        self.revealViewController().rearViewController.performSegue(withIdentifier: Constants.kViewController_Dashboard, sender: self.revealViewController().rearViewController)
    }
}


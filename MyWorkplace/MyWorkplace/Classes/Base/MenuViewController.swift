//
//  MenuViewController.swift
//  MyWorkplace
//
//  Created by Mobile Team 2 on 16/10/17.
//  Copyright © 2017 JCI. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var menuTableView: UITableView!
    var menuList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuList = ["Dashboard", "Room Booking", "Cafeteria", "Attendance", "Visitor", "Contacts", "Admin", "Logout"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu")!
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        
        cell.textLabel?.text = menuList[indexPath.row]
        cell.textLabel?.textColor = UIColor.menuFontGrey()
        //        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        //        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        //
        //        imgIcon.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        //        lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: Constants.kViewController_Dashboard, sender: self)
        case 1...6:
            self.performSegue(withIdentifier: "RoomBooking", sender: self)
        case 7:
            let storyboard = UIStoryboard(name: Constants.kStoryboard_Login, bundle: nil)
            
            // instantiate your desired ViewController
            let rootViewController = storyboard.instantiateViewController(withIdentifier: Constants.kViewController_Login)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if let window = appDelegate.window {
                window.rootViewController = rootViewController
            }
        default:
            self.performSegue(withIdentifier: Constants.kViewController_Base, sender: self)
        }
        
    }
    
}

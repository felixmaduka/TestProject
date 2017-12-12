//
//  LightingViewController.swift
//  MyWorkplace
//
//  Created by Gayatri Nagarkar on 17/10/17.
//  Copyright © 2017 Gayatri Nagarkar. All rights reserved.
//

import UIKit

class LightingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let reuseIdentifier = "LightingTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LightingTableViewCell
        
        cell.titleLabel.text = "myString"
        
        return cell
        
        
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
//
//        if cell == nil {
//            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
//        }
//
////        let myString : String = indexPath.row
//        cell?.textLabel?.text = "myString"
//        return cell!
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

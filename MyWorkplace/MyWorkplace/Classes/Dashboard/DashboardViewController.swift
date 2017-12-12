//
//  DashboardViewController.swift
//  MyWorkplace
//
//  Created by Gayatri Nagarkar on 16/10/17.
//  Copyright © 2017 Gayatri Nagarkar. All rights reserved.
//

import UIKit
//import FontAwesomeKit_Swift

class DashboardViewController: BaseMenuViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "MenuCollectionViewCell"
    
    var items: [[String:String]] = [[:]]
    let defaultSpacing: CGFloat = 5

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items = [
            [Constants.kTitle:"Attendance", Constants.kIcon:"Attendance"],
            [Constants.kTitle:"Helpdesk", Constants.kIcon:"Helpdesk"],
            [Constants.kTitle:"Contact", Constants.kIcon:"Contacts"],
            [Constants.kTitle:"Room Booking", Constants.kIcon:"RoomBooking"],
            [Constants.kTitle:"Lighting", Constants.kIcon:"Lighting"],
            [Constants.kTitle:"Aircon", Constants.kIcon:"Aircon"]
        ]
        
        // Do any additional setup after loading the view.
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        
        let result = formatter.string(from: date)
        dateLabel.text = result
        
        formatter.dateFormat = "HH:mm"
        
        let resultTime = formatter.string(from: date)
        timeLabel.text = resultTime
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    // MARK: IBAction Methods -
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: Constants.kStoryboard_Login, bundle: nil)
        
        // instantiate your desired ViewController
        let rootViewController = storyboard.instantiateViewController(withIdentifier: Constants.kViewController_Login)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let window = appDelegate.window {
            window.rootViewController = rootViewController
        }
    }
    
    // MARK: - UICollectionViewDataSource methods -
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath)
            as! DashboardMenuCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        let item1 = self.items[indexPath.item]
        
        cell.titleLabel.text = item1[Constants.kTitle]
        cell.iconImageView.image = UIImage(named: item1[Constants.kIcon]!)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate method -
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 4 {
            let storyboard = UIStoryboard(name: Constants.kStoryboard_Lighting, bundle: nil)
            
            // instantiate your desired ViewController
            let viewController = storyboard.instantiateViewController(withIdentifier: Constants.kViewController_Lighting)
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGSize = .zero
        
        let width = (self.view.bounds.size.width - (3 * defaultSpacing))/2
        size = CGSize(width: width, height: width)
        return size;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(self.defaultSpacing, self.defaultSpacing, 0, self.defaultSpacing);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return self.defaultSpacing;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return self.defaultSpacing;
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
}

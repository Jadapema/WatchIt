//
//  MenuViewController.swift
//  WatchIt
//
//  Created by Celina Martinez on 31/1/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import UIKit
import FirebaseAuth

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var separator: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    
    
    var menuElements = ["Home","Action","Adventure","Comedy","Animation","Fantasy","Sci-Fi","Horror","Romance","Thrillers","Anime","Children"]
    var footerElements = ["Sign Out","Version 1.0"]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        DispatchQueue.main.async(execute: {
            let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        })
        
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = 5
        profileImage.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        profileImage.layer.borderWidth = 1
        profileImage.clipsToBounds = true
        profileImage.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @objc func update() {
        let nextCollor = getNextColor()
        UIView.animate(withDuration: 0.5, animations: {
            self.separator.backgroundColor = nextCollor
        })
    }
    
    func getNextColor() -> UIColor {
        let currentColor = self.separator.backgroundColor
        
        if currentColor == UIColor.yellow {
            return UIColor.orange
        } else if currentColor == UIColor.green {
            return UIColor.yellow
        } else if currentColor == UIColor.init(red: 0/255, green: 153/255, blue: 204/255, alpha: 1) {
            return UIColor.red
        } else if currentColor == UIColor.orange {
            return UIColor.init(red: 0/255, green: 153/255, blue: 204/255, alpha: 1)
        } else if currentColor == UIColor.red {
            return UIColor.green
        } else {
            return UIColor.orange
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return menuElements.count
        } else {
            return footerElements.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        cell.selectionStyle = .none
        cell.selectedSign.backgroundColor = UIColor.clear
        cell.categoryName.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        cell.categoryName.textAlignment = .left
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.selectedSign.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            }
            cell.categoryName.text = menuElements[indexPath.row]
            return cell
        } else {
            cell.categoryName.text = footerElements[indexPath.row]
            if indexPath.row == 1  && indexPath.section == 1{
                cell.categoryName.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryName.textAlignment = .center
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard indexPath.section == 0 else {
            if indexPath.row == 0{
                print("salir")
                HandleLogOut()
            }
            return
        }
        
        for c in menuTableView.visibleCells  {
            let cell = c as! MenuTableViewCell
            cell.selectedSign.backgroundColor = UIColor.clear
        }
        
        let color = getNextColor()
        let cell = menuTableView.cellForRow(at: indexPath) as! MenuTableViewCell
        cell.selectedSign.backgroundColor = color
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 2
        } else {
            return 0
        }
    }

    func HandleLogOut () {
        do {
            try FIRAuth.auth()?.signOut()
        } catch let LogoutError {
            print("Error al salir de la sesion \(LogoutError)")
        }
        
        if let LogIn = self.storyboard?.instantiateViewController(withIdentifier: "LogIn")  {
            present(LogIn, animated: true) {
                print("Exito")
            }
        }
    }
    
}

//
//  LogInViewController.swift
//  WatchIt
//
//  Created by Jacob Peralta on 18/9/17.
//  Copyright © 2017 Jadapema. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAuth
import Apollo


class LogInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var ViewOne: UIView!
    @IBOutlet var incorrectLbl: UILabel!
    @IBOutlet var arrobaImg: UIImageView!
    @IBOutlet var keypadImg: UIImageView!
    @IBOutlet var ViewTwo: UIView!
    
    @IBOutlet var ITlbl: UILabel!
    @IBOutlet var loadingView: UIView!
    @IBOutlet var emailTextField: UITextField!
    
    
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
   let apollo = ApolloClient(url: URL(string: "http://54.201.26.159:4000/graphql")!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        emailTextField.delegate = self
        passwordTextfield.delegate = self
        
        incorrectLbl.isHidden = true
        loadingView.isHidden = true
        
        // Set color white arroba Image
        let arroba = UIImage(named: "arroba")
        
        let templateImage = arroba?.withRenderingMode(.alwaysTemplate)
        arrobaImg.image = templateImage
        arrobaImg.tintColor = UIColor.darkGray
        //
        
        // Set color white arroba Image
        let keypad = UIImage(named: "keypad")
        
        let templateImagekeypad = keypad?.withRenderingMode(.alwaysTemplate)
        keypadImg.image = templateImagekeypad
        keypadImg.tintColor = UIColor.darkGray
        //
        
        // Border radius button login
        
        loginButton.layer.cornerRadius = 4
        loginButton.layer.masksToBounds = true
        
        //
        // Border Loading View
        
        loadingView.layer.cornerRadius = 4
        loadingView.layer.masksToBounds = true
        
        //
        // Border  View One
        
        ViewOne.layer.cornerRadius = 4
        ViewOne.layer.masksToBounds = true
        
        //
        // Border Loading Two
        
        ViewTwo.layer.cornerRadius = 4
        ViewTwo.layer.masksToBounds = true
        
        //
        
        
    }

    
        @IBAction func AuthAction(_ sender: UIButton) {
            
            var token : String!
    
            FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextfield.text!, completion: { (user, error) in
                //Check if the User Exist
                if user != nil {
                    //LogIn Sucessfully
                    print(" Log In Sucessfully")
                    
                    FIRAuth.auth()?.currentUser?.getTokenForcingRefresh(true, completion: { (tokenId, error) in
                        token = tokenId!
                    })
                    
                    //Present the SubjectVC
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let MainVC = storyboard.instantiateViewController(withIdentifier: "RVC")
                    self.present(MainVC, animated: true, completion: nil)
                } else {
                    if let myError = error?.localizedDescription {
                        print(myError)
                        self.incorrectLbl.isHidden = false
                        self.incorrectLbl.text = myError
                    } else {
                        print("Error")
                    }
                }
            })
    
    }
    
    
    @objc func update() {
        let nextCollor = getNextColor()
        UIView.animate(withDuration: 0.5, animations: {
            self.ITlbl.textColor = nextCollor
        })
    }
    
    func getNextColor() -> UIColor {
        let currentColor = self.ITlbl.textColor
        
        
        if currentColor == UIColor.yellow {
            return UIColor.orange
        } else if currentColor == UIColor.green {
            return UIColor.yellow
        } else if currentColor == UIColor.init(red: 0, green: 153, blue: 204, alpha: 1) {
            return UIColor.red
        } else if currentColor == UIColor.orange {
            return UIColor.init(red: 0, green: 153, blue: 204, alpha: 1)
        } else if currentColor == UIColor.red {
            return UIColor.green
        } else {
            return UIColor.orange
        }
    }
    
    //Hide Keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        return true
    }

}


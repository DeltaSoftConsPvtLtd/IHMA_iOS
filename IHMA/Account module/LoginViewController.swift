//
//  LoginViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 26/04/21.
//

import UIKit
import Alamofire

class LoginViewController: BaseViewController {

    //MARK:- constraint outlets
    
    @IBOutlet weak var imgTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var secureEntryImage: UIImageView!
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var usernameView: UIView!
    
    @IBOutlet weak var btnSecureEntry: UIButton!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var parameters : [String : Any]?
    var authentication:Authentication?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        constraintSettings()
        self.authentication = Authentication(attachView: self)
    }
    
    
    
    func updateUI() {
        
        
        
        txtUsername.becomeFirstResponder()
        
        loginView.layer.cornerRadius = loginView.bounds.height/2;
        loginView.clipsToBounds  =  true
        loginView.backgroundColor = UIColor.white
        lblTitle.textColor = .white
        txtUsername.addUnderLine()
        txtPassword.addUnderLine()
        
        lblUsername.textColor = .white
        lblPassword.textColor = .white
       
        imgLogo.makeRounded()
        activityIndicator.isHidden = true
        
        txtUsername.delegate = self
        txtPassword.delegate = self
        
        secureEntryImage.image = UIImage(named: "eye")
//        //MARK:- to change image tint color
//        secureEntryImage.image = secureEntryImage.image?.withRenderingMode(.alwaysTemplate)
//        secureEntryImage.tintColor = UIColor.white
    }
    
    //MARK:- update constraint for screen sizes
    func constraintSettings() {
        if UIScreen.main.bounds.height < 850
        {
            imgTopConstraint.constant = 90.0
        }
        else{
            imgTopConstraint.constant = 150.0
        }
    }

    @IBAction func btnRegister(_ sender: Any) {
        let destinationController = RegistrationViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
        self.navigationController?.pushViewController(destinationController!, animated: true)
    }
    @IBAction func btnSecureTextEntry(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
        if (secureEntryImage.image == UIImage(named: "eye")) {
            secureEntryImage.image = UIImage(named: "closingeye")

        } else {
            secureEntryImage.image = UIImage(named: "eye")

        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        //MARK:- Activity Indicator
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        loginView.isUserInteractionEnabled = false
        
        guard let userName = self.txtUsername.text else {return}
        guard let password = self.txtPassword.text else {return}
        authentication!.authenticateUserWith(userName, andPassword: password)
    }

    @IBAction func btnRembrPassword(_ sender: Any) {
        if(UserDefaults.standard.value(forKey: "Username") != nil) {
            self.txtPassword.text = UserDefaults.standard.value(forKey: "password") as! String
        }
         
    }
}

//MARK:- Text field delegate functions
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}





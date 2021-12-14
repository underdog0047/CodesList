//
//  ViewController.swift
//  codesList
//
//  Created by CPSC_Admin01 on 10/21/21.
//

import UIKit

struct User {
    var firstName: String
    var lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var username: String
    var email: String
    var password: String
}


class LoginScreen: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Helper.initBackgroundColor(self.view)
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let enteredUsername = usernameTextField.text
        let enteredPassword = passwordTextField.text
        
        var matchingUsers = Constants.validUsers.filter {name in
            name.username == enteredUsername
        }
        
        guard !matchingUsers.isEmpty else {
            messageLabel.text = "It looks like that username does not match a registered user."
            messageLabel.font = .systemFont(ofSize: 19, weight: .semibold)
            messageLabel.textColor = .red
            
            usernameTextField.text = ""
            passwordTextField.text = ""
            return
        }
        
        matchingUsers = matchingUsers.filter { user in
            user.password == enteredPassword
        }
        
        guard !matchingUsers.isEmpty else {
            messageLabel.text = "It looks like the password is incorrect"
            messageLabel.font = .systemFont(ofSize: 19, weight: .semibold)
            messageLabel.textColor = .red
            
            passwordTextField.text = ""
            return
        }
        
        performSegue(withIdentifier: "userLogin", sender: matchingUsers[0])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier! == "userLogin" {
            guard let user = sender as? User else {return}
            
            Constants.currentUser = user
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            self.dismiss(animated: false, completion: nil)
        }
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        guard let navController = self.navigationController else {return}
//
//        var navigationArray = navController.viewControllers
//        let temp = navigationArray.last
//        navigationArray.removeAll()
//        navigationArray.append(temp!)
//        self.navigationController?.viewControllers = navigationArray
//    }
}


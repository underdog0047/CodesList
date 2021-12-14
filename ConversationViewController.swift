//
//  ConversationViewController.swift
//  codesList
//
//  Created by Briant Garza on 12/13/21.
//

import UIKit

class ConversationViewController: UIViewController {
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var fromLabel: UILabel!
    @IBOutlet var fromText: UILabel!
    @IBOutlet var meLabel: UILabel!
    @IBOutlet var meText: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    var userName: String? = nil
    var messageText: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.initBackgroundColor(self.view)
        
        if userName != nil {
            userLabel.text = userName!
            fromLabel.text = userName!
            fromText.text = messageText!
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        guard let sendText = textField.text else {return}
        
        meLabel.text = Constants.currentUser!.username
        meLabel.isHidden = false
        meText.text = sendText
        meText.isHidden = false
        textField.text = ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

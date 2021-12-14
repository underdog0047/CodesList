//
//  HomeScreen.swift
//  codesList
//
//  Created by Briant Garza on 11/11/21.
//

import UIKit
import SwiftUI


enum PageOptions {
    case search, messages
}



class HomeScreen: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Helper.initBackgroundColor(view)
        
        self.navigationItem.title = "Welcome, \(Constants.currentUser!.fullName)"
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func changeScreen(_ sender: UIBarButtonItem) {
        
    }

}

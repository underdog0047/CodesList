//
//  ProfileViewController.swift
//  codesList
//
//  Created by Briant Garza on 12/13/21.
//

import UIKit


class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var optionsTable: UITableView!
    
    let optionTitles = ["Experience", "Education", "Settings"]
    var optionsData = [
        ["2 yr at Imaginary Company"], ["Swift Certificate"],
        ["Privacy Settings"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.initBackgroundColor(self.view)
        
        usernameLabel.text = Constants.currentUser!.username
        
        optionsTable.delegate = self
        optionsTable.dataSource = self
        optionsTable.sectionHeaderHeight = 35
        optionsTable.backgroundColor = .clear
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), menu: setupAddButtonMenu())
        self.navigationItem.rightBarButtonItem?.customView?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func addTapped(title: String) {
        let alertController = UIAlertController(title: "Add", message: "Enter your \(title):", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "\(title) here..."
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addButton = UIAlertAction(title: "Add", style: .default) { _ in
            guard let skillText = alertController.textFields![0].text else {return}
            
            if title == "Experience" {
                self.optionsData[0].append(skillText)
            } else {
                self.optionsData[1].append(skillText)
            }
            self.optionsTable.reloadData()
        }
        alertController.addAction(cancelButton)
        alertController.addAction(addButton)
        
        present(alertController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return optionsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath)
        cell.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 0.45)
        cell.textLabel?.text = optionsData[indexPath.section][indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return optionTitles[section]
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 35))
            
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = "  \(optionTitles[section])"
        
        if section != 2 {
            label.font = .systemFont(ofSize: 14)
            label.textColor = UIColor(red: 0.325, green: 0.357, blue: 0.388, alpha: 1.0)
        } else {
            label.font = .systemFont(ofSize: 16, weight: .bold)
        }
        
        headerView.addSubview(label)
            
        return headerView
    }
    
    
    // MARK: Support/Helper Functions
    
    private func setupAddButtonMenu() -> UIMenu {
        let educationButton = UIAction(title: "Education") {_ in
            self.addTapped(title: "Education")
        }
        let experienceButton = UIAction(title: "Experience") { _ in
            self.addTapped(title: "Experience")
        }
        
        return UIMenu(title: "Add", children: [experienceButton, educationButton])
    }
}

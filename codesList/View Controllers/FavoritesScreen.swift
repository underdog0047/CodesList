//
//  FavoritesScreen.swift
//  codesList
//
//  Created by Briant Garza on 10/29/21.
//

import UIKit


class FavoritesScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var favoritesTable: UITableView!
    
    var categoryData = ["Python Jobs", "Scripting", "Swift Jobs"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.initBackgroundColor(view)
        
        favoritesTable.dataSource = self
        favoritesTable.delegate = self
        favoritesTable.backgroundColor = .clear
        
        favoritesTable.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        favoritesTable.tableHeaderView = createSection()
    }
    
    
    // Method for adding a new category
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add Category", message: "Enter the category name", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Catoregory name"
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addButton = UIAlertAction(title: "Add", style: .default) { _ in
            guard let categoryName = alertController.textFields![0].text else {return}
            
            self.categoryData.append(categoryName)
            self.favoritesTable.reloadData()
        }
        
        alertController.addAction(cancelButton)
        alertController.addAction(addButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    /*=============================================================================*
     *                            TABLE VIEW FUNCTIONS                             *
     *=============================================================================*/
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 0.4)

        cell.textLabel?.text = self.categoryData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)     // used so row is not continually selected
        
        performSegue(withIdentifier: "favDetail", sender: cell)
    }
    
    
    
    // Sets the tile and background color to match the original one
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            segue.destination.navigationItem.title = cell.textLabel!.text
            Helper.initBackgroundColor(segue.destination.view)
        }
    }
    
    
    // Needed for more flexibility and customization of the sections
    private func createSection() -> UIView {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: favoritesTable.bounds.width, height: 50))
        returnedView.backgroundColor = .clear

        let label = UILabel(frame: CGRect(x: 10, y: 0, width: returnedView.bounds.width, height: returnedView.bounds.height))
        label.text = "Categories"
        label.textColor = .black
        label.textAlignment = .left
        returnedView.addSubview(label)

        return returnedView
    }
}

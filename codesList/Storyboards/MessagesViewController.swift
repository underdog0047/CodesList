//
//  MessagesViewController.swift
//  codesList
//
//  Created by Briant Garza on 12/13/21.
//

import UIKit


struct Message: Decodable {
    let user: String
    let text: String
    // This mainly for future use with collection view
    var partial: String {
        let index1 = text.index(text.startIndex, offsetBy: 0)
        let index2 = text.index(text.startIndex, offsetBy: 10)
        let indexRange = index1...index2
        return String(text[indexRange])
    }
}


class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messageData: [Message] = codesList.load("messages.json")

    @IBOutlet var messagesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.initBackgroundColor(self.view)

        // Do any additional setup after loading the view.
        messagesTable.delegate = self
        messagesTable.dataSource = self
        
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Message", message: "Enter the user's name and message to send", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "User to send to"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Message..."
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addButton = UIAlertAction(title: "Add", style: .default) { _ in
            guard let username = alertController.textFields![0].text, let textMessage = alertController.textFields![1].text else {return}
            
            let message = Message(user: username, text: textMessage)
            
            self.messageData.append(message)
            self.messagesTable.reloadData()
        }
        
        alertController.addAction(cancelButton)
        alertController.addAction(addButton)
        
        present(alertController, animated: true, completion: nil)

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        cell.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 0.4)
        cell.textLabel?.text = messageData[indexPath.row].user
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "message", sender: messageData[indexPath.row])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let message = sender as? Message, let vc = segue.destination as? ConversationViewController else {return}
        
        vc.userName = message.user
        vc.messageText = message.text
    }

}

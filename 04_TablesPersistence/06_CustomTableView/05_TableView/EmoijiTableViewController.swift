//
//  EmoijiTableViewController.swift
//  05_TableView
//
//  Created by 전율 on 2023/12/06.
//

import UIKit

class EmoijiTableViewController: UITableViewController {
    
    var emoji:[Emoiji] = [
    Emoiji(symbol: "🐱", name: "cat", description: "this is cat", usage: "keep cat"),
    Emoiji(symbol: "🐶", name: "dog", description: "this is dog", usage: "keep dog"),
    Emoiji(symbol: "🍎", name: "apple", description: "this is apple", usage: "keep apple")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    @IBAction func editButtonTapped(_ sender: Any) {
        // 테이블을 수정모드(정확히는 반대모드)로 변경
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    // MARK: - Table view data source

    // 테이블 뷰 몇새 만드냐
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 데이터 몇 개 뿌리냐
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emoji.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 재사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = emoji[indexPath.row]
        cell.update(width: emoji)
        // edit 설정 true로 변경 (테이블을 수정할수있냐?)
        cell.showsReorderControl = true
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emoji[indexPath.row]
        print("\(emoji) \(indexPath)")
    }
    */
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveEmoji = emoji.remove(at: sourceIndexPath.row)
        emoji.insert(moveEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    @IBAction func unwindToEmojiTableView(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "saveUnwind", let sourceViewController = unwindSegue.source as? AddEditEmojiTableViewController, let emoji = sourceViewController.emoji else { return }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            self.emoji[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: self.emoji.count, section: 0)
            self.emoji.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emoji.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emoji[indexPath.row]
            let navigationController = segue.destination as! UINavigationController
            // UINavigationController 그치 여기로 연결되는거지
            let addEditEmojiTableviewController = navigationController.topViewController as! AddEditEmojiTableViewController
            
            addEditEmojiTableviewController.emoji = emoji
        }
    }
    
}

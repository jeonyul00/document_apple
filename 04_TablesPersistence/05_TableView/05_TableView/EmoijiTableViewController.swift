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

    // 어떻게 보여주냐
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 재사용 => EmojiCell라는 아이덴티파이어를 가진 셀을 찾는다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        let emoji = emoji[indexPath.row]
        cell.textLabel?.text = "\(emoji.symbol) = \(emoji.name)"
        cell.detailTextLabel?.text = "\(emoji.description)"
        // edit 설정 true로 변경 (테이블을 수정할수있냐?)
        cell.showsReorderControl = true
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emoji[indexPath.row]
        print("\(emoji) \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveEmoji = emoji.remove(at: sourceIndexPath.row)
        emoji.insert(moveEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

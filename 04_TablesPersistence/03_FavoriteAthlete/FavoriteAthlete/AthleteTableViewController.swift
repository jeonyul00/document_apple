import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }
    
    
    // 하나의 뷰 컨트롤러에서 다른 뷰 컨트롤러로 전환하기 전에 데이터를 전달하거나 다른 설정을 할 때 사용됩니다.
    // prepare: 세그웨이가 실행되기 직전에 호출
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let athleteFormViewController = segue.destination as! AthleteFormViewController
        
        if let indexPath = tableView.indexPathForSelectedRow, segue.identifier == PropertyKeys.editAthleteSegue {
            athleteFormViewController.athlete = athletes[indexPath.row]
        }
    }
    
    // 사용자 인터페이스의 한 부분에서 다른 부분으로 돌아가는 메커니즘
    @IBAction func unwindToList(_ unwindSegue:UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! AthleteFormViewController
        guard let athlete = sourceViewController.athlete else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            athletes.remove(at: indexPath.row)
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            athletes.append(athlete)
        }
    }


}

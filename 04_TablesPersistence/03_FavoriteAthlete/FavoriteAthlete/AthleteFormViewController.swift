//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by 전율 on 2023/12/05.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete:Athlete?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBAction func savaButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let age = ageTextField.text, let league = leagueTextField.text, let team = teamTextField.text else { return }
        athlete = Athlete(name: name, age: age, league: league, team: team)
        self.performSegue(withIdentifier: "unwindToList", sender: nil)        
    }
    
    func updateView() -> Void {
        guard let athlete = athlete else { return }
        nameTextField.text = athlete.name
        ageTextField.text = athlete.age
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
    }
    
}

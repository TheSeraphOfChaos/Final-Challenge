//
//  CampaignDetailVIew.swift
//  Final Challenge
//
//  Created by david florczak on 14/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import UIKit

class CampaignDetailView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var receivedCampagn: Campaign!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var myTestingLabel: UILabel!
    @IBOutlet weak var campainImage: UIImageView!
    @IBOutlet weak var charactersTable: UITableView!
    
    override func viewDidLoad() {
        myTestingLabel.text = "Character selection"
        navigationBar.title = receivedCampagn.name
        campainImage.image = UIImage(named: receivedCampagn.cover ?? "")
        
        charactersTable.register(CharacterSelectionTableViewCell.nib(), forCellReuseIdentifier: CharacterSelectionTableViewCell.identifier)
        charactersTable.delegate = self
        charactersTable.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedCampagn.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = charactersTable.dequeueReusableCell(withIdentifier: CharacterSelectionTableViewCell.identifier, for: indexPath) as! CharacterSelectionTableViewCell
        cell.configure(with: receivedCampagn.characters[indexPath.row])
        return cell
    }
    
}

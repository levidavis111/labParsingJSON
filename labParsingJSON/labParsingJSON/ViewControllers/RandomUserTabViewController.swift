//
//  RandomUserTabViewController.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class RandomUserTabViewController: UIViewController {
    
    var randomUsers = [RandomUser]() {
        didSet {
            randomUserTableView.reloadData()
        }
    }

    @IBOutlet weak var randomUserTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RandomUserDetailViewController {
            guard let indexPath = randomUserTableView.indexPathForSelectedRow,
                let randomUserVC = segue.destination as? RandomUserDetailViewController else {return}
            let oneUser = randomUsers[indexPath.row]
            randomUserVC.randomUser = oneUser
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomUserTableView.delegate = self
        randomUserTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "randomUser", ofType: "json") else {
            fatalError("Could Not Find JSON File")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let randomUsersFromJSON = try RandomUser.getRandomUsers(from: data)
            randomUsers = randomUsersFromJSON
        } catch {
            fatalError("\(error)")
        }
    }

}

extension RandomUserTabViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = randomUserTableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        let oneUser = randomUsers[indexPath.row]
//        cell.detailTextLabel?.text = oneUser.phone
        cell.textLabel?.text = "\(oneUser.name.first) \(oneUser.name.last)"
        cell.detailTextLabel?.text = oneUser.phone
        return cell
    }
}

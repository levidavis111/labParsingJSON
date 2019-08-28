//
//  ColorTabViewController.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class ColorTabViewController: UIViewController {
    
    var colorArray = [Color]() {
        didSet {
            colorTableView.reloadData()
        }
    }

    @IBOutlet weak var colorTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.delegate = self
        colorTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ColorTabViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = colorTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let oneColor = colorArray[indexPath.row]
        cell.textLabel?.text = oneColor.name.value
        cell.detailTextLabel?.text = oneColor.hex.clean
        
        
        return cell
    }
    
    
}

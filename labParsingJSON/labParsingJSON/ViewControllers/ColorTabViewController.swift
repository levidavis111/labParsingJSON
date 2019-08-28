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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ColorDetailViewController {
            guard let indexPath = colorTableView.indexPathForSelectedRow,
                let colorVC = segue.destination as? ColorDetailViewController else {return}
            let oneColor = colorArray[indexPath.row]
            colorVC.oneColor = oneColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.delegate = self
        colorTableView.dataSource = self
        loadData()

        // Do any additional setup after loading the view.
    }
    

    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "color", ofType: "json") else {
            fatalError("Could Not Find JSON File")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let colorFromJSON = try Color.getColorData(from: data)
            colorArray = colorFromJSON
        } catch {
            fatalError("\(error)")
        }
    }

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
        cell.backgroundColor = UIColor(red: oneColor.rgb.fraction.r, green: oneColor.rgb.fraction.g, blue: oneColor.rgb.fraction.b, alpha: 1.0)
        
        return cell
    }
    
    
}

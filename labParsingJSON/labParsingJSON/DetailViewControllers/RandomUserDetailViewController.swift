//
//  RandomUserDetailViewController.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class RandomUserDetailViewController: UIViewController {
    
    var randomUser: RandomUser!
    
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var addressLabelOutlet: UILabel!
    @IBOutlet weak var phoneLabelOutlet: UILabel!
    @IBOutlet weak var dobLabelOutlet: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    

    private func setUpView() {
        nameLabelOutlet.text = "\(randomUser.name.first) \(randomUser.name.last)"
        addressLabelOutlet.text = randomUser.location.street
        phoneLabelOutlet.text = randomUser.phone
        dobLabelOutlet.text = randomUser.dob.date
    }

}

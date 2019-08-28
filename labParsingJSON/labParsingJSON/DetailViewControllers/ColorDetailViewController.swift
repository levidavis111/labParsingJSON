//
//  ColorDetailViewController.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var oneColor: Color!

    @IBOutlet weak var rgbLabelOutlet: UILabel!
    @IBOutlet weak var hexLabelOutlet: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    

    private func setUpView() {
        rgbLabelOutlet.text = "R: \(oneColor.rgb.fraction.r) G: \(oneColor.rgb.fraction.g) B: \(oneColor.rgb.fraction.b)"
        hexLabelOutlet.text = "Hex: \(oneColor.hex.clean)"
    }

}

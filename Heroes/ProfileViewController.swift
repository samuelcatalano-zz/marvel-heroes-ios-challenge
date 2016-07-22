//
//  ProfileViewController.swift
//  Heroes
//
//  Created by Samuel D. N. Catalano on 7/21/16.
//  Copyright © 2016 Ginga One. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
}
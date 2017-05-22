//
//  ViewController2.swift
//  Food
//
//  Created by ammar falmban on 5/22/17.
//  Copyright © 2017 ammar falmban. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    // property 
    @IBOutlet weak var laName:UILabel!
    @IBOutlet weak var laDes: UITextView!
    @IBOutlet weak var laImage:UIImageView!
    
    
    //
    var SingleItem:FoodItem?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    laName.text = SingleItem?.Name!
    laDes.text = SingleItem?.Des!
    laImage.image = UIImage(named: (SingleItem?.Image!)!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   // Back Button 
    @IBAction func BackToMainView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}

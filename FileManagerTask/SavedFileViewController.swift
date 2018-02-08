//
//  SavedFileViewController.swift
//  FileManagerTask
//
//  Created by Robert Berry on 2/8/18.
//  Copyright © 2018 Robert Berry. All rights reserved.
//

import UIKit

class SavedFileViewController: UIViewController {
    
    @IBOutlet weak var savedText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Creates userDefault object.
        
        let userDefault = UserDefaults.standard
        
        // Returns userDefault string value using key that was used to store data, and displays that data in savedText. 
        
        savedText.text = userDefault.string(forKey: "stored_String")! 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

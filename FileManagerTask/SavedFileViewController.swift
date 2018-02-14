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

        // fileManager gets the reference to the FileManager
        
        let fileManager = FileManager.default
       
        do {
           
            let documents = try fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
           
            let url = URL(string: "test_document.txt", relativeTo: documents)
           
            if let url = url {
                
                let textFromFile = try String(contentsOf: url)
                
                savedText.text = textFromFile 
            }
        } catch {
            print("Error getting path")
        }
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

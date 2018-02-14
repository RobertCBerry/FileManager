//
//  ViewController.swift
//  FileManagerTask
//
//  Created by Robert Berry on 2/7/18.
//  Copyright © 2018 Robert Berry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var fileContentTextView: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        
        // fileManager gets the reference to the FileManager
        
        let fileManager = FileManager.default
        
        // Retrieves URL to documents directory.
        
        // FileManager.SearchPathDirectory is an enum that specifies the location of a variety of directories.
        
        // FileManager.SearchPathDomainMask specifies the base locations for the SearchPathDirectory type.
        
        do {
            
            let documents = try fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
            
            print(documents)
            
            // Creates file named test_document.txt in the documents directory.
            
            let url = URL(string: "test_document.txt", relativeTo: documents)
            
            // The user will enter text into fileContentTextField, and this is the string content that will be contained in the file test_document.txt. 
            
            let stringToWrite = fileContentTextView.text
            
            if let url = url {
                
                try stringToWrite?.write(to: url, atomically: true, encoding: String.Encoding.utf8)
                
                // This reads the contents of the test_document.txt file.
                
                let textFromFile = try String(contentsOf: url)
            }
        } catch {
            
            print("Error getting path.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Make call to superclass's implementation.
        
        super.prepare(for: segue, sender: sender)
        
        // Downcast to DetailViewController, else return fatalError and provide debug message of where the segue's destination was.
        
        guard let savedFileViewController = segue.destination as? SavedFileViewController else {
            fatalError("Unexpected destination: \(segue.destination).")
        }
        
        guard let showButton = sender as? UIBarButtonItem else {
            fatalError("Unexpected sender: \(String(describing: sender)).")
        }
    }
} 





//
//  ViewController.swift
//  Project1-StormViewer
//
//  Created by Hoe Zhan Hui on 6/19/17.
//  Copyright © 2017 EMech. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]() // () means create one array of type String NOW!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Project 1: Storm Viewer"
        //title will also show as the back button if its length is short enough.
        
        //use let as constant
        
        let fm = FileManager.default
        //data type to work with file system to look for file
        
        let path = Bundle.main.resourcePath!
        //bundle is the dir containing assets
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        //an array of items obtained from the path directory
        
        //set the name item to each object in items during iteration
        for item in items {
            
            //check the item that has prefix 'nssl'
            if item.hasPrefix("nssl") {
                //picture to load
                pictures.append(item)
                
            }
        }
        
        
        print(pictures)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //1. try loading 'Detail' VC and typecasting it to DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            //2. if successful, set its selectedImage property --> name of image
            vc.selectedImage = pictures[indexPath.row]
            
            //3. push into nav controller
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }

}



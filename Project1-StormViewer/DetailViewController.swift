//
//  DetailViewController.swift
//  Project1-StormViewer
//
//  Created by Hoe Zhan Hui on 6/19/17.
//  Copyright © 2017 EMech. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    var selectedImage: String? //name of image is set in tableVC
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTap))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
//    //reset hidesBar... else when I tap 'back' and re-enter DetailVC, bar will remain hidden.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
    func sharedTap() {
//        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//        present(vc, animated: true)
        //show the object item anchored to navigationItem.rightBarButtonItem
        
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
            
            vc.setInitialText("This is a great photo!")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            
            present(vc, animated: true)
        }
    }

}

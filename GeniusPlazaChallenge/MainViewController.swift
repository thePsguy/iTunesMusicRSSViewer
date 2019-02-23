//
//  ViewController.swift
//  GeniusPlazaChallenge
//
//  Created by Pushkar Sharma on 22/02/19.
//  Copyright © 2019 thePsguy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var objects = [RSSMusic]()

    let tableView = UITableView()
    
    let typePicker = UIPickerView()
    let resultCount = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRootViews()
        fetchFeedData()
    }
    
    func setupRootViews() {
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds.applying(CGAffineTransform(scaleX: 1, y: 0.75)).offsetBy(dx: 0, dy: 0.25 * view.bounds.height)
        view.addSubview(tableView)
        
        typePicker.dataSource = self
        typePicker.delegate = self
        typePicker.frame = view.bounds.applying(CGAffineTransform(scaleX: 1, y: 0.125))
        view.addSubview(typePicker)
    }
    
    func fetchFeedData() {
        iTunesClient.sharedInstance().MusicForEndpoint(endpointUrl: iTunesClient.RSSEndpoints.AppleMusic) { (err, objects) in
            if let err = err {
                print(err)
            } else if let objects = objects {
                self.objects = objects
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}


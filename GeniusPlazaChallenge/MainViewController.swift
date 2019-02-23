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
        
        view.addSubview(tableView)
        view.addSubview(typePicker)
        view.addSubview(resultCount)
        setupRootViews()
        fetchFeedData()
    }
    
    override func viewDidLayoutSubviews() {
        setupRootViews()
    }
    
    func setupRootViews() {
        view.backgroundColor = .white
        tableView.register(iTunesTableViewCell.self, forCellReuseIdentifier: iTunesTableViewCell.cellIdentifier)
        tableView.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.5)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds.applying(CGAffineTransform(scaleX: 1, y: 0.75)).offsetBy(dx: 0, dy: 0.25 * view.bounds.height)
        
        
        typePicker.tag = iTunesClient.RSSOptions.MediaType.rawValue
        typePicker.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        typePicker.dataSource = self
        typePicker.delegate = self
        typePicker.frame = view.bounds.applying(CGAffineTransform(scaleX: 0.5, y: 0.25))
        
        
        resultCount.tag = iTunesClient.RSSOptions.MediaCount.rawValue
        resultCount.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.7)
        resultCount.dataSource = self
        resultCount.delegate = self
        resultCount.frame = view.bounds.applying(CGAffineTransform(scaleX: 0.5, y: 0.25)).offsetBy(dx: 0.5*view.bounds.width, dy: 0)
        
    }
    
    func fetchFeedData() {
        let mediaType = typePicker.selectedRow(inComponent: 0)
        let mediaCount = (resultCount.selectedRow(inComponent: 0) + 1) * 2
        var endpoint = ""
        if mediaType == 0 {
            endpoint = iTunesClient.RSSEndpoints.AppleMusic
        } else if mediaType == 1 {
            endpoint = iTunesClient.RSSEndpoints.iTunesMusic
        }
        iTunesClient.sharedInstance().MusicForEndpoint(endpointUrl: endpoint, count: mediaCount) { (err, objects) in
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


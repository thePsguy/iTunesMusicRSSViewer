//
//  MainViewController+UITableViewDelegate.swift
//  GeniusPlazaChallenge
//
//  Created by Pushkar Sharma on 22/02/19.
//  Copyright © 2019 thePsguy. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
//        if let url = self.objects[indexPath.row].itunesUrl {
//            print(url)
//            UIApplication.shared.open(url)
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iTunesTableViewCell.cellIdentifier) as! iTunesTableViewCell
        let obj = self.objects[indexPath.row]
        cell.setup(withObject: obj)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case iTunesClient.RSSOptions.MediaType.rawValue:
            return 2
        case iTunesClient.RSSOptions.MediaCount.rawValue:
            return 10
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       self.fetchFeedData()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case iTunesClient.RSSOptions.MediaType.rawValue:
            if row == 0 {
                return iTunesClient.MediaTypes.AppleMusic
            } else {
                return iTunesClient.MediaTypes.iTunesMusic
            }
        case iTunesClient.RSSOptions.MediaCount.rawValue:
            return "\((row+1)*2)"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

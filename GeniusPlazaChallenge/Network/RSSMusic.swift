//
//  RSSMusic.swift
//  GeniusPlazaChallenge
//
//  Created by Pushkar Sharma on 22/02/19.
//  Copyright © 2019 thePsguy. All rights reserved.
//

import Foundation

struct RSSMusic {
    
    // MARK: Properties
    let id: String?
    let title: String?
    let artist: String?
    let kind: String?
    let albumArt: URL?
    let itunesUrl: URL?
    
    // MARK: Initializers
    
    // construct a RSSMusic object from a dictionary
    init(dictionary: [String:AnyObject]) {
        let keys = iTunesClient.JSONResponseKeys.self
        
        id = dictionary[keys.ID] as? String
        title = dictionary[keys.title] as? String
        artist = dictionary[keys.artist] as? String
        kind = dictionary[keys.kind] as? String
        if let albumArtUrl = dictionary[keys.albumArt] as? String {
            albumArt = URL(string: albumArtUrl)
        } else {
            albumArt = nil
        }
        if let url = dictionary[keys.url] as? String {
            itunesUrl = URL(string: url)
        } else {
            itunesUrl = nil
        }
    }
    
    static func objectsFromResults(results: [[String:AnyObject]]) -> [RSSMusic] {
        
        var objects = [RSSMusic]()
        
        // iterate through array of dictionaries, each object is a dictionary
        for result in results {
            objects.append(RSSMusic(dictionary: result))
        }
        return objects
    }
    
}

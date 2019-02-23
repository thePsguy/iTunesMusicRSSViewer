//
//  iTunesConstants.swift
//  GeniusPlazaChallenge
//
//  Created by Pushkar Sharma on 22/02/19.
//  Copyright © 2019 thePsguy. All rights reserved.
//

import Foundation

extension iTunesClient {
    
    struct Constants {
        static let APIScheme = "https"
        //https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json
        static let APIHost = "rss.itunes.apple.com"
        static let APIPath = "/api/v1/us/"
        
        static let APIKey = "fa09d9190adfbcebb85a952cfd57a1c6"
        static let Secret = "d7eb357bef026863"
        static let BaseUrl = "https://rss.itunes.apple.com/api/v1/us"
        static let setSize = 21
    }
    
    
    // MARK: iTunes Endpoint Values
    struct RSSEndpoints {
        static let AppleMusic = "apple-music/hot-tracks/all/10/explicit.json"
        static let iTunesMusic = "itunes-music/hot-tracks/all/10/explicit.json"
    }
    
    struct MediaTypes {
        static let iTunesMusic = "iTunes Music"
        static let AppleMusic = "Apple Music"
    }
    
    // MARK: iTunes Response Keys
    struct JSONResponseKeys {
        static let feed = "feed"
        static let ID = "id"
        static let feedTitle = "title"
        static let feedCountry = "country"
        static let feedData = "results"
        static let artist = "artistName"
        static let title = "name"
        static let kind = "kind"
        static let albumArt = "artworkUrl100"
        static let url = "url"
    }
}

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
        static let APIHost = "rss.itunes.apple.com"
        static let APIPath = "/api/v1/us/"
    }
    
    
    // MARK: iTunes Endpoint Values
    struct RSSEndpoints {
        static let AppleMusic = "apple-music/hot-tracks/all/"
        static let iTunesMusic = "itunes-music/hot-tracks/all/"
    }
    
    struct MediaTypes {
        static let iTunesMusic = "iTunes Music"
        static let AppleMusic = "Apple Music"
    }
    
    enum RSSOptions: Int {
        case MediaType = 0, MediaCount
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

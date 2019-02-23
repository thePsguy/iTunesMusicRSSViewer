//
//  iTunesClient.swift
//  GeniusPlazaChallenge
//
//  Created by Pushkar Sharma on 22/02/19.
//  Copyright © 2019 thePsguy. All rights reserved.
//

import Foundation

class iTunesClient: NSObject {
    
    var session = URLSession.shared
    
    // MARK: Shared Instance
    class func sharedInstance() -> iTunesClient {
        struct Singleton {
            static var sharedInstance = iTunesClient()
        }
        return Singleton.sharedInstance
    }
    
    // MARK: - GET request
    internal func iTunesUrlFromEndpoint(withPathExtension: String? ) -> URL {
        let components = NSURLComponents()
        components.scheme = Constants.APIScheme
        components.host = Constants.APIHost
        components.path = Constants.APIPath + (withPathExtension ?? "")
        return components.url!
    }
    
}

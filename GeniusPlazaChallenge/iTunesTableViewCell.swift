//
//  iTunesTableViewCell.swift
//  GeniusPlazaChallenge
//
//  Created by Pushkar Sharma on 23/02/19.
//  Copyright © 2019 thePsguy. All rights reserved.
//

import UIKit

class iTunesTableViewCell: UITableViewCell {

    static let cellIdentifier = "iTunesTableViewCellIdentifier"
    let upperRightLabel = UILabel()
    let bottomRightLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
        self.addSubview(upperRightLabel)
        self.addSubview(bottomRightLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = contentView.bounds.height
        let width = contentView.bounds.width
        upperRightLabel.frame = bounds.applying(CGAffineTransform(scaleX: 0.25, y: 0.5)).offsetBy(dx: width*0.75, dy: 0)
        bottomRightLabel.frame = bounds.applying(CGAffineTransform(scaleX: 0.25, y: 0.5)).offsetBy(dx: width*0.75, dy: height*0.5)
        textLabel?.frame = CGRect(x: (textLabel?.frame.minX)!, y: 0, width: (textLabel?.bounds.width)! - upperRightLabel.bounds.width, height: (textLabel?.bounds.height)!)
    }

    func setup(withObject object: RSSMusic) {
        let rgen = CGFloat.random(in: 0...1)
        contentView.backgroundColor = UIColor.init(white: rgen, alpha: 0.15)
        
        self.textLabel?.text = object.title
        self.upperRightLabel.text = object.artist
        self.bottomRightLabel.text = object.kind?.capitalized
        
        
        self.upperRightLabel.textAlignment = .center
        self.upperRightLabel.font = self.upperRightLabel.font.withSize(16)
        self.upperRightLabel.textColor = UIColor.darkGray
        
        self.bottomRightLabel.textAlignment = .center
        self.bottomRightLabel.font = self.bottomRightLabel.font.withSize(12)
        self.bottomRightLabel.textColor = UIColor.lightGray
        
        if let albumArtUrl = object.albumArt {
            let session = URLSession(configuration: .default)
            
            let downloadTask = session.dataTask(with: albumArtUrl) { (data, response, error) in
                if let e = error {
                    print("Error downloading image", e)
                } else {
                    if let _ = response as? HTTPURLResponse {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                self.imageView?.image = image
                                self.layoutSubviews()
                            }
                        }
                    }
                }
            }
            
            downloadTask.resume()
        }
    }
    
}

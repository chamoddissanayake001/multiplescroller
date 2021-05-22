//
//  FirstCollectionViewCell.swift
//  multipleCollectionView
//
//  Created by Lasitha weerasinghe on 5/22/21.
//  Copyright © 2021 Lasitha weerasinghe. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadFrom3(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloadFrom3(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadFrom3(from: url, contentMode: mode)
    }
}



class FirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var im1: UIImageView!
    @IBOutlet weak var ttl: UILabel!
    @IBOutlet weak var cv1Price: UILabel!
    @IBOutlet weak var cv1AddToCart: UIButton!
    
    
    
    func setup(with firstItem: FirstItem){
           
            ttl.text = firstItem.title
//            cv1Price.text = firstItem.price
            im1.downloadFrom3(from:firstItem.image)
           
       }
    
}

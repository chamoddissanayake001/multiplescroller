//
//  SecColViewCell.swift
//  multipleCollectionView
//
//  Created by Lasitha weerasinghe on 5/22/21.
//  Copyright © 2021 Lasitha weerasinghe. All rights reserved.
//

import UIKit

class SecColViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tt2: UILabel!
    
     func setup(with firstItem: FirstItem){
               
                tt2.text = firstItem.title
    //            cv1Price.text = firstItem.price
    //            cv1ImageView.downloadFrom3(from:firstItem.image)
               
           }
        
}

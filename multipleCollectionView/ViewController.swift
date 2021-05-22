//
//  ViewController.swift
//  multipleCollectionView
//
//  Created by Lasitha weerasinghe on 5/22/21.
//  Copyright © 2021 Lasitha weerasinghe. All rights reserved.
//

import UIKit



struct FirstItem: Decodable{
    let title: String
    let price: String
    let image: String
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    var firstItemArr = [FirstItem]()
    
    @IBOutlet weak var cv1: UICollectionView!
    
    @IBOutlet weak var cv2: UICollectionView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            cv1.delegate = self
            cv1.dataSource = self
            
            cv2.delegate = self
            cv2.dataSource = self
                let url = URL(string: "http://13.235.27.22:5000/orders")
                
                URLSession.shared.dataTask(with: url!) { (data, response, error) in
                    if error == nil{
                        do{
                            self.firstItemArr = try JSONDecoder().decode([FirstItem].self, from: data!)
                        }catch{
                            print("Parse Error")
                        }
                        DispatchQueue.main.async {
                            self.cv1.reloadData()
                            self.cv2.reloadData()
                        }
                    }
                }.resume()
               // Do any additional setup after loading the view.
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return firstItemArr.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == self.cv1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
                cell.setup(with: firstItemArr[indexPath.row])
                return cell;
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecColViewCell", for: indexPath) as! SecColViewCell
                               cell.setup(with: firstItemArr[indexPath.row])
                return cell;
            }
        }
        
        
        
       
        
    
    
}

//
//  ViewController.swift
//  Food
//
//  Created by ammar falmban on 5/22/17.
//  Copyright © 2017 ammar falmban. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var CollectionViewList:UICollectionView!
    
    var FoodList = Array<FoodItem>() // define array
    
    // collection view delegate and datasource protocols 
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.laName.text = FoodList[indexPath.row].Name!
        cell.laImage.image = UIImage(named:FoodList[indexPath.row].Image!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: FoodList[indexPath.row])
    }
    
    // passing data 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dis = segue.destination as? ViewController2 {
            if let Food = sender as? FoodItem {
                dis.SingleItem = Food
            }
        }
    }
    
    
    // Reading from plist file 
    
    func ReadFromPlist()
    {
         let path = Bundle.main.path(forResource: "Foods", ofType: "plist")!
         let url = URL(fileURLWithPath: path)
         let data = try! Data(contentsOf: url)
         let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
         let dicArray = plist as! [[String:String]]
        for dic in dicArray {
            FoodList.append(FoodItem(Name: dic["Name"]!, Des: dic["Desc"]!, Image: dic["Image"]!))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CollectionViewList.delegate = self
        CollectionViewList.dataSource = self
        ReadFromPlist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


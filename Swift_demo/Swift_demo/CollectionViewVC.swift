
//
//  CollectionViewVC.swift
//  Swift_demo
//
//  Created by sunxu on 2019/4/30.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class CollectionViewVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    var layout: UICollectionViewFlowLayout?
    
    var collectionView: UICollectionView?
    
    let headerIdentifier = "headView"
    
    let footIdentifier   = "foodView"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 375, height: 812), collectionViewLayout: self.layout!)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.layout?.minimumLineSpacing = 20;
        self.layout?.minimumLineSpacing = 20;
        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.register(CollectionViewCELL.self, forCellWithReuseIdentifier: "cell")
        // 注册headerView
        self.collectionView?.register(CollectionReusableView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        // 注册footView
        self.collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionFooter, withReuseIdentifier: footIdentifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:CollectionViewCELL = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCELL
        cell.contentView.backgroundColor = UIColor.blue
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize(width: (UIScreen.main.bounds.size.width-60)/2.0, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.size.width, height: 50)
    }
    //footer高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: 50, height: 80)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        var v = UICollectionReusableView()
        if kind == UICollectionView.elementKindSectionHeader{
            v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
            v.backgroundColor = UIColor.red
        }else{
            v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footIdentifier, for: indexPath)
            v.backgroundColor = UIColor.gray
        }
        return v
    }
    
    
    
    

}

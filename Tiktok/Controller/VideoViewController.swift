//
//  ViewController.swift
//  Tiktok
//
//  Created by Ripon sk on 09/06/22.
//

import UIKit
import Foundation


class VideoViewController: UIViewController {
var arr = [VideoModel]()
    
    @IBOutlet weak var cv: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = [VideoModel(caption: "Raksha Bandhan", username: "Ripon Sk", audiotrack: "Funny Rakshabandhan", videofilename: "rb",  videoformat: "mp4",images:UIImage(named: "c1")!),VideoModel(caption: "Respect Women", username: "Jhon", audiotrack: "learn how to respect", videofilename: "rb1", videoformat: "mp4",images:UIImage(named: "c2")!),VideoModel(caption: "Funny Video", username: "Ram", audiotrack: "Funny video", videofilename: "rb2", videoformat: "mp4",images:UIImage(named: "c3")!),VideoModel(caption: "Funny Video", username: "Rani", audiotrack: "Funny video", videofilename: "rb3", videoformat: "mp4",images:UIImage(named: "g1")!),VideoModel(caption: "Funny Video", username: "Seema", audiotrack: "Funny video", videofilename: "rb4", videoformat: "mp4",images:UIImage(named: "g2")!)]
    
        cv.delegate = self
        cv.dataSource = self
         // cv.isPagingEnabled = true

    }

    
}
extension VideoViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let model = arr[indexPath.row]
       cell.cofigures(with: model)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.bounds.width
        let h = collectionView.bounds.height
        return CGSize(width: w, height: h)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
        
}

 

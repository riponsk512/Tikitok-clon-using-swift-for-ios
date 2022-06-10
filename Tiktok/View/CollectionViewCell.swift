//
//  CollectionViewCell.swift
//  Tiktok
//
//  Created by Ripon sk on 09/06/22.
//
import AVFoundation
import UIKit
import AVFoundation
class CollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate{
    var model:VideoModel!
  //button
    weak var vc:VideoViewController!
    
    
    @IBOutlet weak var vv: UIVisualEffectView!
    
    @IBOutlet weak var img: UIImageView!
    
   
    
   
    var count = 0;
   
   
    var tap = true
 // label outlets
    @IBOutlet weak var likecount: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var songname: UILabel!
    @IBOutlet weak var proflename: UILabel!
    //buttn outlets
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var commentbtbtn: UIButton!
    @IBOutlet weak var sharebutton: UIButton!
    @IBOutlet weak var download: UIButton!
    @IBOutlet weak var morebtn: UIButton!
    @IBOutlet weak var followbtn: UIButton!
    
    
    var player:AVPlayer!
    func cofigures(with model:VideoModel){
        img.image = model.images
        img.layer.cornerRadius = 50
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        guard let path = Bundle.main.path(forResource: model.videofilename, ofType: model.videoformat) else{
            return
        }
        
        proflename.text = model.username
        songname.text = model.audiotrack
        status.text = model.caption
       
        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        let playerlayer = AVPlayerLayer(player: player)
        playerlayer.frame = contentView.bounds
        playerlayer.videoGravity = .resizeAspectFill
        
        contentView.isUserInteractionEnabled = true
       contentView.layer.addSublayer(playerlayer)
       
        let gesture = UITapGestureRecognizer(target: self, action: #selector(playvideo(sender:)))
        gesture.numberOfTapsRequired = 1
        gesture.delegate = self
        contentView.addGestureRecognizer(gesture)
        player.volume = 1
        player.play()
        bringlabeltofronts()
        bringbuttontofront()
        
       
    }
    // lable bring to front
    func bringlabeltofronts(){
        contentView.bringSubviewToFront(likecount)
        contentView.bringSubviewToFront(status)
        contentView.bringSubviewToFront(proflename)
        contentView.bringSubviewToFront(songname)
        contentView.bringSubviewToFront(vv)
        contentView.bringSubviewToFront(followbtn)
        
    }
    // button bring to the front
    func bringbuttontofront(){
      contentView.bringSubviewToFront(like)
        contentView.bringSubviewToFront(sharebutton)
        contentView.bringSubviewToFront(download)
        contentView.bringSubviewToFront(morebtn)

    }
    @objc func playvideo(sender:UITapGestureRecognizer){
        
        player.pause()
        
        
        
    }
    @IBAction func sharebuttontapp(_ sender: Any) {
        print("share")
    }
    
    // download button
    @IBAction func downloadbuttontap(_ sender: Any) {
        print("download")
    }
    // more button
    @IBAction func morebuttontap(_ sender: Any) {
        print("more")
    }
    
    // like button
       @IBAction func like(_ sender: Any) {
        if tap{
            like.tintColor = .red
          count += 1
          likecount.text = count.description
            tap = false
            
        }
        else{
            like.tintColor = .blue
            count = 0
            likecount.text = count.description
            tap = true
        }
    }
    
    @IBAction func followbuttonpressed(_ sender: Any) {
        if tap{
            followbtn.setTitle("follow", for: .normal)
            tap = false
        }
        else{
            followbtn.setTitle("unfollow", for: .normal)
            tap = true
        }
    }
    
}


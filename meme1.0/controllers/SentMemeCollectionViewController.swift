//
//  SentMemeCollectionViewController.swift
//  meme1.0
//
//  Created by manar AL-Towaim on 14/04/2019.
//  Copyright © 2019 manar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "item"

class SentMemeCollectionViewController: UICollectionViewController {
    
    var myMeme: [Meme]! {
    let object = UIApplication.shared.delegate
    let appDelegate = object as! AppDelegate
    return appDelegate.memes
    }
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
    }

  
    override func viewDidAppear(_ animated: Bool) {
        
        collectionView.reloadData()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myMeme.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SentMemeCollectionViewCell
        
        let meme = self.myMeme[(indexPath as NSIndexPath).row]
        
        cell.memeImage.image = meme.memedImage
    
      
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailedController = self.storyboard?.instantiateViewController(withIdentifier: "DetailMemeViewController") as! DetailMemeViewController
        let meme =  self.myMeme[(indexPath as NSIndexPath).row]
        
        detailedController.detailMeme = meme
        
        self.navigationController?.pushViewController(detailedController, animated: true)
    }
    
    

}

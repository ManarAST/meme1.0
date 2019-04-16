//
//  SentMemeTableViewController.swift
//  meme1.0
//
//  Created by manar AL-Towaim on 14/04/2019.
//  Copyright © 2019 manar. All rights reserved.
//
import Foundation
import UIKit

class SentMemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private let cellIdentifier = "cell"
    
    var myMeme: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView?.reloadData()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMeme.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        let meme = self.myMeme[(indexPath as NSIndexPath).row]
        
        cell.imageView!.image = meme.memedImage
        cell.textLabel!.text = "\(meme.topText) ... \(meme.bottomText)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedController = self.storyboard?.instantiateViewController(withIdentifier: "DetailMemeViewController") as! DetailMemeViewController
        let meme =  self.myMeme[(indexPath as NSIndexPath).row]
        
        detailedController.detailMeme = meme
      
        self.navigationController?.pushViewController(detailedController, animated: true)
    }
    

    

}

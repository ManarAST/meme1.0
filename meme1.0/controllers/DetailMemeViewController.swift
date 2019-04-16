//
//  DetailMemeViewController.swift
//  meme1.0
//
//  Created by manar AL-Towaim on 16/04/2019.
//  Copyright © 2019 manar. All rights reserved.
//

import UIKit

class DetailMemeViewController: UIViewController {
    
    var detailMeme: Meme!
    var topText: String!
    var bottomText: String!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        memeImage.image = detailMeme.memedImage
    }
   
    

    


}

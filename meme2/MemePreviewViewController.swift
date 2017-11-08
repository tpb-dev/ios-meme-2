//
//  MemePreviewViewControlle.swift
//  meme2
//
//  Created by Randall Tom on 11/6/17.
//  Copyright © 2017 tpb-dev. All rights reserved.
//

import Foundation
import UIKit

class MemePreviewViewController: UIViewController {
    var theMeme: Meme!
    
    @IBOutlet var memePreviewView: UIImageView!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memePreviewView.image = theMeme.memedImage!
        memePreviewView.contentMode = .scaleAspectFit
    }
    
}

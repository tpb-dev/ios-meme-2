//
//  MemeCollectionViewController.swift
//  meme2
//
//  Created by Randall Tom on 11/6/17.
//  Copyright © 2017 tpb-dev. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    var memes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
        super.viewWillAppear(animated)
        for tabBarItem in tabBarController!.tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Meme Collection View"
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.item]
        let imageView = UIImageView(image: meme.memedImage)
        imageView.contentMode = .scaleAspectFit
        cell.backgroundView = imageView
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let object = storyboard!.instantiateViewController(withIdentifier: "MemePreviewViewController")
        let memedImageVC = object as! MemePreviewViewController
        memedImageVC.theMeme = memes[indexPath.item]
        navigationController!.pushViewController(memedImageVC, animated: true)
    }
    
}

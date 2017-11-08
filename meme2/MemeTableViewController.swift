//
//  MemeTableViewController.swift
//  meme2
//
//  Created by Randall Tom on 11/6/17.
//  Copyright © 2017 tpb-dev. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        for tabBarItem in tabBarController!.tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Meme Table View"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thisCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath)
        let thisMeme = appDelegate.memes[indexPath.row]
        thisCell.imageView?.image = thisMeme.memedImage
        thisCell.textLabel?.text = thisMeme.topTextField
        thisCell.detailTextLabel?.text = thisMeme.bottomTextField
        
        return thisCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)

        let thisMeme = appDelegate.memes[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memePreviewViewController = storyboard.instantiateViewController(withIdentifier: "MemePreviewViewController") as! MemePreviewViewController
        memePreviewViewController.theMeme = thisMeme
        navigationController!.pushViewController(memePreviewViewController, animated: true)
    }
}

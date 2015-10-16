//
//  ViewController.swift
//  Explore
//
//  Created by Alexander Demchenko on 08/10/15.
//  Copyright © 2015 Alexander Demchenko. All rights reserved.
//

import UIKit

class ViewController: ExploreViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var data = ["Business", "Games", "Finance", "Lifestyle", "Music", "News", "Productivity", "Social Networking", "Entertainment"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? CustomTableViewCell else {
            fatalError("Unexpected cell")
        }
        
        cell.labelTitle.text = data[indexPath.row]
        cell.labelCategory.text = data[indexPath.row]
        cell.buttonDismiss.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) as? CustomTableViewCell else {
            return
        }
        
        insertViewControllerWithIdentifier("DetailViewController", fromStoryboard: storyboard, toTableView: tableView, atIndexPath: indexPath, animateAlongsideTransition: {
            cell.constraintSeparatorLeading.constant = 0
            cell.imageViewAccessory.layer.opacity = 0
            cell.buttonDismiss.layer.opacity = 1
            cell.labelTitle.layer.opacity = 0
            cell.labelCategory.layer.opacity = 1
            cell.backgroundColor = UIColor(red: 248 / 255, green: 248 / 255, blue: 248 / 255, alpha: 1)
            cell.layoutIfNeeded()
            }, completion: {
                cell.buttonDismiss.enabled = true
        })
    }
    
    func dismiss() {
        
        if let cell = exploreSelectedCell as? CustomTableViewCell {
            dismissViewController(animateAlongsideTransition: {
                cell.constraintSeparatorLeading.constant = 20
                cell.imageViewAccessory.layer.opacity = 1
                cell.buttonDismiss.layer.opacity = 0
                cell.labelTitle.layer.opacity = 1
                cell.labelCategory.layer.opacity = 0
                cell.backgroundColor = UIColor.whiteColor()
                cell.layoutIfNeeded()
                }, completion: {
                    cell.buttonDismiss.enabled = false
            })
        }
    }
}
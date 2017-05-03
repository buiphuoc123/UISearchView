//
//  ViewController.swift
//  UISearchController
//
//  Created by Cntt05 on 5/3/17.
//  Copyright © 2017 Cntt05. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var candies = [Candy]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        candies = [
            Candy(category:"Trai cay", name:"chomchom"),
            Candy(category:"Trai cay", name:"dua"),
            Candy(category:"Trai cay", name:"duahau"),
            Candy(category:"Hoa qua", name:"chuoi"),
            Candy(category:"Hoa qua", name:"nho"),
            Candy(category:"Hoa qua", name:"vai"),
            Candy(category:"Hoa qua", name:"xoai")
            
        ]
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let candy = candies[indexPath.row]
        cell.textLabel!.text = candy.name
        cell.detailTextLabel!.text = candy.category
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let candy = candies[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailCandy = candy
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}


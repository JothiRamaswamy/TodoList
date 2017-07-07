//
//  FirstViewController.swift
//  To Do List
//
//  Created by Sambandam, Sujatha {BIS} on 6/24/17.
//  Copyright © 2017 Jothi R. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var table: UITableView!
    
    var items:[String] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return items.count
        
    }
    


    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
        
        override func viewDidAppear(_ animated: Bool){
            
            let itemObject = UserDefaults.standard.object(forKey: "items")
            
            
            if let tempItems = itemObject as? [String]{
                
                items =  tempItems
            
        }
            
            table.reloadData()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            
            
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


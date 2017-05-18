//
//  ViewController.swift
//  NoteTaking
//
//  Created by James Berry on 4/24/17.
//  Copyright © 2017 James Berry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var data:[String] = ["", "", ""]
    var file:String!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    self.title = "Note Taking"
    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(addNote))
    self.navigationItem.rightBarButtonItem = addButton
    self.navigationItem.leftBarButtonItem = editButtonItem
        
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        
        file = docsDir[0].appending("notetaking.txt")
        load()
    }
    
    func addNote() {
        if(table.isEditing){
            return
        }
        
        let name:String = "New Row: \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        save()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
        save()
    }
    
    func save(){
        let newData:NSArray = NSArray(array: data)
        newData.write(toFile: file, atomically: true)
    }
    func load(){
        if let loadedData = NSArray(contentsOfFile:file) as? [String]{
            data = loadedData
            table.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  students
//
//  Created by omair khan on 13/05/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    private let tableView : UITableView = {
        var tableView = UITableView()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    var dataArray = [DataModel]()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        addData()
    }

    override func viewDidLayoutSubviews() {
        tableView.frame = self.view.bounds
    }
    
    func addData() {
        
        // Add Dummy data to the array
        let chad  = DataModel(imageName: "Chad", name: "Chad Cunnin", phone: "+966559595959", email: "chad@yopmai.com")
        let kurti  = DataModel(imageName: "KurtSimmmons", name: "Chad Cunnin", phone: "+966559595959", email: "chad@yopmai.com")
        let stacy  = DataModel(imageName: "StaceyWhite", name: "Chad Cunnin", phone: "+966559595959", email: "chad@yopmai.com")
        
        dataArray.append(chad)
        dataArray.append(kurti)
        dataArray.append(stacy)
       
    }   

}

extension ViewController {
    
    // MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell
        cell.cellData = data
        return cell
    }
    
    // MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dataArray[indexPath.row].name)
    }
    
}


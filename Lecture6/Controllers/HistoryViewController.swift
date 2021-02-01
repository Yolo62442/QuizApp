//
//  HistoryViewController.swift
//  Lecture6
//
//  Created by Zhansaya on 01.02.2021.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var arr = [String?]()
    let cellId = "TableViewCell"
    var delegate: DataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        arr = (delegate?.getHistory())!
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    
    
    func configureTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
    }
    

}
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
        cell.attemptLabel.text = "\(indexPath.row + 1) attempt"
        cell.scoreLabel.text = item
        return cell
    }

}

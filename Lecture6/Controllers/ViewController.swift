//
//  ViewController.swift
//  Lecture6
//
//  Created by Zhansaya on 24.01.2021.
//

import UIKit

protocol DataDelegate{
    func addHistory (history: String?)
    func getHistory () -> [String?]
}


class ViewController: UIViewController  {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var historyButtom: UIButton!
    @IBOutlet weak var footerLabel: UILabel!
    var arr = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func start(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizViewController") as! QuizViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func historyButton(_ sender: Any){
        //send to the HistoryViewController
        let vc = storyboard?.instantiateViewController(identifier: "HistoryViewController") as! HistoryViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
extension ViewController: DataDelegate{
    func addHistory(history: String?) {
        arr.append(history)
    }
    
    func getHistory() -> [String?] {
        return arr
    }
    
}


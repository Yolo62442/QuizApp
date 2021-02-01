//
//  ResultViewController.swift
//  Lecture6
//
//  Created by Zhansaya on 31.01.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var homePageButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    var delegate: QuizViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(delegate?.getScore() ?? 0)%"

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    

    @IBAction func tryAgainAction(_ sender: Any) {
        delegate?.restart()
        navigationController?.popViewController(animated: false)
    }
    @IBAction func homePageAction(_ sender: Any) {
        delegate?.homePage()
        navigationController?.popViewController(animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

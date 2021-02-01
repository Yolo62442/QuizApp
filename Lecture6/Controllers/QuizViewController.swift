//
//  QuizViewController.swift
//  Lecture6
//
//  Created by Zhansaya on 30.01.2021.
//

import UIKit

protocol QuizViewControllerDelegate {
    func restart()
    func homePage()
    func getScore() -> Int?
}

class QuizViewController: UIViewController {
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var questionLabel: UITextView!
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var delegate: DataDelegate?
    var arr = [QuestionItem]()
    var index = 0
    var counter = 0
    var back = false
    override func viewDidLoad() {
        
        super.viewDidLoad()
        prevButton.isHidden = true
       
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if(back){
                navigationController?.popViewController(animated: false)
        }
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        DataConfig()
        questionChange()
    }
    func DataConfig(){
        arr.append(QuestionItem(id: 1, question: "Who is Harry Potter's godfather", awnswers: ["Remus Lupin", "James Potter", "Sirius Black", "Peter Pettigrew"], rightAnswer: 3, clientAnswer: 0))
        arr.append(QuestionItem(id: 2, question: "What position does Harry play on the Quidditch team", awnswers: ["beater", "keeper", "chaser", "seeker"], rightAnswer: 4, clientAnswer: 0))
        arr.append(QuestionItem(id: 3, question: "What is Tom Riddle's middle name", awnswers: ["Marvolo", "Slitherin", "Snake", "Adrian"], rightAnswer: 1, clientAnswer: 0))
        arr.append(QuestionItem(id: 4, question: "What is the name of Hagrid's big dog", awnswers: ["Geralt", "Fang", "Bob", "Roger"], rightAnswer: 2, clientAnswer: 0))
        arr.append(QuestionItem(id: 5, question: "Who was the Hermione's date at the Yule Ball", awnswers: ["Ron", "Fred", "Victor", "Harry"], rightAnswer: 3, clientAnswer: 0))
        arr.append(QuestionItem(id: 6, question: "What is the spell to open the door", awnswers: ["Obliviate", "Alohomora", "Sectumsempra", "Ridiculus"], rightAnswer: 2, clientAnswer: 0))
        arr.append(QuestionItem(id: 7, question: "What is the name of poltergeist that lives at Hogwarts", awnswers: ["Peeves", "Bloody Baron", "Casper", "Holy spirit"], rightAnswer: 1, clientAnswer: 0))
        arr.append(QuestionItem(id: 8, question: "How many siblings does Ron have ", awnswers: ["4", "7", "5", "6"], rightAnswer: 4, clientAnswer: 0))
        arr.append(QuestionItem(id: 9, question: "Who was Half-Blood Prince", awnswers: ["Remus Lupin", "Harry Potter", "Severus Snape", "Lord Voldemort"], rightAnswer: 3, clientAnswer: 0))
        arr.append(QuestionItem(id: 10, question: "After all this time", awnswers: ["Never", "Always", "Of course", "Yes"], rightAnswer: 2, clientAnswer: 0))
        
    }
    
    @IBAction func answer1Action(_ sender: Any) {
        changeColor(num: 1)
        arr[index].clientAnswer = 1
    }
    
    @IBAction func answer2Action(_ sender: Any) {
        changeColor(num: 2)
        arr[index].clientAnswer = 2
    }
    @IBAction func answer3Action(_ sender: Any) {
        changeColor(num: 3)
        arr[index].clientAnswer = 3
    }
    @IBAction func answer4Action(_ sender: Any) {
        changeColor(num: 4)
        arr[index].clientAnswer = 4
    }
    
    @IBAction func prevAction(_ sender: Any) {
        if (index == 9){
                    nextButton.setTitle("Next", for: .normal)
                }
        index -= 1
        questionChange()
        if(arr[index].clientAnswer != 0){
            changeColor(num: arr[index].clientAnswer)
        }
        
    }
    @IBAction func nextAction(_ sender: Any) {
        if(index == 9){
            delegate?.addHistory(history: ("\(counter)/10"))
            let vc = storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: false)
            return
        }
        if (index == 0){
            prevButton.isHidden = false
        }
        index += 1
        questionChange()
        if(arr[index].clientAnswer != 0){
                    changeColor(num: arr[index].clientAnswer)
                }
        
    }

    func ableButtons(ans: Bool) {
        answer1Button.isEnabled = ans
        answer2Button.isEnabled = ans
        answer3Button.isEnabled = ans
        answer4Button.isEnabled = ans
    }
    func questionChange(){
        numLabel.text = ("\((arr[index].id) ?? 0)/10")
        ableButtons(ans: true)
        questionLabel.text = arr[index].question
        answer1Button.setTitle(arr[index].awnswers[0], for: .normal)
        answer1Button.backgroundColor = UIColor.blue
        answer2Button.setTitle(arr[index].awnswers[1], for: .normal)
        answer2Button.backgroundColor = UIColor.blue
        answer3Button.setTitle(arr[index].awnswers[2], for: .normal)
        answer3Button.backgroundColor = UIColor.blue
        answer4Button.setTitle(arr[index].awnswers[3], for: .normal)
        answer4Button.backgroundColor = UIColor.blue
        if(index == 9) {
            nextButton.setTitle("Results", for: .normal)
        }else if(index == 0){
            prevButton.isHidden = true
        }
    
    }
    func checkAnswer(num: Int?) -> Bool{
        if(arr[index].rightAnswer == num){
            counter += 1
            return true
        }
        return false
    }
    func changeColor(num: Int?){
        var color: UIColor
        if (checkAnswer(num: num)) {
            color = UIColor.green
        }else{
            color = UIColor.red
        }
        switch num{
        case 1:
            answer1Button.backgroundColor = color
        case 2:
            answer2Button.backgroundColor = color
        case 3:
            answer3Button.backgroundColor = color
        case 4:
            answer4Button.backgroundColor = color
        default:
            break
        }
        ableButtons(ans: false)
    }

}
extension QuizViewController: QuizViewControllerDelegate{
    func getScore() -> Int? {
        return counter*10
    }
    
    func restart() {
        arr.removeAll()
        nextButton.setTitle("Next", for: .normal)
        DataConfig()
        counter = 0
        index = 0
    }
    
    func homePage() {
        back = true
    }
    
    
}

//
//  ResultViewController.swift
//  ResultViewController
//
//  Created by Shubham Behal on 22/10/21.
//

import UIKit

class ResultViewController: UIViewController {
    var correctCount = 0
    @IBOutlet weak var btnRetake: UIButton!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelScore.text = "\(correctCount) / 5"
        labelMessage.text = getMessageBasedOfScore(score: correctCount)
    }
    
    func getMessageBasedOfScore(score : Int)-> String{
        switch score {
        case 3:
            return "Good job!"
        case 4:
            return "Excellent work!"
        case 5:
            return "You are a genius!"
        default:
            btnRetake.isHidden = false
            return "Please try again!"
        }
        
    }
    @IBAction func onRetake(_ sender: Any) {
        performSegue(withIdentifier: "retakeTest", sender: self)
    }
    
}

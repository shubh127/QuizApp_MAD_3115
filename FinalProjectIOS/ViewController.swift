//
//  ViewController.swift
//  FinalProjectIOS
//
//  Created by Shubham Behal on 22/10/21.
//

import UIKit

class ViewController: UIViewController {
    var allQuestions: [Question] = [Question]()
    var questions: [Question] = [Question]()
    var questionCount = 1
    var correctCount = 0
    
    @IBOutlet weak var btnOption4: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var labelHead: UILabel!
    @IBOutlet weak var labelOption4: UILabel!
    @IBOutlet weak var labelOption3: UILabel!
    @IBOutlet weak var labelOption2: UILabel!
    @IBOutlet weak var labelOption1: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateQuestionsList()
        prepareQuestionListForQuiz()
        drawUi()
    }
    
    func populateQuestionsList(){
        allQuestions = [
            Question(statement: "How can you check your current git version?",
                     options: ["git --v", "git --version", "git --option", "git --current"],
                     correctOptionIndex: 1),
            Question(statement: "Which of the following is true you when you use the following command?\n\ngit add -A",
                     options: ["All new and updated files are staged", "Files are staged in alphabetical order", "All new files are staged", "Only updated files are staged"],
                     correctOptionIndex: 0),
            Question(statement: "What will the following command print to the Terminal?\n\ngit remote -v",
                     options: ["A list of remote repositories and their URLs", "The current git version you're running", "An inline editor for modifying remote repositories", "The last 5 git versions you've installed"],
                     correctOptionIndex: 0),
            Question(statement: "What does the following command do to the git repository?\n\ngit reset --soft HEAD^",
                     options: ["It deletes all previous commits and reset the repository history back to its initial state.", "It resets the working branch to the first commit.", "It keeps the HEAD at the current commit, but clears all previous commits.", " It sets HEAD to the previous commit and leaves changes from the undone commit in the stage/index."],
                     correctOptionIndex: 3),
            Question(statement: "You find a bug in your project, but can't locate where it was introduced in the commit history. How would you diagnose this problem?",
                     options: ["Manually backtrack through your commit history.", " Use git search -diff to compare all commits in your repository history.", " Run a git rebase to find the buggy commit.", "Use git bisect to compare the buggy commit to an early commit that works as expected."],
                     correctOptionIndex: 3),
            Question(statement: "Why would you use a pre-receive hook in your remote repository?",
                     options: ["You wouldn't, you would use it in the local repository", "To execute a script when a remote receives a push that is triggered before any refs are updated", "To delete the last 10 commits and reset the HEAD", "In order to locally cache the last 10 commits"],
                     correctOptionIndex: 1),
            Question(statement: "What option can you use to apply git configurations across your entire git environment?",
                     options: ["--all", "--master", "--global", "--update"],
                     correctOptionIndex: 0    ),
            Question(statement: "How could you squash multiple commits together without using git merge --squash?",
                     options: ["Caching", "You can't. git merge --squash is the only git command for that operation.", "Rebasing", "Reflogging"],
                     correctOptionIndex: 2),
            Question(statement: "Where are files stored before they are committed to the local repository?",
                     options: ["Saved files", "git documents", "Staging area", "git cache"],
                     correctOptionIndex: 2),
            Question(statement: "How would you create a custom shortcut or command across your git environment?",
                     options: ["Run git hotfix with the shortcut name.", "Assign a shortcut or command using git options file.", "Use the git custom-key command.", "Create an alias in the git config file."],
                     correctOptionIndex: 3),
        ]
    }
    
    func prepareQuestionListForQuiz(){
        for n in 1...5 {
            let randomInt = Int.random(in: 0..<allQuestions.count-n)
            questions.append(allQuestions[randomInt])
            allQuestions.remove(at: randomInt)
        }
        
    }
    
    func drawUi(){
        btnSubmit.isHidden = true
        labelHead.text = "Question \(questionCount) / 5"
        labelQuestion.text = questions[questionCount-1].statement
        labelOption1.text = questions[questionCount-1].options[0]
        labelOption2.text = questions[questionCount-1].options[1]
        labelOption3.text = questions[questionCount-1].options[2]
        labelOption4.text = questions[questionCount-1].options[3]
        if(questionCount == 5){
            btnSubmit.setTitle("Submit", for: .normal)
        }
    }
    
    
    @IBAction func onOption1Selected(_ sender: Any) {
        handleOptionSelected(selectedOptionNumber : 1)
    }
    
    @IBAction func onOption2Selected(_ sender: Any) {
        handleOptionSelected(selectedOptionNumber : 2)
    }
    
    @IBAction func onOption3Selected(_ sender: Any) {
        handleOptionSelected(selectedOptionNumber : 3)
    }
    @IBAction func onOption4Selected(_ sender: Any) {
        handleOptionSelected(selectedOptionNumber : 4)
    }
    
    func handleOptionSelected(selectedOptionNumber : Int){
        resetOptions()
        if(selectedOptionNumber == 1){
            btnOption1.isSelected = true
        }else if(selectedOptionNumber == 2){
            btnOption2.isSelected = true
        }else if(selectedOptionNumber == 3){
            btnOption3.isSelected = true
        }else{
            btnOption4.isSelected = true
        }
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        checkAnswer()
        questionCount = questionCount + 1
        resetOptions()
        if(questionCount <= 5){
            drawUi()
        }else{
            showFinalResult()
        }
    }
    
    func checkAnswer(){
        if(btnOption1.isSelected && questions[questionCount-1].correctOptionIndex==0){
            correctCount =  correctCount + 1
        }else if (btnOption2.isSelected && questions[questionCount-1].correctOptionIndex==1){
            correctCount =  correctCount + 1
        }else if (btnOption3.isSelected && questions[questionCount-1].correctOptionIndex==2){
            correctCount =  correctCount + 1
        }else if (btnOption4.isSelected && questions[questionCount-1].correctOptionIndex==3){
            correctCount =  correctCount + 1
        }
    }
    
    func resetOptions(){
        btnSubmit.isHidden = false
        btnOption1.isSelected = false
        btnOption2.isSelected = false
        btnOption3.isSelected = false
        btnOption4.isSelected = false
    }
    
    func showFinalResult(){
        performSegue(withIdentifier: "showResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ResultViewController
        vc?.correctCount = self.correctCount
    }
}


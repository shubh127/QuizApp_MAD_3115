//
//  Question.swift
//  Question
//
//  Created by Shubham Behal on 22/10/21.
//

import Foundation
class Question {
    var statement: String
    var options: [String]
    var correctOptionIndex: Int
    
    init(statement: String, options: [String], correctOptionIndex: Int) {
        self.statement = statement
        self.options = options
        self.correctOptionIndex = correctOptionIndex
    }
    
    func isCorrect(_ selectedIndex: Int) -> Bool {
        return correctOptionIndex == selectedIndex
    }
}

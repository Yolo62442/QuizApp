//
//  QuestionItems.swift
//  Lecture6
//
//  Created by Zhansaya on 30.01.2021.
//

import Foundation
public struct QuestionItem: Codable{
    let id: Int?
    let question: String?
    let awnswers: [String?]
    let rightAnswer: Int?
    var clientAnswer: Int?
    
}

//
//  Comment.swift
//  WordPressComment
//
//  Created by omur olgunay on 18.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

public struct Comment: Codable {
//     JSON Response
//    "comment_ID": "93",
//    "comment_content": "psikoloji KPSS ne zaman bu sene var mı varsa hangi dersler var iyi günler",
//    "comment_date": "2019-04-20 18:31:11",
//    "comment_author": "nezir",
    
    public let comment_ID: String
    public let comment_content: String
    public let comment_date: String
    public let comment_author: String
    
    public enum CodingKeys: String, CodingKey {
        case comment_ID
        case comment_content
        case comment_date
        case comment_author
    }
}

//
//  IssueModel.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 20/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation

protocol Issue {
    typealias Result = Swift.Result<IssueModel, HttpError>
    func get(issueMode: IssueModel, completion: @escaping (Result) -> Void)
}

struct IssueModel: Model{
    let html_url: String
    let title: String
    let state: String
    let body: String
    let user: UserModel
}

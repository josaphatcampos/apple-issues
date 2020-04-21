//
//  IssueModel.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 20/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation

//protocol Issue {
//    typealias Result = Swift.Result<IssueModel, HttpError>
//    func get(issueMode: IssueModel, completion: @escaping (Result) -> Void)
//}

struct IssueModel: Model{
    let html_url: String
    let title: String
    let state: String
    let body: String
    let created_at: String
    let user: UserModel
}

extension IssueModel{
    func getCreateStringDate() -> String{
        if !(self.created_at.isEmpty || self.created_at == nil){
            return UtilityHelper.convertDateToString(self.created_at, formatFrom: "yyyy-MM-dd'T'HH:mm:ssZ", formatTo: "dd/MM/yyyy")
        }
        
        return "--"
    }
}

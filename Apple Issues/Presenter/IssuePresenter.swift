//
//  IssuePresenter.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 21/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation

class IssuePresenter{
    weak fileprivate var issueView: IssueProtocol?
    private var issue:IssueModel
    private var issueRouter:IssueRouter = IssueRouter()
    
    init(issue:IssueModel) {
        self.issue = issue
    }
    
    func setView(_ issueView:IssueProtocol){
        self.issueView = issueView
    }
    
    func viewConfigure(){
        issueView?.setTitle(title: issue.title)
        issueView?.setDate(date: issue.getCreateStringDate())
        issueView?.setAvatar(avatar: issue.user.avatar_url)
        issueView?.setBody(body: issue.body)
    }
    
    func issueVisiteUrl(){
        issueRouter.urlIssueVisit(html_url: issue.html_url)
    }
    
    
}

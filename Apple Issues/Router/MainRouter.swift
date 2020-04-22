//
//  MainRouter.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 21/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation
import UIKit

class MainRouter{
    private var view:MainViewController
    
    init(view:MainViewController) {
        self.view = view
    }
    
    func toIssue(issue: IssueModel){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let issueViewController = storyBoard.instantiateViewController(withIdentifier: "Issue") as! IssueViewController
        issueViewController.presenter = IssuePresenter(issue: issue)
        self.view.navigationController?.pushViewController(issueViewController, animated: true)
    }
}

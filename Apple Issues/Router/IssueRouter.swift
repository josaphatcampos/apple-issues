//
//  IssueRouter.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 21/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation
import UIKit

class IssueRouter{
    
    init() {
        
    }
    
    func urlIssueVisit(html_url:String){
        if let url = URL(string: html_url) {
            UIApplication.shared.open(url)
        }
    }
}

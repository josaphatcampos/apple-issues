//
//  IssueViewController.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 21/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import UIKit
import Kingfisher

protocol IssueProtocol:AnyObject {
    func setAvatar(avatar:String)
    func setTitle(title:String)
    func setDate(date:String)
    func setBody(body:String)
}

class IssueViewController: UIViewController {
    
    var presenter: IssuePresenter?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    @IBAction func goToUrlIssueButton(_ sender: Any) {
        presenter?.issueVisiteUrl()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.setView(self)
        
        presenter?.viewConfigure()
    }
}

extension IssueViewController: IssueProtocol{
    func setAvatar(avatar:String) {
        self.avatarImageView.kf.indicatorType = .activity
        self.avatarImageView.kf.setImage(with: URL(string: avatar), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
    
    func setTitle(title:String) {
         self.titleLabel.text = title
    }
    
    func setDate(date:String) {
         self.dateLabel.text = date
    }
    
    func setBody(body:String) {
        self.bodyTextView.text = body
    }
    
    
}

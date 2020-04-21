//
//  ViewController.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 20/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import UIKit

protocol MainViewProtocol:AnyObject {
    var isReady:Bool {get set}
    func showLoading()
    func hideLoading()
    func set(_ issues: [IssueModel])
    func appendData(_ issues: [IssueModel])
    func showEmptyView()
    func showAlert(title:String, message:String)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    fileprivate let service = AdapterService()
    fileprivate let mainPresenter = MainPresenter()
    fileprivate var dataSource = [IssueModel](){
        didSet{
            if let tableView = tableView {
                tableView.reloadData()
            }
        }
    }
    fileprivate var page = 1
    var isReady = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainPresenter.setView(self)
        mainPresenter.getIssues(service: service)
    }


}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        cell.title?.text = dataSource[indexPath.row].title
        cell.state?.text =  dataSource[indexPath.row].state
        cell.state?.textColor = .systemGreen
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1 && isReady{
            page += 1
            mainPresenter.getIssues(page: "\(page)", service: service)
        }
    }
    
}

extension MainViewController: MainViewProtocol{
    func showLoading() {
        self.indicator.startAnimating()
    }
    
    func hideLoading() {
        self.indicator.stopAnimating()
    }
    
    func set(_ issues: [IssueModel]) {
        dataSource = issues
    }
    
    func appendData(_ issues: [IssueModel]){
        dataSource.append(contentsOf: issues)
    }
    
    func showEmptyView() {
        
    }
    
    func showAlert(title:String, message:String){
        presentAlert(withTitle: title, message: message)
    }
}


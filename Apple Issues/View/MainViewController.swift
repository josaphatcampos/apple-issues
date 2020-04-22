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
    func reloadData()
    func showAlert(title:String, message:String)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    fileprivate let service = AdapterService()
    fileprivate let mainPresenter = MainPresenter()
    private var page = 1
    var isReady = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainPresenter.setView(self)
        mainPresenter.getIssues(service: service)
    }
    
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainPresenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        cell.title?.text = mainPresenter.dataSource[indexPath.row].title
        cell.state?.text =  mainPresenter.dataSource[indexPath.row].state
        cell.state?.textColor = mainPresenter.dataSource[indexPath.row].state == "open" ? .systemGreen : .red
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == mainPresenter.dataSource.count - 1 && isReady{
            page += 1
            mainPresenter.getIssues(page: "\(page)", service: service)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainPresenter.goToIssue(index: indexPath.row)
    }
    
}

extension MainViewController: MainViewProtocol{
    func showLoading() {
        self.indicator.startAnimating()
    }
    
    func hideLoading() {
        self.indicator.stopAnimating()
    }
    
    func reloadData(){
        tableView.reloadData()
    }
    
    func showAlert(title:String, message:String){
        presentAlert(withTitle: title, message: message)
    }
}


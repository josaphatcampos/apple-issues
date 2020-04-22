//
//  MainPresenter.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 20/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation
//import UIKit

class MainPresenter {
    
    weak fileprivate var mainView: MainViewProtocol?
    private var mainRouter:MainRouter?
    
    var dataSource = [IssueModel](){
        didSet{
            mainView?.reloadData()
        }
    }
    
    func goToIssue(index:Int){
        mainRouter = MainRouter(view: mainView as! MainViewController)
        mainRouter?.toIssue(issue: dataSource[index])
    }
    
    func setView(_ mainView:MainViewProtocol){
        self.mainView = mainView
    }
    
    func getIssues(page:String = "1", service: AdapterService){
        mainView?.showLoading()
        mainView?.isReady = false
        
        service.get(page: page){  [weak self] result in
            guard self != nil else { return }
            
            switch result {
                case .success(let data):
                    if data == nil {
                        self!.mainView?.showAlert(title: "Atenção", message: "Não existem mais dados para carregar!")
                    }else{
                        self?.appendData((data?.toModel())!)
                        self!.mainView?.isReady = true
                    }
                    self!.mainView?.hideLoading()
                case .failure( _):
                    self!.mainView?.showAlert(title: "Erro", message: "Erro ao carregar a lista de Issues")
                    self!.mainView?.hideLoading()
            }
        }
    }
        
    private func appendData(_ issues: [IssueModel]){
        dataSource.append(contentsOf: issues)
    }
    
    
}

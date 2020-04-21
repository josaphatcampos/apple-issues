//
//  MainPresenter.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 20/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter {
    
    weak fileprivate var mainView: MainViewProtocol?
    
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
                        if(page != "1"){
                            self?.mainView?.appendData((data?.toModel())!)
                        }else{
                            self?.mainView?.set((data?.toModel())!)
                        }
                        self!.mainView?.isReady = true
                    }
                    self!.mainView?.hideLoading()
                case .failure( _):
                    self!.mainView?.showAlert(title: "Erro", message: "Erro ao carregar a lista de Issues")
                    self!.mainView?.hideLoading()
            }
        }
    }
    
}

//
//  ApiIssuesService.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 20/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation
import Alamofire

class AdapterService{
    var session: Session!
    let base:String = "https://api.github.com/repos/apple/swift/issues"
    
    init(session:Session = .default){
        self.session = session
    }
    
    func get(page:String = "1", completion: @escaping(Result<Data?, HttpError>)->Void){
        let url = URL(string: base+"?page=\(page)")!
        
        session.request(url, method:.get, parameters: nil).responseData{
            dataResponse in
                
            guard let statusCode = dataResponse.response?.statusCode else { return completion(.failure(.noConnectivity))}
            
            switch dataResponse.result {
                case .failure: completion(.failure(.noConnectivity))
                case .success(let data):
                    switch statusCode {
                        case 204:
                            completion(.success(nil))
                        case 200...299:
                            completion(.success(data))
                        case 401:
                            completion(.failure(.unauthorized))
                        case 403:
                            completion(.failure(.forbidden))
                        case 400...499:
                            completion(.failure(.badRequest))
                        case 500...599:
                            completion(.failure(.serverError))
                        default:
                            completion(.failure(.noConnectivity))
                }
            }
        }
    }
}

//
//  IssueModelTests.swift
//  Apple IssuesTests
//
//  Created by Josaphat Campos Pereira on 22/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation

import Quick
import Nimble

import Alamofire

@testable import Apple_Issues

class AppleIssuesSpec: QuickSpec {
    
    override func spec(){
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: configuration)
        let service = AdapterService(session: session)
        
        describe("Get Issues"){
            context("Call url", closure: {
                it("Should complete with error when request completes with error"){
                    UrlProtocolStub.simulate(data: nil, error: .noConnectivity)
                    DispatchQueue.main.async {
                        service.get { (result) in
                            switch result{
                                case .success(_):
                                break
                                case .failure( _):
                                break
                            }
                        }
                    }
                    expect(UrlProtocolStub.data).toEventually(beNil())
                    expect(UrlProtocolStub.error).toEventually(equal(.noConnectivity))
                }
                
                it("Should complete with error on all invalid cases"){
                    UrlProtocolStub.simulate(data: nil, error: nil)
                    DispatchQueue.main.async {
                        service.get { (result) in
                            switch result{
                                case .success(_):
                                    break
                                case .failure( _):
                                    break
                            }
                        }
                    }
                    expect(UrlProtocolStub.data).toEventually(beNil())
                    expect(UrlProtocolStub.error).toEventually(beNil())
                }
                
                it("Should complete with success when request completes with data"){
                    let simulateData = makeValidResponseData()
                    UrlProtocolStub.simulate(data: simulateData, error: nil)
                    DispatchQueue.main.async {
                        service.get { (result) in
                            switch result{
                                case .success(_):
                                    break
                                case .failure( _):
                                    break
                            }
                        }
                    }
                    expect(UrlProtocolStub.data).toEventually(equal(simulateData))
                    expect(UrlProtocolStub.error).toEventually(beNil())
                }
            })
        }
    }
}



class UrlProtocolStub: URLProtocol{
    
//    static var emit: ((URLRequest)-> Void)?
    static var data: Data?
    static var error:HttpError?
    
//    static func observeRequest(completion: @escaping (URLRequest) -> Void){
//        UrlProtocolStub.emit = completion
//    }
    
    static func simulate(data:Data?, error: HttpError?){
        UrlProtocolStub.data = data
        UrlProtocolStub.error = error
    }
    
    open class override func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
//        UrlProtocolStub.emit?(request)
        if let data = UrlProtocolStub.data{
            client?.urlProtocol(self, didLoad: data)
        }
        if let error = UrlProtocolStub.error{
            client?.urlProtocol(self, didFailWithError: error)
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {}
}

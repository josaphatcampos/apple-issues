//
//  TestFactory.swift
//  Apple IssuesTests
//
//  Created by Josaphat Campos Pereira on 22/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation

func makeValidResponseData() -> Data {
    return Data("[{\"html_url\":\"h\",\"title\":\"[AutoDiff] Support property wrapper differentiation.\",\"user\":{\"avatar_url\":\"h\"},\"state\":\"open\",\"created_at\":\"2020-04-21T05:03:19Z\",\"body\":\"1234556\"}]".utf8)
}

func makeInvalidResponseData() -> Data{
    return Data("Invalid Data".utf8)
}

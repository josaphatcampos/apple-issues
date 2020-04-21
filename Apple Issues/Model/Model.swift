//
//  Model.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 20/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation

protocol Model: Codable {}
    
extension Model{
    func toData() -> Data?{
        return try? JSONEncoder().encode(self)
    }
    
    func toJson() -> [String: Any]?{
        guard let data = self.toData() else { return nil}
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}

//
//  UtilityHelper.swift
//  Apple Issues
//
//  Created by Josaphat Campos Pereira on 21/04/20.
//  Copyright © 2020 Josaphat Campos Pereira. All rights reserved.
//

import Foundation

class UtilityHelper{
    class func convertDateToString(_ date: String, formatFrom: String, formatTo: String) -> String {
        let dateString: String = date
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = formatFrom
        
        var dateFromString: Date
        dateFromString = dateFormatter.date(from: dateString)!
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = formatTo
        
        formatter.timeZone = TimeZone(identifier: "...")
        let stringDate: String = formatter.string(from: dateFromString)
        
        return stringDate
    }
}

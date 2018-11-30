//
//  DateFormatter.swift
//  TaskManager
//
//  Created by Tanner York on 11/27/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import UIKit

class Formatter {
    static let shared = Formatter()
    
    let dateFormatter = DateFormatter()
    let date = Date()
    let calendar = Calendar.current
    
    func currentHour() -> Int {
        let hour = calendar.component(.hour, from: date)
        return hour
    }
    
    func currentMinutes() -> Int {
        let minutes = calendar.component(.minute, from: date)
        return minutes
    }
    
    func formatDateFromString(_ string: String) -> Date? {
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        guard let date = dateFormatter.date(from: string) else {
            return nil
        }
        return date
    }
    
    func formatStringFromDate(_ date: Date) -> String? {
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        let date = dateFormatter.string(from: date)
        return date
    }
    
}

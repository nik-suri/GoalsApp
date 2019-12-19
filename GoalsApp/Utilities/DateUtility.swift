//
//  DateUtility.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/19/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import Foundation

extension Date {
    var shortDateTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
    
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    /// Returns an appropriately rendered string for date differences
    func offsetString(from date: Date) -> String {
        let daysDiff = self.days(from: date)
        if daysDiff != 0 {
            return "\(daysDiff) days"
        }
        
        let hoursDiff = self.hours(from: date)
        if hoursDiff != 0 {
            return "\(hoursDiff) hours"
        }
        
        let minutesDiff = self.minutes(from: date)
        if minutesDiff != 0 {
            return "\(minutesDiff) minutes"
        }
        
        let secondsDiff = self.seconds(from: date)
        return "\(secondsDiff) seconds"
    }
}

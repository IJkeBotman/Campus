//
//  DateExtensions.swift
//  Campus WatchKit Extension
//
//  Created by IJke Botman on 17/01/2018.
//  Copyright © 2018 IJke Botman. All rights reserved.
//

import UIKit

extension Date {
    
    func roundedToMidnight() -> Date {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: self)
        
        // Round date to next day if past noon, 12:00 PM
        if dateComponents.hour! >= 12 {
            let newDate = calendar.date(byAdding: DateComponents(calendar: calendar, day: 1), to: self)!
            dateComponents = calendar.dateComponents([.year, .month, .day], from: newDate)
        }
        
        // Create components for midnight, 12:00 AM
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        
        let newDate = calendar.date(from: dateComponents)!
        return newDate
    }
    
    /**
     This adds a new method adding to Date.
     
     It returns a new date by adding the specified minutes to the receiver
     
     :param: minutes: The minutes to add, can be positive or negative
     
     :returns: a new Date on the same year/month/day as the receiver, but adding the specified minutes value
     */
    
    func adding(minutes: Int) -> Date {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        let newDate = calendar.date(byAdding: DateComponents(calendar: calendar, minute: minutes), to: self)!
        
        return newDate
    }
    
    /**
     This adds a new method dateAt to Date.
     
     It returns a new date at the specified hours and minutes of the receiver
     
     :param: hours: The hours value
     :param: minutes: The new minutes
     
     :returns: a new Date with the same year/month/day as the receiver, but with the specified hours/minutes values
     */
    
    func dateAt(_ hours: Int, minutes: Int) -> Date {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        //get the month/day/year components for this instance's date
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        
        // Create components for specified time.
        dateComponents.hour = hours
        dateComponents.minute = minutes
        dateComponents.second = 0
        
        let newDate = calendar.date(from: dateComponents)!
        return newDate
    }
}

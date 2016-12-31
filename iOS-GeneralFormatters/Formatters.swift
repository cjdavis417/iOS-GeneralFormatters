//
//  Formatters.swift
//  iOS-GeneralFormatters
//
//  Created by Christopher Davis on 12/31/16.
//  Copyright © 2016 Monkey Face LLC. All rights reserved.
//

import Foundation


class Formatters {
    
    // formats an Date to a user friendly date string
    func formattedDate(_ formatDate: Date, style: String) -> String {
        let dateFormatter = DateFormatter()
        
        if style == "long" {
            dateFormatter.dateStyle = DateFormatter.Style.long
        } else if style == "medium" {
            dateFormatter.dateStyle = DateFormatter.Style.medium
        } else if style == "none" {
            dateFormatter.timeStyle = DateFormatter.Style.none
        }
        return dateFormatter.string(from: formatDate)
    }
    
    // formats Date to a user friendly time string
    func formattedTime(_ formatTime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.none
        dateFormatter.timeStyle = DateFormatter.Style.medium
        return dateFormatter.string(from: formatTime)
    }
    
    // converts integer to "hour : minute : second"
    func formattedTimer(_ duration: Int) -> String {
        let second = duration % 60
        let minute = (duration / 60) % 60
        let hour = duration / 3600
        return String(format: "%02d:%02d:%02d", hour, minute, second)
    }
    
    // turn a time string into an Integer of value second
    func timerToInt(_ textTime: String) -> Int {
        var intTime = 0
        let separators = CharacterSet(charactersIn: ":")
        var brokenParts = textTime.components(separatedBy: separators)
        print(brokenParts)
        let hour = Int(brokenParts[0])!
        let minute = Int(brokenParts[1])!
        let second = Int(brokenParts[2])!
        intTime = (hour * 60 * 60) + (minute * 60) + (second)
        return intTime
    }
    
    // formats a string of format of date to a Date
    func stringToDate(_ strDate: String) -> Date {
        let userCalendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = userCalendar
        dateFormatter.dateFormat = "YYYY-MM-dd hh:mm:ss zzzz"
        return dateFormatter.date(from: strDate)!
    }
    
    // converts an Date to a String of same format
    func dateToString(_ dateDate: Date) -> String {
        let userCalender = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = userCalender
        return dateFormatter.string(from: dateDate)
    }
    
    // compiles two Date strings to one of type Date
    func compileDate(_ date: String, time: String) -> String {
        let range1 = date.characters.index(date.startIndex, offsetBy: 10)..<date.endIndex
        let range2 = time.startIndex..<time.characters.index(time.startIndex, offsetBy: 11)
        var newDate = date
        var newTime = time
        newDate.removeSubrange(range1)
        newTime.removeSubrange(range2)
        return "\(newDate) \(newTime)"
    }
    
    // function that returns one particular component of an NSDate string
    func splitDateApart(_ savedDate: Date, dateComponent: String) -> String {
        let calendar = Calendar.current
        let dateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second, NSCalendar.Unit.nanosecond], from: savedDate)
        var result: String
        
        switch dateComponent {
        case "year":
            result = String(describing: dateComponents.year!)
            return result
        case "month":
            result = String(describing: dateComponents.month!)
            return result
        case "day":
            result = String(describing: dateComponents.day!)
            return result
        case "hour":
            result = String(describing: dateComponents.hour!)
            return result
        case "minute":
            result = String(describing: dateComponents.minute!)
            return result
        case "second":
            result = String(describing: dateComponents.second!)
            return result
        case "weekOfYear":
            result = String(describing: dateComponents.weekOfYear!)
            return result
        default:
            break
        }
        return "something went wrong"
    }
    
}



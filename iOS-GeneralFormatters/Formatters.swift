//
//  Formatters.swift
//  iOS-GeneralFormatters
//
//  Created by Christopher Davis on 12/31/16.
//  Last edited on 2/10/18
//

import Foundation


class Formatters {
    
    // formats an NSDate to a user friendly date string
    func formattedDate(_ formatDate: Date, style: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        switch style {
        case "full":
            dateFormatter.dateStyle = DateFormatter.Style.full
        case "long":
            dateFormatter.dateStyle = DateFormatter.Style.long
        case "medium":
            dateFormatter.dateStyle = DateFormatter.Style.medium
        case "short":
            dateFormatter.dateStyle = DateFormatter.Style.short
        case "none":
            dateFormatter.timeStyle = DateFormatter.Style.none
        default:
            dateFormatter.dateStyle = DateFormatter.Style.full
        }
       
        return dateFormatter.string(from: formatDate)
    }
    
    // formats and NSDate to a user friendly time string
    func formattedTime(_ formatTime: Date, style: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.none
        
        switch style {
        case "full":
            dateFormatter.timeStyle = DateFormatter.Style.full
        case "long":
            dateFormatter.timeStyle = DateFormatter.Style.long
        case "medium":
            dateFormatter.timeStyle = DateFormatter.Style.medium
        case "short":
            dateFormatter.timeStyle = DateFormatter.Style.short
        default:
            dateFormatter.timeStyle = DateFormatter.Style.full
        }
        
        return dateFormatter.string(from: formatTime)
    }
    
    // returns string of hour: minute: seconds from a integer
    // Int() -> "00:00:00"
    func formattedTimer(_ duration: Int) -> String {
        let second = duration % 60
        let minute = (duration / 60) % 60
        let hour = duration / 3600
        return String(format: "%02d:%02d:%02d", hour, minute, second)
    }
    
    // returns a Double to a string
    // Double() -> "00:00:00"
    func formattedTimerDouble(_ duration: Double) -> String {
        let intDur = Int(duration)
        let second = intDur % 60
        let minute = (intDur / 60) % 60
        let hour = intDur / 3600
        return String(format: "%02d:%02d:%02d", hour, minute, second)
    }
    
    // turn a time string into an Integer of value second
    // "00:00:00" -> Int()
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
    
    // convers a string to a Date()
    // the string first should look just like the Date() format.
    // "YYYY-MM-dd hh:mm:ss zzzz" to Date()
    func stringToDate(_ strDate: String) -> Date {
        let userCalendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = userCalendar
        dateFormatter.dateFormat = "YYYY-MM-dd hh:mm:ss zzzz"
        return dateFormatter.date(from: strDate)!
    }
    
    //  converts a Date() to a String of same format as Date()
    func dateToString(_ nsdateDate: Date) -> String {
        let userCalender = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = userCalender
        return dateFormatter.string(from: nsdateDate)
    }
    
    // compiles two Date strings to one of type NSDate
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
    
    // i'm questioning this one.
    func bSameDate(date1: Date, date2: Date) -> Bool {
        var bIsSameDate: Bool!
        let userCalendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = userCalendar
        dateFormatter.dateStyle = .full
        let firstDate = dateFormatter.string(from: date1)
        let secondDate = dateFormatter.string(from: date2)
        print("fist: \(firstDate), second: \(secondDate)")
        if firstDate == secondDate {
            print(firstDate)
            print(secondDate)
            bIsSameDate = true
        } else {
            bIsSameDate = false
        }
        return bIsSameDate
    }
    
    // This computes an end date from the start Date and Duration
    // start Date() + duration = end Date()
    func autoWOEnd(_ start: Date, duration: String) -> Date {
        let dur = Double(timerToInt(duration))
        let endDate = start.addingTimeInterval(dur)
        
        return endDate
    }
}



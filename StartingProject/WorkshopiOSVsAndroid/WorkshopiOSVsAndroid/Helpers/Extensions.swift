//
//  Extensions.swift
//  WorkshopiOSVsAndroid
//
//  Created by Daniel Reyes Sánchez on 26/03/18.
//  Copyright © 2018 Daniel Reyes Sánchez. All rights reserved.
//

import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        let quotient: Int
        let unit: String
        if secondsAgo < minute {
            quotient = secondsAgo
            unit = "seg"
        } else if secondsAgo < hour {
            quotient = secondsAgo / minute
            unit = "min"
        } else if secondsAgo < day {
            quotient = secondsAgo / hour
            unit = "hr"
        } else if secondsAgo < week {
            quotient = secondsAgo / day
            unit = "día"
        } else if secondsAgo < month {
            quotient = secondsAgo / week
            unit = "semana"
        } else {
            quotient = secondsAgo / month
            unit = "mes"
        }
        return "Actualizado hace \(quotient) \(unit)\(quotient == 1 ? "" : "s")"
    }
}

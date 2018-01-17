//
//  Census.swift
//  Campus WatchKit Extension
//
//  Created by IJke Botman on 17/01/2018.
//  Copyright © 2018 IJke Botman. All rights reserved.
//

import Foundation

let measurementIntervalMinutes = 30
let daysOfRecord = 5
var measurementsPerDay: Int {
    return 60 * 24 / measurementIntervalMinutes
}

struct Census {
    let attendance: Int
    let timestamp: Date
}

var censuses: [Census] = {
    // Campus configuration
    let campusPopulation = 5000
    let maxExpectedAttendance = 0.8 // 0...1 percentage
    
    // Sine wave serves as bell curve distribution
    let sineArraySize = measurementsPerDay
    let frequency = 1.0
    let phase = .pi / -2.0
    let amplitude = Double(campusPopulation) / 2 * maxExpectedAttendance
    let maxVariation = 1 - maxExpectedAttendance
    
    return (0..<daysOfRecord).map { dayIndex in
        (0..<sineArraySize).map {
            let interior = 2 * .pi / Double(sineArraySize) * Double($0) * frequency + phase
            let y = amplitude * sin(interior) + amplitude
            let randomVariation = drand48() * (maxVariation * 2) - maxVariation
            let adjustedY = y * (1 + randomVariation)
            let attendance = Int(round(adjustedY))
            let timestamp = Date().roundedToMidnight().addingTimeInterval(-TimeInterval(($0 + 1) * measurementIntervalMinutes * 60 + dayIndex * 60 * 60 * 24))
            return Census(attendance: attendance, timestamp: timestamp)
        }
        }.flatMap { $0 }.reversed()
}()

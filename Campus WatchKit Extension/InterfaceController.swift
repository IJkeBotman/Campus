//
//  InterfaceController.swift
//  Campus WatchKit Extension
//
//  Created by IJke Botman on 17/01/2018.
//  Copyright © 2018 IJke Botman. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    var isDrawing = false
    let graphGenerator = GraphGenerator(settings: WatchGraphGeneratorSettings())
    @IBOutlet var graphImage: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        
        generateImage()
    }
    
    // Preparing data
    
    func stringFromHighlightedIndex() -> String {
        return String()
    }
    
    func preparedData() -> [Census] {
        
        let minRange = censuses.count - measurementsPerDay
        
        let maxRange = censuses.count
        
        let data = Array(censuses[minRange..<maxRange])
        
        return data
    }
    
    func preparedDemarcations() -> [GraphDemarcation] {
        let censusesAroundMidnight = preparedData().enumerated().filter() {
            index, element in
            let date = element.timestamp
            let maxDate = date.roundedToMidnight().adding(minutes: measurementIntervalMinutes / 2)
            let minDate = date.roundedToMidnight().adding(minutes: -measurementIntervalMinutes / 2)
            return date >= minDate && date <= maxDate
        }
        let demarcations: [GraphDemarcation] = censusesAroundMidnight.map() {
            index, element in
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return GraphDemarcation(title: formatter.string(from: element.timestamp), index: index)
        }
        return demarcations
    }
    
    func generateImage() {
        
        // Avoid drawing the graph when there's no data or when a draw is already in progress
        guard !preparedData().isEmpty && !isDrawing else {
            return
        }
        
        isDrawing = true
        
        DispatchQueue.global(qos: .background).async {
            
            let data = self.preparedData().map{Double($0.attendance)}
            
            let demarcations = self.preparedDemarcations()
            
            let image = self.graphGenerator.image(self.contentFrame.size, with: data, demarcations: demarcations)
            
            DispatchQueue.main.async {
                self.graphImage.setImage(image)
                self.isDrawing = false
            }
        }
    }
    
    // Handling interactions
    
    func handleInteraction(_ delta: Double) {
    }
}


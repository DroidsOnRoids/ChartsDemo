//
//  ViewController.swift
//  ChartsDemo
//
//  Created by Piotr Sochalewski on 22.03.2016.
//  Copyright © 2016 Droids On Roids. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var barChart: BarChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customization
        barChart.descriptionText = ""
        barChart.xAxis.labelPosition = .Bottom
        barChart.xAxis.setLabelsToSkip(0)
        barChart.leftAxis.axisMinValue = 0.0
        barChart.leftAxis.axisMaxValue = 1000.0
        barChart.rightAxis.enabled = false
        barChart.xAxis.drawGridLinesEnabled = false
        barChart.legend.enabled = false
        barChart.scaleYEnabled = false
        barChart.scaleXEnabled = false
        barChart.pinchZoomEnabled = false
        barChart.doubleTapToZoomEnabled = false
        barChart.highlighter = nil
        
        // Get and prepare the data
        let sales = DataGenerator.data()
        
        // Initialize an array to store chart data entries (values; y axis)
        var salesEntries = [ChartDataEntry]()
        
        // Initialize an array to store months (labels; x axis)
        var salesMonths = [String]()
        
        var i = 0
        for sale in sales {
            // Create single chart data entry and append it to the array
            let saleEntry = BarChartDataEntry(value: sale.value, xIndex: i)
            salesEntries.append(saleEntry)
            
            // Append the month to the array
            salesMonths.append(sale.month)
            
            i += 1
        }
        
        // Create bar chart data set containing salesEntries
        let chartDataSet = BarChartDataSet(yVals: salesEntries, label: "Profit")
        chartDataSet.colors = ChartColorTemplates.joyful()
        
        // Create bar chart data with data set and array with values for x axis
        let chartData = BarChartData(xVals: salesMonths, dataSets: [chartDataSet])
        
        // Set bar chart data to previously created data
        barChart.data = chartData
        
        // Animation
        barChart.animate(yAxisDuration: 1.5, easingOption: .EaseInOutQuart)
    }
}
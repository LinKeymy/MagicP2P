////
////  AssetDetailHeader.swift
////  magic
////
////  Created by SteveLin on 2017/6/27.
////  Copyright © 2017年 SteveLin. All rights reserved.
////
//
//import UIKit
//import Charts
//
//class AssetDetailHeader: UIView {
//    
//    
//    @IBOutlet weak var chartSuperView: UIView!
//    @IBOutlet weak var chartView: PieChartView!
//    
//    var parties = ["Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
//                   "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
//                   "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
//                   "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
//                   "Party Y", "Party Z"]
//    
//    
//    override func didMoveToWindow() {
//        super.didMoveToWindow()
//        chartView.animate(xAxisDuration: 1.4, easingOption: .easeInOutBack)
//    }
//    
//    
//    func setupChartView () {
//        chartView.usePercentValuesEnabled = true
//        chartView.drawSlicesUnderHoleEnabled = false
//        chartView.holeRadiusPercent = 0.58
//        chartView.transparentCircleRadiusPercent = 0.61
//        chartView.chartDescription?.enabled = false
//        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
//        
//        
//        chartView.drawCenterTextEnabled = true
//        
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = .center
//        paragraphStyle.lineBreakMode = .byTruncatingTail
//        
//        let centerText = NSMutableAttributedString(string: "总资产\n28363.17")
//        centerText.setAttributes([NSFontAttributeName: self.font(name: "HelveticaNeue-Light", size: 13),NSParagraphStyleAttributeName:paragraphStyle], range: NSRange(location: 0, length: centerText.length))
////        
//        centerText.setAttributes([NSFontAttributeName: self.font(name: "HelveticaNeue-Light", size: 18),NSForegroundColorAttributeName:TinColor.button], range: NSRange(location: 3, length: centerText.length - 3))
////
////        centerText.setAttributes([NSFontAttributeName:self.font(name: "HelveticaNeue-LightItalic", size: 11)], range: NSRange(location: centerText.length - 19, length: 19))
//        chartView.centerAttributedText = centerText
//        
//        chartView.drawHoleEnabled = true
//        chartView.rotationAngle = 0
//        chartView.rotationEnabled = false
//        chartView.highlightPerTapEnabled  = true
//        
//        let l = chartView.legend
//        l.horizontalAlignment = .right
//        l.verticalAlignment = .top
//        l.orientation = .vertical
//        l.drawInside = false
//        l.xEntrySpace = 7.0
//        l.yEntrySpace = 7.0
//        l.yOffset = 0.0
//    }
//    
//    
//    func setData(count:Int,range:Double){
//        let mult = range
//        
//        var values = [PieChartDataEntry]()
//        for i in 0..<count {
//            let pie = PieChartDataEntry(value: Double(arc4random_uniform(UInt32(mult)))  + mult / 5, label: parties[i % parties.count])
//            values.append(pie)
//        }
//        
//        let dataSet = PieChartDataSet(values: values, label: "平台资产分布")
//        
//        dataSet.drawIconsEnabled = false
//        dataSet.sliceSpace = 2.0
//        
//        dataSet.iconsOffset = CGPoint(x: 0, y: 40)
//        var colors = [UIColor]()
//        colors = colors + ChartColorTemplates.vordiplom()
//        colors = colors + ChartColorTemplates.joyful()
//        colors = colors + ChartColorTemplates.colorful()
//        colors = colors + ChartColorTemplates.liberty()
//        colors = colors + ChartColorTemplates.pastel()
//        colors.append(UIColor(red: 51.0 / 255, green: 181 / 255.0, blue: 229.0 / 255, alpha: 1))
//        dataSet.colors = colors
//        
//        let data = PieChartData(dataSets: [dataSet])
//        
//        let pFormatter = NumberFormatter()
//        pFormatter.numberStyle = .percent
//        pFormatter.maximumFractionDigits = 1
//        pFormatter.multiplier = NSNumber(value: 1.0)
//        pFormatter.percentSymbol = " %"
//        
//        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
//        data.setValueFont(self.font(name: "HelveticaNeue-Light", size: 11))
//        data.setValueTextColor(UIColor.white)
//        chartView.data = data
//        chartView.highlightValue(nil)
//    }
//    
//    func font(name:String,size:CGFloat) -> UIFont {
//        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
//    }
//
//}
//

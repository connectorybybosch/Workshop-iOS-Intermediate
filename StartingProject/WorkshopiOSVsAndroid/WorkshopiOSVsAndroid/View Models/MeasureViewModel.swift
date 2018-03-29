//
//  MeasureViewModel.swift
//  WorkshopiOSVsAndroid
//
//  Created by Daniel Reyes Sánchez on 29/03/18.
//  Copyright © 2018 Daniel Reyes Sánchez. All rights reserved.
//

import UIKit

class MeasureViewModel: CardRepresentable {
    
    var measure:Measure
    var rowHeight: CGFloat = 200
    
    var timeAgo:String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = formatter.date(from: measure.time) else {return ""}
        return date.timeAgoDisplay()
    }
    
    
    init(measure:Measure) {
        self.measure = measure
    }
    
    func cellInstance(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MeasureCell.cellId, for: indexPath) as! MeasureCell
        // TODO:- Setup of the Cell
        return cell
    }
    
    
}

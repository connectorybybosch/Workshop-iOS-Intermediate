//
//  MeasureCell.swift
//  WorkshopiOSVsAndroid
//
//  Created by Daniel Reyes Sánchez on 25/03/18.
//  Copyright © 2018 Daniel Reyes Sánchez. All rights reserved.
//

import UIKit

class MeasureCell: UITableViewCell {
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet var cards: [UIView]!
    @IBOutlet weak var circleView: UIView!
    
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    static let cellId = "measureCellId"
    static let nibName = "MeasureCell"
    
    
    func setup(viewModel:MeasureViewModel) {
        idLabel.text = "\(viewModel.measure.id)"
        timeAgoLabel.text = "\(viewModel.timeAgo)"
        temperatureLabel.text = "\(viewModel.measure.temp)"
        xLabel.text = "\(viewModel.measure.acc[0])"
        yLabel.text = "\(viewModel.measure.acc[1])"
        zLabel.text = "\(viewModel.measure.acc[2])"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.layer.cornerRadius = circleView.frame.width / 2
        wrapperView.layer.cornerRadius = 10
        for card in cards {
            card.layer.cornerRadius = 5
        }
    }
    
}

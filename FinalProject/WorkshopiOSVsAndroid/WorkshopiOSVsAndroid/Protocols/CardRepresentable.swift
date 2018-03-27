//
//  CardRepresentable.swift
//  WorkshopiOSVsAndroid
//
//  Created by Daniel Reyes Sánchez on 26/03/18.
//  Copyright © 2018 Daniel Reyes Sánchez. All rights reserved.
//

import UIKit

protocol CardRepresentable {
    var rowHeight: CGFloat {get}
    func cellInstance(_ tableView:UITableView, _ indexPath:IndexPath) -> UITableViewCell
}

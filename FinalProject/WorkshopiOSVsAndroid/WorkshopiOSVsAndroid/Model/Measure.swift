//
//  Measures.swift
//  WorkshopiOSVsAndroid
//
//  Created by Daniel Reyes Sánchez on 25/03/18.
//  Copyright © 2018 Daniel Reyes Sánchez. All rights reserved.
//

import Foundation

struct Measure:Decodable {
    let id:Int
    let time:String
    let temp:Float
    let acc:[Float]
}




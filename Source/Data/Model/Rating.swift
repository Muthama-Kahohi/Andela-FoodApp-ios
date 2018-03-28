//
//  Rating.swift
//  FoodApp-ios
//
//  Created by Martin Mungai on 28/03/2018.
//  Copyright © 2018 Paul Kahohi. All rights reserved.
//

import Foundation

struct Rating {
    let id: Int
    let comment: String
    let date: Date
    let mealID: String
    let values: [Int: Int]
}

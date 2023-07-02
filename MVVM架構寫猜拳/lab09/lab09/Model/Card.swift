//
//  Card.swift
//  lab09
//
//  Created by User on 2021/5/19.
//

import SwiftUI

struct Card {
    //let imageRank: ImageRank
    let rank: Rank
 
    enum Rank: String, CaseIterable {
        case scissor = "剪刀"
        case stone = "石頭"
        case paper = "布"
    }
}


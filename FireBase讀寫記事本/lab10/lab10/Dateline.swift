//
//  Dateline.swift
//  lab10
//
//  Created by User on 2021/5/26.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Dateline: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let isfinish: String
    let endDate: Date
}


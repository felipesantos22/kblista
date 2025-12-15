//
//  Item.swift
//  Calendary
//
//  Created by Felipe Santos on 08/11/25.
//

import SwiftData
import Foundation

@Model
class Appointment {
    var patientName: String
    var isDone: Bool = false
    var date: Date

    init(patientName: String,isDone: Bool = false, date: Date) {
        self.patientName = patientName
        self.isDone = isDone
        self.date = date
    }
}

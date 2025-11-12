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
    var date: Date

    init(patientName: String, date: Date) {
        self.patientName = patientName
        self.date = date
    }
}

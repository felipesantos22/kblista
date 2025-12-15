//
//  FinishedAppointment.swift
//  Calendary
//
//  Created by Felipe Santos on 12/12/25.
//

import SwiftUI
import SwiftData

struct FinishedAppointmentsView: View {
    
    @Query(
        filter: #Predicate<Appointment> { $0.isDone },
        sort: \Appointment.date
    )
    
    private var appointments: [Appointment]
    
    var body: some View {
        List {
            ForEach(appointments) { appointment in
                VStack(alignment: .leading) {
                    Text(appointment.patientName)
                        .font(.headline)
                    
                    Text(
                        appointment.date.formatted(
                            date: .abbreviated,
                            time: .shortened
                        )
                    )
                    .foregroundColor(.gray)
                }
            }
        }
    }
    
}

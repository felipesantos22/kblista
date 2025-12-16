//
//  FinishedAppointment.swift
//  Calendary
//
//  Created by Felipe Santos on 12/12/25.
//

import SwiftUI
import SwiftData

struct FinishedAppointmentsView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(
        filter: #Predicate<Appointment> { $0.isDone },
        sort: \Appointment.date
    )
    private var appointments: [Appointment]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.colorOne, .colorTwo]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
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
                .onDelete(perform: deleteAppointments) // 👈 aqui
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
        }
    }
    
    // MARK: - Delete
    private func deleteAppointments(at offsets: IndexSet) {
        for index in offsets {
            let appointment = appointments[index]
            modelContext.delete(appointment)
        }
    }
    
}

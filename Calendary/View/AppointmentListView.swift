//
//  AgendaView.swift
//  Calendary
//
//  Created by Felipe Santos on 08/11/25.
//

import SwiftUI
import SwiftData

struct AppointmentListView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    // Mostra apenas consultas NÃO finalizadas
    @Query(
        filter: #Predicate<Appointment> { !$0.isDone },
        sort: \Appointment.date
    )
    private var appointments: [Appointment]
    
    @ObservedObject var viewModel: AppointmentViewModel
    
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
                    NavigationLink {
                        EditAppointmentView(
                            appointment: appointment,
                            viewModel: viewModel
                        )
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(appointment.patientName)
                                .font(.headline)
                            
                            Text(
                                appointment.date.formatted(
                                    date: .abbreviated,
                                    time: .shortened
                                )
                            )
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                    }
                    // 👉 Swipe para finalizar (única forma)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            viewModel.toggleDone(
                                appointment,
                                context: modelContext
                            )
                        } label: {
                            Label("Finalizar", systemImage: "checkmark")
                        }
                        .tint(.green)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewModel.deleteAppointment(
                            appointments[index],
                            context: modelContext
                        )
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}


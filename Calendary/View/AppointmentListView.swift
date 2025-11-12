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
    
    @Query(sort: \Appointment.date, order: .forward)
    private var appointments: [Appointment]
    
    @ObservedObject var viewModel: AppointmentViewModel
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.colorOne, .colorTwo]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            List {
                ForEach(appointments) { appointment in
                    VStack(alignment: .leading) {
                        
                        Text(appointment.patientName)
                            .font(.headline)
                        
                        Text(appointment.date.formatted(date: .abbreviated, time: .shortened))
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewModel.deleteAppointment(appointments[index], context: modelContext)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    NavigationStack {
        AppointmentListView(viewModel: AppointmentViewModel())
            .modelContainer(for: Appointment.self, inMemory: true)
    }
}

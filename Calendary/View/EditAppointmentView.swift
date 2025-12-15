//
//  SwiftUIView.swift
//  Calendary
//
//  Created by Felipe Santos on 17/11/25.
//

import SwiftUI

struct EditAppointmentView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var appointment: Appointment
    @ObservedObject var viewModel: AppointmentViewModel
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.colorOne, .colorTwo]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Form {
                TextField("Nome do Paciente", text: $appointment.patientName)
                
                DatePicker("Data", selection: $appointment.date)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Editar Consulta")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        viewModel.updateAppointment(appointment, context: modelContext)
                        dismiss()
                    }
                }
            }
        }
    }
    
}


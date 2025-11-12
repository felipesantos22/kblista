//
//  ContentView.swift
//  Calendary
//
//  Created by Felipe Santos on 08/11/25.
//

import SwiftUI
import SwiftData

struct AddAppointmentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = AppointmentViewModel()
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.colorOne, .colorTwo]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                TextField("Nome", text: $viewModel.patientName)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                DatePicker("Data do agendamento",
                           selection: $viewModel.selectedDate,
                           displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.compact)
                .padding(.horizontal)
                
                Button {
                    viewModel.addAppointment(context: modelContext)
                } label: {
                    Text("Adicionar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.black)
                        .cornerRadius(4)
                }
                .padding(.horizontal)
                .padding(.top)
                Spacer()
            }
            .safeAreaPadding()
        }
        
    }
}

#Preview {
    NavigationStack {
        AddAppointmentView()
            .modelContainer(for: Appointment.self, inMemory: true)
    }
}

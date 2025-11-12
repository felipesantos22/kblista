//
//  HomeViewModel.swift
//  Calendary
//
//  Created by Felipe Santos on 09/11/25.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class AppointmentViewModel: ObservableObject {
    
    @Published var patientName: String = ""
    @Published var selectedDate: Date = Date()
    
    func addAppointment(context: ModelContext) {
        guard !patientName.isEmpty else { return }
        
        let newAppointment = Appointment(patientName: patientName, date: selectedDate)
        context.insert(newAppointment)
        
        do {
            try context.save()
            patientName = ""
            selectedDate = Date()
        } catch {
            print("Error saving appointment: \(error.localizedDescription)")
        }
    }
    
    func deleteAppointment(_ appointment: Appointment, context: ModelContext) {
        context.delete(appointment)
        try? context.save()
    }
    
}

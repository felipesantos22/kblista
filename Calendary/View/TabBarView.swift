//
//  TabBarView.swift
//  Calendary
//
//  Created by Felipe Santos on 08/11/25.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject private var viewModel = AppointmentViewModel()
    
    var body: some View {
        TabView {
            
            NavigationStack {
                AddAppointmentView()
                    .navigationTitle("Novo Agendamento")
            }
            .tabItem {
                Label("Agendar", systemImage: "house")
            }
            
            NavigationStack {
                AppointmentListView(viewModel: viewModel)
                    .navigationTitle("Agendados")
            }
            .tabItem {
                Label("Agendados", systemImage: "magnifyingglass")
            }
        }.tint(.black)
    }
    
}

#Preview {
    TabBarView()
}


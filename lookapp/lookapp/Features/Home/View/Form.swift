
import SwiftUI

struct Form: View {
    @StateObject private var shiftViewModel = ShiftViewModel()
    @StateObject private var sesionManager=SessionManager.shared
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 16) {
                    TextField("Nombre", text: $shiftViewModel.shiftUiState.shiftDetails.nombre)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onAppear {
                                                    if shiftViewModel.shiftUiState.shiftDetails.nombre.isEmpty || !shiftViewModel.shiftUiState.shiftDetails.nombre.isEmpty {
                                                        shiftViewModel.updateNombre(SessionManager.shared.userName)
                                                    }
                                                }
                    
                  
                    DropDownMenu(
                        label: "Nombre del Negocio",
                        options: shiftViewModel.sitios.map { $0.name },
                        selectedOption: $shiftViewModel.shiftUiState.shiftDetails.negocio,
                        onOptionSelected: { shiftViewModel.onSelectNegocio($0) }
                    )
                    
                
                    if !shiftViewModel.shiftUiState.shiftDetails.negocio.isEmpty {
                        DropDownMenu(
                            label: "Servicio",
                            options: shiftViewModel.servicios,
                            selectedOption: $shiftViewModel.shiftUiState.shiftDetails.servicio,
                            onOptionSelected: { shiftViewModel.onSelectServicio($0) }
                        )
                    }
                    
                
                    DatePickerField(
                        selectedDate: $shiftViewModel.shiftUiState.shiftDetails.fecha,
                        label: "Fecha"
                    )
                    
                    DropDownMenu(
                        label: "Horario",
                        options: ["9:00-10:00", "10:00-11:00", "11:00-1:00"],
                        selectedOption: $shiftViewModel.shiftUiState.shiftDetails.horario,
                        onOptionSelected: { shiftViewModel.updateHorario($0) }
                    )
                    
                    HStack {
                        Spacer()
                        
                        Button("Cancelar") {
                            shiftViewModel.clearForm()
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Agendar") {
                            shiftViewModel.insertShift()
                            shiftViewModel.clearForm()
                            shiftViewModel.showDialog()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding(16)
            }
        }
        .alert("Cita Agendada", isPresented: $shiftViewModel.showConfirmationDialog) {
            Button("Aceptar") {
                shiftViewModel.dismissDialog()
            }
        } message: {
            Text("Tu cita ha sido agendada exitosamente.")
        }
    }
}

struct DropDownMenu: View {
    let label: String
    let options: [String]
    @Binding var selectedOption: String
    let onOptionSelected: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selectedOption = option
                        onOptionSelected(option)
                    }
                }
            } label: {
                HStack {
                    Text(selectedOption.isEmpty ? "Seleccionar..." : selectedOption)
                        .foregroundColor(selectedOption.isEmpty ? .secondary : .primary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
        }
    }
}

struct DatePickerField: View {
    @Binding var selectedDate: Date?
    let label: String
    @State private var showDatePicker = false
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "es_ES")
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Button {
                showDatePicker = true
            } label: {
                HStack {
                    Text(selectedDate?.formatted(date: .abbreviated, time: .omitted) ?? "DD/MM/YYYY")
                        .foregroundColor(selectedDate == nil ? .secondary : .primary)
                    Spacer()
                    Image(systemName: "calendar")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
        }
        .sheet(isPresented: $showDatePicker) {
            NavigationView {
                DatePicker(
                    "Selecciona una fecha",
                    selection: Binding(
                        get: { selectedDate ?? Date() },
                        set: { selectedDate = $0 }
                    ),
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .navigationTitle("Seleccionar Fecha")
                .navigationBarItems(
                    leading: Button("Cancelar") {
                        showDatePicker = false
                    },
                    trailing: Button("Aceptar") {
                        showDatePicker = false
                    }
                )
            }
        }
    }
}

#Preview {
    Form()
}

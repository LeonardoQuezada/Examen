import SwiftUI

struct ContentView: View {
    // Variables para capturar la entrada del usuario
    @State private var dni: String = ""
    @State private var nombre: String = ""
    @State private var apellido: String = ""
    @State private var numeroCarrera: String = ""
    
    // Variables para mostrar los resultados
    @State private var pension: Double = 0.0
    @State private var descuento1: Double = 0.0
    @State private var descuento2: Double = 0.0
    @State private var totalDescuento: Double = 0.0
    @State private var totalPagar: Double = 0.0
    
    // Estado para la navegación
    @State private var showPrintView = false
    
    var body: some View {
        NavigationStack {
            ScrollView {  // Hacemos que todo el contenido sea desplazable
                VStack(spacing: 20) {
                    // Título
                    Text("Matrícula de Alumnos")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    // DNI
                    TextField("Ingrese DNI", text: $dni)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Nombre
                    TextField("Ingrese Nombre", text: $nombre)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Apellido
                    TextField("Ingrese Apellido", text: $apellido)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Información de las carreras
                    Text("Carreras disponibles: \n1. Odio Emular Ventura en VirtualBox \n2. 30 minutos para emular Ventura en VMWare \n3. Se que puedo emular Ventura en VirtualBox")
                        .font(.subheadline)
                        .padding(.bottom, 10)
                        .foregroundColor(.gray)
                    
                    // Número de carrera
                    TextField("Ingrese Número de Carrera (1-3)", text: $numeroCarrera)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Botón Calcular
                    Button(action: calcularValores) {
                        Text("CALCULAR")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    // Resultados
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Resultados:")
                            .font(.headline)
                        Text("Pensión: S/ \(pension, specifier: "%.2f")")
                        Text("Descuento 1: S/ \(descuento1, specifier: "%.2f")")
                        Text("Descuento 2: S/ \(descuento2, specifier: "%.2f")")
                        Text("Total Descuento: S/ \(totalDescuento, specifier: "%.2f")")
                        Text("Total a Pagar: S/ \(totalPagar, specifier: "%.2f")")
                    }
                    .padding()
                    
                    // Botón Imprimir
                    Button(action: {
                        // Verificar que los cálculos se hayan realizado antes de navegar
                        if pension > 0 {
                            showPrintView = true
                        } else {
                            // Mostrar una alerta si no se han realizado los cálculos
                            print("Realice primero los cálculos")
                        }
                    }) {
                        Text("IMPRIMIR")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            
            // NavigationLink dentro del NavigationStack
            NavigationLink(value: showPrintView) {
                EmptyView()
            }
            .hidden()
            .background(
                NavigationLink(destination: PrintView(dni: dni, nombre: nombre, apellido: apellido, pension: pension, descuento1: descuento1, descuento2: descuento2, totalDescuento: totalDescuento, totalPagar: totalPagar, carrera: numeroCarrera), isActive: $showPrintView) {
                    EmptyView()
                }
            )
        }
    }
    
    // Función para realizar los cálculos
    func calcularValores() {
        guard let carrera = Int(numeroCarrera), carrera >= 1 && carrera <= 3 else {
            // Validar que el número de carrera sea válido
            pension = 0.0
            descuento1 = 0.0
            descuento2 = 0.0
            totalDescuento = 0.0
            totalPagar = 0.0
            return
        }
        
        // Crear una instancia de la clase Matricula
        let matricula = Matricula(dni: dni, nombre: nombre, apellido: apellido, numeroCarrera: carrera)
        
        // Obtener los valores calculados
        pension = matricula.pension()
        descuento1 = matricula.descuento1()
        descuento2 = matricula.descuento2()
        totalDescuento = matricula.totalDescuento()
        totalPagar = matricula.totalPagar()
    }
}

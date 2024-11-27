import SwiftUI

struct PrintView: View {
    var dni: String
    var nombre: String
    var apellido: String
    var pension: Double
    var descuento1: Double
    var descuento2: Double
    var totalDescuento: Double
    var totalPagar: Double
    var carrera: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Resumen de Matrícula")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Resumen de datos ingresados
            VStack(alignment: .leading, spacing: 10) {
                Text("DNI: \(dni)")
                Text("Nombre: \(nombre) \(apellido)")
                Text("Número de Carrera: \(carrera)")
                Text("Pensión: S/ \(pension, specifier: "%.2f")")
                Text("Descuento 1: S/ \(descuento1, specifier: "%.2f")")
                Text("Descuento 2: S/ \(descuento2, specifier: "%.2f")")
                Text("Total Descuento: S/ \(totalDescuento, specifier: "%.2f")")
                Text("Total a Pagar: S/ \(totalPagar, specifier: "%.2f")")
            }
            .padding()
            
            // Imagen según la carrera seleccionada
            Image(systemName: carreraImagen())
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            Spacer()
        }
        .padding()
    }
    
    // Función para devolver la imagen según la carrera seleccionada
    func carreraImagen() -> String {
        switch carrera {
        case "1":
            return "star.fill" // Imagen para la primera carrera
        case "2":
            return "heart.fill" // Imagen para la segunda carrera
        case "3":
            return "cloud.fill" // Imagen para la tercera carrera
        default:
            return "questionmark.circle" // Imagen por defecto
        }
    }
}

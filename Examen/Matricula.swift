protocol PMetodos {
    func pension() -> Double
    func descuento1() -> Double
    func descuento2() -> Double
    func totalDescuento() -> Double
    func totalPagar() -> Double
}

class Matricula: PMetodos {
    var dni: String
    var nombre: String
    var apellido: String
    var numeroCarrera: Int
    
    init(dni: String, nombre: String, apellido: String, numeroCarrera: Int) {
        self.dni = dni
        self.nombre = nombre
        self.apellido = apellido
        self.numeroCarrera = numeroCarrera
    }
    
    func pension() -> Double {
        switch numeroCarrera {
        case 1: return 780.0
        case 2: return 700.0
        case 3: return 640.0
        default: return 0.0
        }
    }
    
    func descuento1() -> Double {
        let descuentoPorcentaje: Double
        switch numeroCarrera {
        case 1: descuentoPorcentaje = 0.05
        case 2: descuentoPorcentaje = 0.12
        case 3: descuentoPorcentaje = 0.12
        default: descuentoPorcentaje = 0.0
        }
        return pension() * descuentoPorcentaje
    }
    
    func descuento2() -> Double {
        return (numeroCarrera == 1 || numeroCarrera == 2) ? 50.0 : 0.0
    }
    
    func totalDescuento() -> Double {
        return descuento1() + descuento2()
    }
    
    func totalPagar() -> Double {
        return pension() - totalDescuento()
    }
}

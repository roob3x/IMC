//
//  ImcViewModel.swift
//  IMC
//
//  Created by Roberto Filho on 15/02/23.
//

import Foundation
import Combine

class ImcViewModel: ObservableObject {
    
    @Published var theight: String = ""
    @Published var tweight: String = ""
    @Published var result: String = ""
    @Published var image: String = ""
    @Published var hiddenkeyboard: Bool = false
    
    var imc: Double = 0
    
    init() {
        
    }
    func calcImc(){
        if let weight = Double(tweight), let height = Double(theight) {
            puts("ENTREI NO CALCULO")
            imc = weight  / pow(height, 2)
            showResults()
        }
    }
    
 func showResults() -> String {
        switch imc {
        case 0..<16:
            result = "Magreza"
            image = "abaixo"
            hiddenkeyboard = true
        case 16..<18.5:
            result = "Abaixo do peso"
            image = "abaixo"
            hiddenkeyboard = true
        case 18..<25:
            result = "Peso ideal"
            image = "ideal"
            hiddenkeyboard = true
        case 25..<30:
            result = "Sobrepeso"
            image = "sobre"
            hiddenkeyboard = true
        default:
            result = "Obsesidade"
            image = "obesidade"
            hiddenkeyboard = true
        }
     return image
    }
}

//
//  HomeView.swift
//  IMC
//
//  Created by Roberto Filho on 14/02/23.
//

import SwiftUI

struct ImcView: View {
    @ObservedObject var viewModel: ImcViewModel
    
    var placeholder: String = ""

    var body: some View {
        ScrollView(showsIndicators: false){
            Group {
                ZStack(alignment: .center){
                    VStack(alignment: .center, spacing: 25) {
                        Spacer()
                        Text("Calculo do IMC")
                            .font(Font.system(.largeTitle).bold())
                            .foregroundColor(.white)
                        Text("Descubra o seu índice de massa Corporal")
                            .foregroundColor(.white)
                        HStack(alignment: .top) {
                            Text("Peso(Kg)")
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.white)
                            Text("Altura(m)")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        }
                        HStack {
                            TextField("Ex: 90", text: $viewModel.tweight)
                            .textFieldStyle(CustomTextFieldStyle())
                                .foregroundColor(.gray)
                                .background(.white)
                                .multilineTextAlignment(.leading)
                                .keyboardType(.numberPad)
                            TextField("Ex: 1.82", text: $viewModel.theight)
                                .textFieldStyle(CustomTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.gray)
                                .background(.white)
                                .keyboardType(.numberPad)
                        }
                        .padding(.horizontal, 120)
                        
                        Button("Calcular"){
                            viewModel.calcImc()
                            UIApplication.shared.endEditing()
                        }
                        .background(.yellow)
                        .padding(.bottom,10)
                    }
                }
                .background(Color(red: -0.008, green: 0.705, blue: 0.763))
                .frame(maxWidth: .infinity)

                actualImc
                
        }
        }
        .ignoresSafeArea()
    }
}

extension ImcView {
    var actualImc: some View {
        ZStack {
            VStack(alignment: .center){
                Text("Seu Índice de Massa Corporal é")
                    .foregroundColor(.gray)
                TextField(placeholder, text: $viewModel.result)
                    .multilineTextAlignment(.center)
                    .font(.title.bold())
                Spacer()
                Image("\(viewModel.image)")
                    .scaledToFit()
            }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
        }
    }
}

struct ImcView_Previews: PreviewProvider {
    static var previews: some View {
        ImcView(viewModel: ImcViewModel(), placeholder: "")
    }
}

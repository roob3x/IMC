//
//  SplashViewModel.swift
//  IMC
//
//  Created by Roberto Filho on 15/02/23.
//

import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    @Published var uiState: SplashUiState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.uiState = .goToImc
        }
    }
    
}

extension SplashViewModel {
    func imcView() -> some View {
        return SplashViewRouter.makeImcView()
    }
}

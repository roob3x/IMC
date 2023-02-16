//
//  SplashViewRouter.swift
//  IMC
//
//  Created by Roberto Filho on 15/02/23.
//

import SwiftUI

enum SplashViewRouter {
    static func makeImcView() -> some View {
        return ImcView(viewModel: ImcViewModel())
    }
}

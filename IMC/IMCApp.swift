//
//  IMCApp.swift
//  IMC
//
//  Created by Roberto Filho on 24/11/22.
//

import SwiftUI

@main
struct IMCApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}

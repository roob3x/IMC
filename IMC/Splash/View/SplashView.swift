//
//  ContentView.swift
//  IMC
//
//  Created by Roberto Filho on 24/11/22.
//

import SwiftUI

struct SplashView: View {

    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                LoadingView()
            case .goToImc:
                viewModel.imcView()
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image("LaunchScreen")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel())
    }
}

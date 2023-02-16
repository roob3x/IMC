//
//  CustomTextFieldStyle.swift
//  IMC
//
//  Created by Roberto Filho on 14/02/23.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 4)
            .padding(.vertical, 8)
            .overlay(RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.blue, lineWidth: 0.8 ))
    }
}

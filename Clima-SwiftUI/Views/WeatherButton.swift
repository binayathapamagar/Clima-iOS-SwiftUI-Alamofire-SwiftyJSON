//
//  WeatherButton.swift
//  Clima-SwiftUI
//
//  Created by Binaya on 06/08/2021.
//

import SwiftUI

struct WeatherButton: View {
    var buttonImageName: String
    var function: () -> Void
    
    var body: some View {
        Button(action: function) {
            Image(systemName: buttonImageName)
                .resizable()
                .foregroundColor(.black)
        }
        .frame(width: 30, height: 30)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(buttonImageName: "location.circle.fill", function: {})
            .previewLayout(.sizeThatFits)
    }
}

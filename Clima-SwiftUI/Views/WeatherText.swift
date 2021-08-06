//
//  WeatherText.swift
//  Clima-SwiftUI
//
//  Created by Binaya on 06/08/2021.
//

import SwiftUI

struct WeatherText: View {
    var degrees: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    
    
    var body: some View {
        Text(degrees)
            .font(.system(size: fontSize))
            .fontWeight(fontWeight)
    }
}

struct WeatherText_Previews: PreviewProvider {
    static var previews: some View {
        WeatherText(degrees: "25", fontSize: 100, fontWeight: .black).previewLayout(.sizeThatFits)
    }
}

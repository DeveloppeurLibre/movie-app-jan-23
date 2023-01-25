//
//  RatingView.swift
//  MovieProject
//
//  Created by Quentin Cornu on 25/01/2023.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .foregroundColor(Color.white.opacity(0.2))
            Circle()
                .trim(from: 0, to: CGFloat(rating) / 10)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .foregroundColor(.orange)
                .rotationEffect(.degrees(-90))
//            Text(String(format: "%.1f", max(0, min(rating, 10))))
            Text(String(format: "%.1f", rating))
                .foregroundColor(.white)
        }
        .frame(width: 50, height: 50)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RatingView(rating: 0)
            RatingView(rating: 3.7)
            RatingView(rating: 7.8347372)
        }
        .padding()
        .background(Color.black)
    }
}

//
//  MovieCellView.swift
//  MovieProject
//
//  Created by Quentin Cornu on 25/01/2023.
//

import SwiftUI

struct Movie: Decodable {
    let imageExtension: String
    let title: String
    let description: String
    let rating: Float
    
    enum CodingKeys: String, CodingKey/*SANS LE S*/ {
        case imageExtension = "poster_path"
        case title
        case description = "overview"
        case rating = "vote_average"
    }
}

struct MovieCellView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.imageExtension)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray)
            }
            .frame(width: 100, height: 150)
            .clipped()
            .cornerRadius(10)
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.title)
                        .font(.title2)
                        .bold()
                    Spacer()
                    RatingView(rating: movie.rating)
                }
                Text(movie.description)
                    .lineLimit(4)
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct MovieCellView_Previews: PreviewProvider {
    
    static let previewMovie = Movie(
        imageExtension: "/xBl5AGw7HXZcv1nNXPlzGgO4Cfo.jpg",
//        imageURL: URL(string: "https://www.themoviedb.org/t/p/w1280"),
        title: "M3GAN",
        description: "M3GAN est une merveille d'intelligence artificielle, une poupée réaliste qui est programmée pour être la meilleure compagne d'un enfant et la meilleure alliée d'un parent. Conçue par Gemma, une brillante roboticienne, M3GAN peut écouter, regarder et apprendre, car elle joue le rôle d'amie et d'enseignante, de compagne de jeu et de protectrice.",
        rating: 7.3
    )
    
    static var previews: some View {
        MovieCellView(movie: previewMovie)
            .background(.black)
    }
}

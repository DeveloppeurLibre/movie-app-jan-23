//
//  HomeView.swift
//  MovieProject
//
//  Created by Quentin Cornu on 25/01/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var loadedMovie: Movie? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                
                if loadedMovie != nil {
                    MovieCellView(movie: loadedMovie!)
                } else {
                    Text("Loading...")
                        .foregroundColor(.white)
                }
                
                Button {
                    loadData()
                } label: {
                    Text("Fetch data...")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity)
        }
        
    }
    
    func loadData() {
        Task.init {
            let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=\(API_KEY)")!

            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                
                let myNewMovie = try jsonDecoder.decode(Movie.self, from: data)
                
                self.loadedMovie = myNewMovie
            } catch {
                print("❌")
                print(error)
                print("❌")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .background(.black)
    }
}

//
//  HomeView.swift
//  MovieProject
//
//  Created by Quentin Cornu on 25/01/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Button {
            loadData()
        } label: {
            Text("Fetch data...")
        }

    }
    
    func loadData() {
        Task.init {
            let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=ee6b2b9e0970948e6741d6b7985191fb")!

            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                
                let myNewMovie = try jsonDecoder.decode(Movie.self, from: data)
                
                
            } catch {
                print(error)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

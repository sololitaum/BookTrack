import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var books: [Book]

    var genres: [String] {
        let uniqueGenres = Set(books.map { $0.genre }).sorted()
        return ["All Books"] + uniqueGenres
    }

    var body: some View {
        TabView {
            ForEach(genres, id: \.self) { genre in
                GenreView(genre: genre)
                    .tabItem {
                        Label(genre, systemImage: "book")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

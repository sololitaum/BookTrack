import SwiftData
import SwiftUI

struct GenreView: View {
    @Environment(\.modelContext) var modelContext
    let genre: String
    @Query var books: [Book]
    @State private var searchText = ""

    var filteredBooks: [Book] {
        books.filter { book in
            (book.genre == genre || genre == "All Books") &&
            (searchText.isEmpty ||
             book.title.localizedCaseInsensitiveContains(searchText) ||
             book.genre.localizedCaseInsensitiveContains(searchText))
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredBooks) { book in
                    NavigationLink(destination: EditBook(book: book)) {
                        VStack(alignment: .leading) {
                            Text(book.title).font(.headline)
                            Text("\(book.rating) ★").foregroundColor(.yellow)
                            Text(book.genre).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle(genre)
            .searchable(text: $searchText, prompt: "Search books...")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addBook) {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
        }
    }

    func addBook() {
        let book = Book(title: "New Book", genre: genre == "All Books" ? "" : genre)
        modelContext.insert(book)
    }

    func deleteBook(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(filteredBooks[index])
        }
    }
}

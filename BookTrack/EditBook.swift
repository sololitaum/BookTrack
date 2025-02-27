import SwiftUI

struct EditBook: View {
    @Bindable var book: Book
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Section {
                TextField("Book Title", text: $book.title)
                    .textContentType(.name)
                    .autocorrectionDisabled()
                
                TextField("Genre", text: $book.genre)
                    .autocapitalization(.words)
            }
            
            Section("Rating") {
                Picker("Rate this book", selection: $book.rating) {
                    ForEach(0..<6) { i in
                        Text("\(i) ★").tag(i)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Review") {
                TextEditor(text: $book.review)
                    .frame(height: 150)
            }
        }
        .navigationTitle("Edit Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") { dismiss() }
                    .disabled(book.title.trimmingCharacters(in: .whitespaces).isEmpty)
            }
        }
    }
}

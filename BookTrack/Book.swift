import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var genre: String
    var rating: Int
    var review: String

    init(title: String, genre: String, rating: Int = 0, review: String = "") {
        self.title = title
        self.genre = genre
        self.rating = rating
        self.review = review
    }
}


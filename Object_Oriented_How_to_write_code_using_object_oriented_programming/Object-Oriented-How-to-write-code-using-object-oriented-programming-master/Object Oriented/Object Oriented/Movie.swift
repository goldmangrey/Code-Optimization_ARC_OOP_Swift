import Foundation

class Movie {
    
    // Variables
    var title: String
    var image: String
    var year: String
    var rating: String
    var description: String
    
    // Initialization
    init(title: String, image: String, year: String, rating: String, description: String) {
        self.title = title
        self.image = image
        self.year = year
        self.rating = rating
        self.description = description
    }
    
    // Function
    func details() -> String {
        
        let movieDetails = "\(description)\n\n Year: \(year)   |   Rating: \(rating)"
        return movieDetails
    }
}

import UIKit

class ViewController: UIViewController {
    
    // Movies Data
    private var moviesData = MoviesData.array
    
    private var moviesList = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        parseMoviesDataIntoMovieObject()
    }
    
    // Parse MoviesData into Movie object
    func parseMoviesDataIntoMovieObject() {
        for movie in moviesData {
            let title = movie["title"] ?? ""
            let image = movie["image"] ?? "noImageAvailable"
            let year = movie["year"] ?? ""
            let rating = movie["rating"] ?? ""
            let description = movie["description"] ?? ""
            
            // An object is created, and added to an array
            moviesList.append(Movie(title: title, image: image, year: year, rating: rating, description: description))
        }
    }


}

// MARK: TableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return moviesData.count
        
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //let movie = moviesData[indexPath.row]
        
        let movie = moviesList[indexPath.row]
        
        if let movieCell = cell as? MovieTableViewCell {
            movieCell.setCellWithValuesOf(movie)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let movie = moviesData[indexPath.row]
//        showAlert(movie["title"] ?? "",  "\(movie["description"] ?? "")\n\n Year: \(movie["year"] ?? "")   |   Rating: \(movie["rating"] ?? "")")
        
        let movie = moviesList[indexPath.row]
        showAlert(movie.title, movie.details())
    }
    
    // MARK: Show Alert
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}


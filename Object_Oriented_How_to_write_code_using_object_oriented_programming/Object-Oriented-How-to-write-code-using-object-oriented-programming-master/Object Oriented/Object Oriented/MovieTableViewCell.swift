import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
//    func setCellWithValuesOf(_ movie: [String : Any]) {
//        movieTitle.text = movie["title"] as? String
//        if let image = movie["image"] as? String {
//            movieImage.image = UIImage(named: image)
//        }
//    }
    
    func setCellWithValuesOf(_ movie: Movie) {
        movieTitle.text = movie.title
        movieImage.image = UIImage(named: movie.image)
    }
    

}

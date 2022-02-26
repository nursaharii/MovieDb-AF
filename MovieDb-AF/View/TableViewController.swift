//
//  TableViewController.swift
//  MovieDb-AF
//
//  Created by Nurşah on 26.02.2022.
//

import UIKit
import Alamofire
import SDWebImage
class TableViewController: UITableViewController {
    var films: [Results] = []
    var filteredFilms: [Results] = []
    var lowerSearch = ""
    @IBOutlet weak var searchBar: UISearchBar!
    var category = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        switch category {
        case 1:
            parse(url:"https://api.themoviedb.org/3/movie/top_rated?api_key=a9ea809948d550b5fd072da0e0c24293&language=en-US&page=1")
            
        case 2:
            parse(url:"https://api.themoviedb.org/3/movie/popular?api_key=a9ea809948d550b5fd072da0e0c24293&language=en-US&page=1")
        case 3:
            parse(url:"https://api.themoviedb.org/3/movie/now_playing?api_key=a9ea809948d550b5fd072da0e0c24293&language=en-US&page=1")
        case 4:
            parse(url:"https://api.themoviedb.org/3/movie/upcoming?api_key=a9ea809948d550b5fd072da0e0c24293&language=en-US&page=1")
        default:
            return
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredFilms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! TableViewCell
        let film = filteredFilms[indexPath.row]
        cell.title.text = film.title
        cell.detail.text = film.overview
        cell.img.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w200\(film.posterPath)"))
        return cell
    }
    
    func parse (url: String) {
      AF.request(url)
        .validate()
        .responseDecodable(of: Movie.self) { (response) in
          guard let movies = response.value else { return }
            self.films = movies.results
            self.filteredFilms = movies.results
            print(self.filteredFilms)
          self.tableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    func search() {
        if (lowerSearch == "") {
          filteredFilms = films
        return
      }
        filteredFilms = films.filter({ film in
        if let _ = film.title.lowercased().range(of: searchBar.text!,options: .caseInsensitive) {
          return true
        }
        return false
      })
    }
        
    
}

// MARK: - UISearchBarDelegate
extension TableViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        lowerSearch = searchBar.text!.lowercased()
        self.search()
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        lowerSearch = ""
        searchBar.resignFirstResponder()
        self.search()
        tableView.reloadData()
    }
}
        // MARK: - UIImageView
        extension UIImageView {
            func load(urlString : String) {
                guard let url = URL(string: urlString)else {
                    return
                }
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.image = image
                            }
                        }
                    }
                }
            }
        }


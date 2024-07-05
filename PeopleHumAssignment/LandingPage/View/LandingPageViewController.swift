//
//  ViewController.swift
//  PeopleHumAssignment
//
//  Created by Shubham Baliyan on 05/07/24.
//

import UIKit

class LandingPageViewController: UIViewController{
    
    var viewModel = EpisodesViewModel()
    
    @IBOutlet weak var movieCollectionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchEpisodesData()
    }
    
    func setupTableView() {
        movieCollectionTableView.delegate = self
        movieCollectionTableView.dataSource = self
        movieCollectionTableView.register(UINib(nibName: "MovieCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieCollectionTableViewCell")
    }
    
    func fetchEpisodesData() {
        viewModel.fetchEpisodes { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.movieCollectionTableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch episodes: \(error.localizedDescription)")
                // Handle error
            }
        }
    }
}

extension LandingPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCollectionTableViewCell", for: indexPath) as? MovieCollectionTableViewCell else {
            return UITableViewCell()
        }
        
        let episode = viewModel.episodes[indexPath.row]
        cell.animeTitle.text = episode.title
        cell.animeScore.text = "Score: \(episode.score)"
        cell.animeUrl.text = "URL: \(episode.url)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension LandingPageViewController: UITableViewDelegate {
    // Implement delegate methods as needed
}

import Foundation

class EpisodesViewModel {
    var episodes: [Episode] = []
    
    func fetchEpisodes(completion: @escaping (Result<Void, Error>) -> Void) {
        // Implement API fetching logic here
        guard let url = URL(string: "https://api.jikan.moe/v4/anime/1/episodes") else {
            completion(.failure(NSError(domain: "URL Error", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(error ?? NSError(domain: "Data Error", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data)
                self.episodes = response.data
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


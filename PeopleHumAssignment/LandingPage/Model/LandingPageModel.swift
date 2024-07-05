import Foundation

struct Response: Codable {
    let pagination: Pagination
    let data: [Episode]
}

struct Pagination: Codable {
    let lastVisiblePage: Int
    let hasNextPage: Bool
    
    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
    }
}

struct Episode: Codable {
    let malId: Int
    let url: URL
    let title: String
    let titleJapanese: String
    let titleRomanji: String
    let aired: Date
    let score: Double
    let filler: Bool
    let recap: Bool
    let forumUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case malId = "mal_id"
        case url
        case title
        case titleJapanese = "title_japanese"
        case titleRomanji = "title_romanji"
        case aired
        case score
        case filler
        case recap
        case forumUrl = "forum_url"
    }
}


import Foundation

/**
    Represent a decodable collection of cities.
 */
struct Cities: Decodable {
    /**
        Get all cities.
     */
    let cities: [City]

    enum CodingKeys: String, CodingKey {
        case cities = "photos"
    }
}

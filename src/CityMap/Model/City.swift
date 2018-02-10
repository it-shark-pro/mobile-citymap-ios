import Foundation

/**
    Represent a codable city model with basic media and textual information.
 */
struct City: Codable {
    /**
        Get the name of the city.
     */
    let name: String

    /**
        Get brief description of the city.
     */
    let description: String

    /**
        Get url to city photo. Could be empty, if city doesn't have appropriate picture of it.
     */
    let imageUrl: URL?

    /**
        Get location of the city on the map.
     */
    let location: Location

    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.imageUrl = nil
        self.location = Location(latitude: 0, longitude: 0)
    }

    init(from decoder: Decoder) throws {
        // Parse city from decodable container.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.imageUrl = try container.decode(URL.self, forKey: .image)

        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.location = Location(latitude: latitude, longitude: longitude)
    }

    func encode(to encoder: Encoder) throws {
        // Serialize city to the codable container.
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(imageUrl, forKey: .image)
        try container.encode(location.latitude, forKey: .latitude)
        try container.encode(location.longitude, forKey: .longitude)
    }

    enum CodingKeys: String, CodingKey {
        case name = "title"
        case description = "description"
        case image = "url"
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

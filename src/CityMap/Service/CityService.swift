import Foundation

/**
    A service, that knows how to get cities.
 */
final class CityService {

    /**
        Provide all available cities (predefined values at the current moment).
     */
    let cities: [City] = [
        City(name: "Minsk", description: "Belarus"),
        City(name: "Warsaw", description: "Poland"),
        City(name: "Berlin", description: "Germany"),
        City(name: "Amsterdam", description: "Netherland"),
        City(name: "Oslo", description: "Norway"),
        City(name: "Lisbon", description: "Portugal"),
        City(name: "Madrid", description: "Spain"),
        City(name: "Moskow", description: "Russia"),
        City(name: "Kiev", description: "Ukraine"),
        City(name: "Stockholm", description: "Sweden")
    ]
}

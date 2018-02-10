import Foundation

private enum Constants {
    static let citiesUrl: String = "https://api.myjson.com/bins/7ybe5"
}

/**
    User-friendly type alias for cities loaded callback.

    - parameters:
    - cities: Loaded array of cities.
    - error: Contains error, if some is occured.
*/
typealias CitiesLoadedCallback = (_ cities: [City], _ error: Error?) -> Void

/**
    A class that provides possibility to load cities from internet.
*/
final class CityWebService {

    private let session = URLSession.shared
    private let jsonDecoder = JSONDecoder()

    private init() { }

    /**
        Returns a shared singleton city web service object.
    */
    static let shared: CityWebService = CityWebService()

    /**
        Load, parse and provide cities asynchroniosly from endpoint.

        - parameter callback: The completion handler to call when the cities are loaded and parsed. Could return an empty array of cities. Also, if error occured it's also provided in the callback.
    */
    func cities(callback: @escaping CitiesLoadedCallback) {

        // If city endpoint url is incorrect - return empty array.
        guard let url = URL(string: Constants.citiesUrl) else {
            callback([], nil)
            return
        }

        let urlRequest = URLRequest(url: url)

        let task = session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard let strongSelf = self else {
                callback([], nil)
                return
            }

            if let error = error {
                callback([], error)
                return
            }

            guard let data = data else {
                callback([], nil)
                return
            }

            do {
                let allCities = try strongSelf.jsonDecoder.decode(Cities.self, from: data)
                callback(allCities.cities, nil)
            } catch(let decodeError) {
                print("Can't decode cities with error: \(decodeError)")
                callback([], decodeError)
            }
        }

        task.resume()
    }
}

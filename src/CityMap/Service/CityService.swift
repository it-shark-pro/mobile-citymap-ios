import CoreData

/**
    A class that synchronize local database with cities with remote endpoint.
*/
final class CityService {
    private let cityWebService = CityWebService.shared
    private let coreDataProvider = CoreDataProvider.shared

    /**
        Returns a shared singleton city service object.
    */
    static let shared = CityService()

    private init() { }

    /**
        Load, parse and provide cities asynchroniosly from endpoint (or get cities from the cache if error occured).

        - parameter callback: The completion handler to call when the cities are retrived.
    */
    func cities(callback: @escaping ([City]) -> Void) {
        cityWebService.cities { [weak self] (remoteCities, error) in
            if let _ = error {
                self?.fetchLocalCities(callback: callback)
                return
            }

            self?.storeRemoteCities(using: remoteCities, callback: callback)
        }
    }

    private func fetchLocalCities(callback: @escaping ([City]) -> Void) {
        let context = coreDataProvider.context
        context.perform { [weak self] in
            let cityEntities = self?.fetchCityEntities(from: context) ?? []

            var cities = [City?]()
            for cityEntity in cityEntities {
                cities.append(cityEntity.map())
            }

            callback(cities.compactMap({ $0 }))
        }
    }

    private func storeRemoteCities(using cities: [City], callback: @escaping ([City]) -> Void) {
        let context = coreDataProvider.context
        context.perform { [weak self] in
            let cityEntities = self?.fetchCityEntities(from: context) ?? []

            // Delete all stored cities.
            for cityEntity in cityEntities {
                context.delete(cityEntity)
            }

            // Add new cities to the context.
            for city in cities {
                _ = CityEntity.create(from: city, in: context)
            }

            try? context.save()

            callback(cities)
        }
    }

    private func fetchCityEntities(from context: NSManagedObjectContext) -> [CityEntity] {
        let fetchRequest = NSFetchRequest<CityEntity>(entityName: String(describing: CityEntity.self))
        return (try? context.fetch(fetchRequest)) ?? []
    }
}

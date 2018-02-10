import Foundation
import CoreData

@objc(CityEntity)
public class CityEntity: NSManagedObject {
    /**
        Create city managed object from existed city model.

        - parameters:
            - from city: A city model.
            - in context: Managed object context where creation should be performed.

        - returns: Inited city managed object.
    */
    class func create(from city: City, in context: NSManagedObjectContext) -> CityEntity? {
        let cityEntity = NSEntityDescription.insertNewObject(forEntityName: String(describing: CityEntity.self), into: context) as? CityEntity
        cityEntity?.id = city.id
        cityEntity?.name = city.name
        cityEntity?.imageUrl = city.imageUrl?.absoluteString
        cityEntity?.cityDescription = city.description
        cityEntity?.latitude = city.location.latitude
        cityEntity?.longitude = city.location.longitude
        return cityEntity
    }


    /**
        Map city managed object into city model.

        - returns: Valid city model if mapping is done without error. Otherwise, nil.
    */
    func map() -> City? {
        return City(from: self)
    }
}

private extension City {
    /**
        Create city model from existed city managed object.

        - parameter from city: A city managed object.
        - returns: Valid city model if mapping is done without error. Otherwise, nil.
     */
    init?(from entity: CityEntity) {
        guard let url = entity.imageUrl else {
            return nil
        }

        self.id = entity.id
        self.name = entity.name
        self.imageUrl = URL(string: url)
        self.description = entity.cityDescription ?? ""
        self.location = Location(latitude: entity.latitude, longitude: entity.longitude)
    }
}

import Foundation
import CoreData

extension CityEntity {
    @NSManaged public var id: Int
    @NSManaged public var name: String
    @NSManaged public var imageUrl: String?
    @NSManaged public var cityDescription: String?
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
}

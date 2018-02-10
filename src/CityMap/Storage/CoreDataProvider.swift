import CoreData

/**
    Core data facade that configure data stack provides managed object contexts.
*/
final class CoreDataProvider {
    /**
        Returns a shared singleton core data provider object.
    */
    static let shared = CoreDataProvider()

    private let stack = CoreDataStack(modelName: "CityMap")

    private init() { }

    /**
        Returns main managed object context.
    */
    var context: NSManagedObjectContext {
        return stack.managedObjectContext
    }
}

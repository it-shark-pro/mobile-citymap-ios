import UIKit

/**
    City detail controller to show information about specific city.
 */
final class CityDetailViewController: UIViewController {
    /**
        Get currently represented city or set the new city to update detail page information.
        If you set nil value, city information will be cleared from page.
     */
    var city: City?

    @IBOutlet private weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = city?.name
        descriptionLabel.text = city?.description
    }
}

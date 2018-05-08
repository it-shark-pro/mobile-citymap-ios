import UIKit
import Kingfisher

private enum Constants {
    // Placeholder image for the cities that don't have photo (has the same name as appropriate image in assets folder).
    static let cityImagePlaceholder = "CityPlaceholder"
}

/**
    City detail controller to show information about specific city.
 */
final class CityDetailViewController: UIViewController {
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!

    /**
        Get currently represented city or set the new city to update detail page information.
        If you set nil value, city information will be cleared from page.
     */
    var city: City?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }

    private func setupData() {
        guard let city = city else {
            return
        }

        title = city.name
        descriptionLabel.text = city.description

        // Set image using url to the image view using kingfisher extension.
        cityImage.kf.setImage(with: city.imageUrl, placeholder: UIImage(named: Constants.cityImagePlaceholder))
    }
}

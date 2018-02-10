import UIKit
import Kingfisher

private enum Constants {
    // Placeholder image for the cities that don't have photo (has the same name as appropriate image in assets folder).
    static let cityImagePlaceholder = "CityPlaceholder"
}

/**
    Custom collection view cell to show brief information about the city it contains.
 */
class CityViewCell: UICollectionViewCell {

    @IBOutlet private weak var cityImage: UIImageView!
    @IBOutlet private weak var cityLabel: UILabel!

    /**
        Get currently represented city from cell or set the new city to update cell information.
        If you set nil value, city information will be cleared from cell.
    */
    var city: City? {
        didSet {
            update()
        }
    }

    private func update() {
        cityLabel.text = city?.name

        // Set image using url to the image view using kingfisher extension.
        cityImage.kf.setImage(with: city?.imageUrl, placeholder: UIImage(named: Constants.cityImagePlaceholder))
    }

    override func prepareForReuse() {
        // Before reuse the cell - clear it ...
        cityLabel.text = nil
        // ... and cancel image loading using Kingfisher extension.
        cityImage.kf.cancelDownloadTask()
    }
}

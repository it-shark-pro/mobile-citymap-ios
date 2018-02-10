import UIKit

/**
    Custom table view cell to show brief information about the city it contains.
 */
final class CityTableViewCell: UITableViewCell {
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

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
        descriptionLabel.text = city?.description
    }

    override func prepareForReuse() {
        // Before reuse the cell - clear it.
        city = nil
    }
}
